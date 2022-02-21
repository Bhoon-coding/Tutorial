# Tutorial
몰랐던 기능들을 블로깅하며 정리하기 위한 소스코드

## 확인방법 

![스크린샷 2022-02-21 오전 11 14 23](https://user-images.githubusercontent.com/64088377/154878324-c1ff04d6-6806-4f1c-bebb-3434ed383190.png)


1. Main 스토리보드에서 해당부분을 클릭
2. 좌측 Navigators에서 확인하고자하는 ViewController 이름을 3번에 기입 
3. 우측 Inspectors - Custom Class - Class에 해당 ViewController 이름을 입력.



## Done


1. [UITextField](#uitextfield)
2. [Alamofire](#alamofire)
3. [Local notification](#local-notification)

### UITextField

- UITextField placeholder 위치 조정
<img width="288" alt="스크린샷 2022-02-21 오전 11 07 43" src="https://user-images.githubusercontent.com/64088377/154877534-2e78f1f2-dcd3-46dd-b035-7f9a69cc2db0.png">


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




