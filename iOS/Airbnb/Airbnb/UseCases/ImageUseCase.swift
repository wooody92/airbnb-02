//
//  ImageUseCase.swift
//  Airbnb
//
//  Created by kimdo2297 on 2020/05/28.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

final class ImageUseCase {
    enum Notification: Observable {
        static let update = Foundation.Notification.Name("imageDidDownload")
    }
    
    private let networkDispatcher: NetworkDispatcher
    private let urlsQueue = DispatchQueue(label: "urls.serial.queue")
    
    init(networkDispatcher: NetworkDispatcher) {
        self.networkDispatcher = networkDispatcher
    }
    
    func request(imageURL: URL) {
        urlsQueue.async { [weak self] in
            self?.downloadImage(imageURL: imageURL)
        }
    }
    
    private func downloadImage(imageURL: URL) {
        networkDispatcher.download(url: imageURL) { tempURL, urlResponse, error in
            guard let tempURL = tempURL else { return }
            guard let destinaionURL = ImageCache.suggestedDownloadDestination(
                lastPathComponent: imageURL.lastPathComponent
                ) else { return }
            
            try? FileManager.default.moveItem(at: tempURL, to: destinaionURL)
            NotificationCenter.default.post(
                name: Notification.update,
                object: self,
                userInfo: ["imageURL": imageURL]
            )
        }
    }
}
