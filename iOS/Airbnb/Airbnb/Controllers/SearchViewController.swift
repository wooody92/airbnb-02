//
//  SearchViewController.swift
//  Airbnb
//
//  Created by Chaewan Park on 2020/05/19.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import UIKit

import Alamofire

final class SearchViewController: UIViewController {
    @IBOutlet var filterButtons: [FilterButton]!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let bnbsViewModel = BNBViewModels()
    private let layoutDelegate = BNBsLayout()
    private let bnbsUseCase = BNBsUseCase(bnbsTask: SearchTask(networkDispatcher: BNBsSuccessMock()))
    private let imageUseCase = ImageUseCase(networkDispatcher: AFSession())
    
    private var bnbsToken: NotificationToken?
    private var bnbToken: NotificationToken?
    private var priceToken: NotificationToken?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureObservers()
        configureButtonActions()
        configureCollectionView()
        configureUseCase()
        fetchBNBs()
    }
    
    private func fetchBNBs(search: SearchRequest = SearchRequest()) {
        bnbsUseCase.request(search)
    }
    
    @IBAction func toggleFavorite(_ sender: FavoriteButton) {
        sender.toggle()
    }
    
    private func configureCollectionView() {
        collectionView.dataSource = bnbsViewModel
        collectionView.delegate = layoutDelegate
    }
    
    private func configureObservers() {
        bnbsToken = BNBViewModels.Notification.addObserver { [weak self] _ in
            self?.collectionView.reloadData()
        }
        
        bnbToken = BNBViewModel.Notification.addObserver { [weak self] notification in
            guard let bnbID = notification.userInfo?["bnbID"] as? Int else { return }
            self?.collectionView.reloadItems(at: [IndexPath(row: bnbID - 1, section: 0)])
        }
        
        priceToken = PriceViewController.Notification.addObserver { [weak self] notification in
            guard let minimumPrice = notification.userInfo?["minimumPrice"] as? Int,
                let maximumPrice = notification.userInfo?["maximumPrice"] as? Int else { return }
            
            let min = URLQueryItem(name: "price_min", value: String(minimumPrice))
            let max = URLQueryItem(name: "price_max", value: String(maximumPrice))
            let searchRequest = SearchRequest(path: Endpoints.filter, queryItems: [min, max])
            self?.fetchBNBs(search: searchRequest)
        }
    }
    
    private func configureButtonActions() {
        filterButtons.forEach { button in
            button.action = { [weak self] viewController in
                guard let filterViewController = FilterViewController
                    .instantiate(from: .filters, subViewController: viewController) else { return }
                self?.insertPricesIf(viewController as? PriceViewController)
                self?.present(filterViewController, animated: true)
            }
        }
    }
    
    private func insertPricesIf(_ priceViewController: PriceViewController?) {
        guard let priceViewController = priceViewController else { return }
        
        var prices = [Int: Int]()
        bnbsViewModel.repeatViewModels {
            let price = $0.bnb.price
            if let count = prices[$0.bnb.price] {
                prices.updateValue(count + 1, forKey: price)
            } else {
                prices.updateValue(1, forKey: price)
            }
        }
        priceViewController.priceViewModel = PriceViewModel(prices: prices.sorted(by: <))
    }
    
    private func configureUseCase() {
        bnbsUseCase.updateNotify { [weak self] bnbs in
            guard let bnbs = bnbs else { return }
            
            self?.bnbsViewModel.update(bnbs: bnbs)
            self?.configureImageUseCase(bnbs)
        }
    }
    
    private func configureImageUseCase(_ bnbs: [BNB]) {
        bnbs.forEach {
            $0.images.forEach { urlString in
                guard let url = URL(string: urlString) else { return }
                guard !ImageCache.fileExists(
                    lastPathComponent: url.lastPathComponent
                    ) else { return }
                imageUseCase.request(imageURL: url)
            }
        }
    }
}