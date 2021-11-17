# iOS_Project

## Chapter 02. iOS 앱의 구조와 코코아 터치 프레임워크

### 2.1 앱의 기본 구조

- 엔트리 포인트와 앱의 초기화 과정
  - C언어에 뿌리를 둔 모든 애플리케이션은 main() 함수로부터 시작된다. 이를 엔트리 포인트라고 한다.
  - main() 함수가 하는일
    - main() 함수가 실행된다.
    - main() 함수는 다시 UIApplicationMain() 함수를 호출한다.
    - UIApplicationMain() 함수는 앱의 본체에 해당하는 UIApplication객체를 생성한다.
    - UIApplication 객체는 info.plist 파일을 바탕으로 앱에 필요한 데이터와 객체를 로드한다.
    - AppDelegate객체를 생성하고 UIApplication 객체와 연결한다.
    - 이벤트 루프를 만드는 등의 실행에 필요한 준비를 진행한다.
    - 실행 완료 직전, 앱 델리게이트의 application(\_:didFinishLaunchingWithOptions:) 메소드를 호출한다.
  - Swift는 C언어 기반의 언어가 아니기 때문에 스위프트 기반 프로젝트에는 main.m 파일이 존재하지 않으며 엔트리 포인트 역시 존재하지 않는다. => 스위프트는 위의 과정을 어노테이션 표기로 대체한다.
- MVC 패턴
  - 모델(Model) - 뷰(View) - 컨트롤러(Controller)
  - 모델 : 데이터를 담당
  - 뷰 : 뎅터에 대한 화면 표현을 담당
  - 컨트롤러 : 모델과 뷰 사이에 위치하여 데이터를 가공하여 뷰로 전달, 뷰에서 발생하는 이벤트를 입력받아 처리하는 역할을 담당
  - MVC 패턴의 장점
    - 데이터, 비즈니스 로직을 관리하는 부분과 화면을 구성하는 부분의 코드를 분리함으로서 소스코드를 관리하기 원활하다.
- 앱의 상태 변화
  - Not Running : 앱이 시작되지 않았거나 실행되었지만 시스템에 의해 종료된 상태
  - Inactive : 앱이 전면에서 실행 중이지만 아무런 이벤트를 받지 않고 있는 상태
  - Active : 앱이 전면에서 실행중이며, 이벤트를 받고 있는 상태
  - Background : 앱이 백그라운드에 있지만 여전히 코드가 실행되고 있는 상태, 대부분의 앱은 Suspended 상태로 이행하는 도중에 일시적으로 이 상태에 진입하지만, 파일 다운로드나 업로드, 연산처리 등 여분의 실행 시간이 필요한 앱일 경우 특정 시간 동안 이 상태로 남아있는 경우도 있다.
  - Suspended : 앱이 메모리에 유지되지만 실행되는 코드가 없는 상태, 메모리가 부족한 상황이 오면 iOS시스템은 포그라운드에 있는 앱의 여유 메모리 공간을 확보하기 위해 Suspended 상태에 있는 앱들을 특별한 알림 없이 정리합니다.

### 2.2 iOS와 코코아 터치 프레임 워크

### 2.3 앱을 구성하는 핵심 객체들

- View Controller 상태변화
  - Appearing : 뷰 컨트롤러가 스크린에 등장하기 시작한 순간부터 등장을 완료하기 직전까지의 상태, 퇴장중인 다른 뷰 컨트롤러와 교차하기도 하며 애때 퇴장 중인 다른 뷰 컨트롤러의 상태는 Disappearing이 된다.
  - Appeared : 뷰 컨트롤러가 스크린 전체에 완전히 등장한 상태
  - DisApperaing : 뷰 컨트롤러가 스크린에서 가려지기 시작해서 완전히 가려지기 직전까지의 상태, 또는 퇴장하기 시작해서 완전히 퇴장하기 직전까지의 상태, 이 상태의 뷰 컨트롤러는 새로 등장할 뷰 컨트롤러와 교체하기도 하며 이때 등장 중인 다른 뷰 컨트롤러의 상태는 Appearing
  - Disappeared : 뷰 컨트롤러가 스크린에서 완전히 가려졌거나 혹은 퇴장한 상태