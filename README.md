# AIRBNB

에어비앤비 클론 프로젝트로, `iOS` & `Backend`로 팀을 이루어 3주동안 진행한 프로젝트 입니다. `OAuth`와 `JWT` 그리고 `Interceptor`의 동작 방식을 학습하고, `Github OAuth`를 이용한 로그인 기능을 라이브러리 없이 직접 구현했습니다. 페어 프로그래밍을 진행하며 `PR review`와 `Issue`를 적극 활용하여 팀으로써 함께 발전하며 개발을 진행했습니다.

<br>

## 1. 프로젝트 소개

### Project link

- https://github.com/codesquad-member-2020/airbnb-02



### Skills

- `Java`,` Spring Boot`, `MySQL`, `Spring Data JPA`, `Hibernate`, `AWS EC2`, `AWS RDS`, `AWS VPC`, `NginX`, `OAuth2`, `JWT`, `Git`, `JUnit5`



### ERD

<img width="980" alt="스크린샷 2020-06-05 오후 6 17 20" src="https://user-images.githubusercontent.com/58318041/83974147-0078f580-a926-11ea-914b-0aeb46c429a2.png">



### API 명세

- [포스트맨 문서](https://documenter.getpostman.com/view/10828534/Szt5equ5?version=latest#05601d6a-28cb-4679-84c7-7c466c130df4)

| URL                   | Method | Description             | Response Code |
| --------------------- | ------ | ----------------------- | ------------- |
| /all                  | GET    | 전체 숙소 목록 조회     | 200           |
| /search               | GET    | 숙소 필터링 조회        | 200           |
| /detail/{room_id}     | GET    | 숙소 상세 조회          | 200           |
| /user/favorite/add    | POST   | 숙소 즐겨찾기 추가      | 200           |
| /user/favorite/delete | DELETE | 숙소 즐겨찾기 제거      | 200           |
| /user/favorite/all    | GET    | 숙소 즐겨찾기 목록 조회 | 200           |
| /booking/{room_id}    | POST   | 숙소 예약 추가          | 200           |
| /booking/{room_id}    | DELETE | 숙소 예약 취소          | 200           |

<br>

## 2. 학습 내용

### PR Review

- [1주차 PR](https://github.com/codesquad-member-2020/airbnb-02/pull/33)
- [2주차 PR](https://github.com/codesquad-member-2020/airbnb-02/pull/99)
- [3주차 PR](https://github.com/codesquad-member-2020/airbnb-02/pull/151)
- [페어 리뷰 활동 - 1](https://github.com/codesquad-member-2020/airbnb-02/pull/117)
- [페어 리뷰 활동 - 2](https://github.com/codesquad-member-2020/airbnb-02/pull/150)



### Refactoring

- [리팩토링 - 테이블 연관관계](https://github.com/codesquad-member-2020/airbnb-02/issues/106)
- [리팩토링 - JWT 기반 동작](https://github.com/codesquad-member-2020/airbnb-02/pull/138)
- [리팩토링 - Image Class VO로 변경](https://github.com/codesquad-member-2020/airbnb-02/pull/131)



### Issues

1. `OAuth`와 `JWT`의 동작 방식의 학습을 위해, `Github OAuth`를 이용한 로그인 기능을 라이브러리 없이 직접 구현했습니다. 로그인을 진행하면 `JWT`를 생성하여 `iOS` 요청 양식에 맞추어 응답합니다.
   - [이슈링크](https://github.com/codesquad-member-2020/airbnb-02/issues/50)
2. 인터셉터를 이용하여 `JWT`의 유효성을 검증합니다. 로그인하지 않고 접속하면 게스트 정보로 동작합니다.
   - [이슈링크 - 인터셉터](https://github.com/codesquad-member-2020/airbnb-02/pull/124)
   - [이슈링크 - 게스트](https://github.com/codesquad-member-2020/airbnb-02/pull/141)



### Study Keyword

- [x] @Builder
- [x] Aggregation
- [x] Spring Data JPA
- [x] Stream map
- [x] Stream filter
- [x] OAuth2
- [x] @Transactional (shared lock vs. exclusive lock)
- [x] Static Factory Method
- [x] @Embedded, @Embeddable
- [x] @Enumerated(EnumType.STRING)
- [x] @DateTimeFormat(pattern = "yyyy-MM-dd")
- [x] @Transactional
- [x] Fetch Type(Lazy, Eagal)
- [x] orphanRemoval
- [x] @ElementCollection
- [x] @CollectionTable
