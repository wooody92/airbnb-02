# AIRBNB

##### 2020.05.18 - 2020.06.04

에어비앤비 클론 프로젝트로, `iOS` & `Backend`로 팀을 이루어 3주 동안 진행한 프로젝트 입니다. 백엔드는 2명이었기 때문에 하루 단위로 역할을 바꾸어가며 페어 프로그래밍 방식으로 개발을 진행했습니다. 더 좋은 팀 활동을 위해 애자일 방법론을 지향하며 매일 스크럼을 진행하였고, `GitHub`의 `PR review`와 `Issue`를 적극적으로 활용하여 함께 발전하며 개발을 진행했습니다.

<br>

## # 프로젝트 소개

### Project link

- https://github.com/codesquad-member-2020/airbnb-02
- [iOS 데모화면](https://github.com/codesquad-member-2020/airbnb-02/tree/dev/iOS)



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

## # 학습 내용

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
- [리팩토링 - DB 테이블](https://github.com/codesquad-member-2020/airbnb-02/issues/9)



### Issues

1. `OAuth`와 `JWT`의 동작 방식의 학습을 위해, `Github OAuth`를 이용한 로그인 기능을 라이브러리 없이 직접 구현했습니다. 사용자가 `GitHub OAuth`로 로그인하면 `GitHub` 아이디 정보를 가져오고 그 정보를 `JWT`에 담아 `iOS`의 요청 프로토콜 양식에 맞추어 응답합니다.
   - [이슈링크 - OAuth2](https://github.com/codesquad-member-2020/airbnb-02/issues/50)
2. 인터셉터를 이용하여 `JWT`의 유효성을 검증합니다. 로그인하지 않고 접속하면 게스트 정보로 동작합니다.
   - [이슈링크 - JWT & Interceptor](https://github.com/codesquad-member-2020/airbnb-02/pull/124)
   - [이슈링크 - Guest](https://github.com/codesquad-member-2020/airbnb-02/pull/141)



### 기술적 고민

1. `Service` 계층의 `A-Service`가 다른 `Aggregation root` `Entity`의 `B-Service`를 참조해도 괜찮을까요? 상호 참조가 일어나야 한다면 `Service` 계층과 `Repository` 계층 중 어느 것을 참조하는 것이 좋을까요? #DDD

   - [리뷰어 답변](https://github.com/codesquad-member-2020/airbnb-02/pull/151#issuecomment-639950228)

2. `Room(숙소) 1:N Booking(예약) N:1 User(사용자)`의 관계에서 `Booking`은 어느 `Aggregate`에 가까울까요? 일반적으로는 `Aggreation root`가 삭제되면 같이 삭제되는 범위가 같은 `Aggregate`으로 판단했는데 위의 경우는 양쪽 다 말이 됩니다. 애매한 경우에 판단하는 좋은 팁이 있을까요? #DDD

   - [리뷰어 답변](https://github.com/codesquad-member-2020/airbnb-02/pull/99#discussion_r432819819)

3. 숙소가 예약 가능한지 여부를 확인하는 기능을 구현 시 페어와의 의견 충돌이 있었습니다. 저는 `Booking` 객체가 `for loop`를 순회하며 날짜를 체크하는 방식이 객체 지향적 설계에 가깝다 생각했습니다. 그러나 페어는 다르게 생각하였고 리뷰어의 도움을 받아 해결했습니다. #객체지향

   - [리뷰어 답변](https://github.com/codesquad-member-2020/airbnb-02/pull/99#discussion_r432819457)

   - 최종 코드

     ```java
     // Entity : Room
     
     public boolean isValidDate(LocalDate checkin, LocalDate checkout) {
       if (checkNull(checkin) || checkNull(checkout)) {
         return true;
       }
     
       for (Booking booking : this.bookings) {
         if (!booking.isAvailable(checkin, checkout)) {
           return false;
         }
       }
       return true;
     }
     ```

     ```java
     // Entity : Booking
     
     /**
      *  checkin - checkout 범위에 bookDate 있는지 확인
      *  이미 예약된 bookDate 있으면(예약 불가 하면) false, 없으면(해당 일에 예약 가능 하면) true
      */
     public boolean isAvailable(LocalDate checkin, LocalDate checkout) {
       for (LocalDate date = checkin; date.isBefore(checkout); date = date.plusDays(1)) {
         if (date.equals(this.bookDate)) {
           return false;
         }
       }
       return true;
     }
     ```

   

### Study Keyword

- [x] @Builder
- [x] Aggregation
- [x] DDD
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
