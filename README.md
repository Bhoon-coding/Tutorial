# Tutorial
몰랐던 기능들을 블로깅하며 정리하기 위한 소스코드

## 확인방법 

![스크린샷 2022-02-21 오전 11 14 23](https://user-images.githubusercontent.com/64088377/154878324-c1ff04d6-6806-4f1c-bebb-3434ed383190.png)


1. Main 스토리보드에서 해당부분을 클릭
2. 좌측 Navigators에서 확인하고자하는 ViewController 이름을 3번에 기입 
3. 우측 Inspectors - Custom Class - Class에 해당 ViewController 이름을 입력.



## Done


1. [UITextField](#uitextfield)
2. [UIScrollView](#uiscrollview)
3. [UITableView](#uitableview)
4. [Delegate를 이용한 ViewController간 데이터전달](#delegate를-이용한-viewcontroller간-데이터전달)
5. [Alamofire](#alamofire)
6. [Local notification](#local-notification)

### UITextField

- UITextField placeholder 위치 조정
  - <img width="20%" alt="스크린샷 2022-02-21 오전 11 07 43" src="https://user-images.githubusercontent.com/64088377/154877534-2e78f1f2-dcd3-46dd-b035-7f9a69cc2db0.png">

- (키보드 띄운 상태) 빈화면 터치시 키보드 가리기
  - <img width="20%" src = "https://user-images.githubusercontent.com/64088377/155887671-0207be04-d7b7-4d29-9a9a-3bc5152e9872.gif">



----

### UIScrollView

- UIScrollView 구현
  - <img width="20%" src = "https://user-images.githubusercontent.com/64088377/156502708-959f20d8-65b3-4107-b70a-86918855fb6d.gif">
  - UIscrollView 구성시
    - UIscrollView -> contentsView (width,height 필수로 지정 해야합니다.)


----

### UITableView

- UITableView 구현 
  - tableView에 register()를 이용해 불러올 Cell을 지정 합니다.
  - UITableViewDelegate, UITableViewDataSource를 이용해 Cell 및 테이블뷰를 어떻게 나타낼지 정합니다.
  - viewDidLayoutSubviews 메소드로 테이블뷰의 크기를 정합니다.

  - <img width="20%" alt="스크린샷 2022-03-06 오후 11 35 31" src="https://user-images.githubusercontent.com/64088377/156927902-884a4cbc-f4cf-415e-995b-45f773e66ff7.png">

----

### Delegate를 이용한 ViewController간 데이터전달

- VC2에서 데이터를 입력한 후 저장하면 VC1에 저장되게 구현 하였습니다.
- protocol의 생성, 채택, 위임의 개념과 delegate의 사용 패턴을 파악할수 있는 계기가 되었습니다.


- <img width="20%" src="https://user-images.githubusercontent.com/64088377/158055696-8f1ac5e9-0ede-4995-aa86-54ab8496277b.gif">

----

### Alamofire

- GET 메소드

---

### SceneDelegate


---


### Local Notification

  - UserNotifications 프레임워크를 이용

  - 구현을 위해선 아래 메소드가 필수로 필요
    - content(알림 내용)

    - trigger(알림 시기)
      -  UNTimeintervalNotificationTrigger: 시간간격
      -  UNCalendarNotificationTrigger: 특정시간 
      -  UNLocationNotificationTrigger: 위치

    - request(알림 요청)




