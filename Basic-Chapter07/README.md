# iOS_Project

## Chapter 07. 델리게이트 패턴

일반적인 단어로 사용되는 패턴이랑 반복해서 나타나는 사건이나 형태를 의미한다. 객체지향 프로그래밍에서는 **디자인 패턴(Design Pattern)**이라는 합성 용어로 사용된다, 다지인 패턴이란 컴퓨터 프로그래밍 공학에서는 다양한 설계 문제를 합리적으로 해결하기 위한 목적으로 등장한다.
특정 객체의 값이 바뀌었을 때 여러 객체에 이를 알려주기 위한 방법. 구조를 바꾸지 않고 기능을 변경하거나 개선하기 위한 방법, 하나의 객체만 생성하도록 보장하기 위한 방법 등이 이에 해당하는 문제들이라 할 수 있다.

디자인 패턴은 알고리즘처럼 프로그램 코드로 바로 변환될 수 있는 형태는 아니지만, 특정한 상황에서 구조적 문제를 해결하는 방식을 설명해준다. 이러한 디자인 패턴의 대표격으로 불리는 **GoF(Gang of Four)**라고 불리는 네 명의 컴퓨터 공학자들에 의해 정의된 패턴들이 있으며, 이외에도 널리 알려진 것만 수백가지 종류이다.

대표적 디자인 패턴

1. 팩토리 패턴 (Factory Pattern)
2. 옵저버 패턴 (Observer Pattern)
3. 데코레이터 패턴 (Decorator Pattern)
4. 싱글톤 패턴 (Singleton Pattern)
5. 어댑터 패턴 (Adapter Pattern)
6. 이터레이터 패턴 (Iterator Pattern)
7. 델리게이트 패턴 (Delegate Pattern)

**델리게이트 패턴**? 델리게이트 패턴은 쉽게 말해 객체지향 프로그래밍에서 하나의 객체가 모든 일을 처리하는 것이 아니라 처리해야 할 일 중 일부를 다른 객체에 넘기는 것을 말한다. 기능을 위임할 수 있는 객체가 있다는 것은 그만큼 직접 구현해야 하는 부분이 적다는 뜻이기 때문에 큰 큐모의 프로그램을 빠르게 작성할 수 있다.

## 텍스트 필드

텍스트 필드는 델리게이트 패턴을 사용하는 대표적인 객체 중의 하나, 기본적인 기능은 델리게이트 패턴 없이도 사용할 수 있지만 입력값을 제어하는 등의 고급 기능(특정 문자열의 입력배제, 입력 가능한 무자열 길이 제한 등)을 구현하고 싶을 때에는 델리게이트 패턴을 적용해야 한다.

텍스트 필드에 델리게이트를 적용할 때의 작업

1. 텍스트 필드에 대한 델리게이트 프로토콜을 구현
   - 델리게이트 패턴을 구현하기 위해서는 모든 객체는 그에 맞는 델리게이트 프로토콜을 구현해야한다 이때 프로토콜의 이름은 항상 객체의 클래스명 + Delegate로 이루어진다.
   - 텍스트 필드의 경우 UITextFieldDelegate가 된다.
2. 텍스트 필드의 델리게이트 속성을 뷰 컨트롤러에 연결
   - 델리게이트 속성이란 델리게이트 메소드가 구현되어 있는 객체를 의미한다.
   - 특정 이벤트가 발생했을 경우 텍스트 필드는 이를 알려주기 위해 델리게이트 메소드가 구현되어 있는 객체를 찾게되는데, 이를 참조하기 위한 포인터가 저장되는 곳이 delegate속성이다.
   - 텍스트 필드의 delegatr속성에 저장된 인스턴스가 델리게이트 메소드를 구현한 것으로 인식하고 필요한 메소드를 호출한다.

### 텍스트 필드의 속성

```swift
let tf = UITextField()

// 기본 속성 지정
tf.text = "Sample" // 기본값
tf.autocapitalizationType = UITextAutocapicalizationType.sentences // 대문자 변환
tf.autocorrectionType = UITextAutocorrectionType.no // 자동완성
tf.spellCheckType = UIKeyboardType.numberPad // 키보드 타입
tf.keyboardAppearance = UIKeyboardAppearance.dark // 키보드 외형
tf.returnKeyType = UIReturnKeyType.join // 리턴키 타입
tf.enalesReturnkeyAutomatically = true // 리턴키 자동 활성화
tf.isSecureTextEntry = true // 비밀번호 포멧
tf.clearButtonMode = UITextField.ViewMode.always // 내부의 클리어 버튼 표시
tf.clearOnBeginEditing = true // 편집 시작시 기존 내용 삭제

// 스타일 설정
tf.boarderStyle = UITextField.BorderStyle.line // 텍스트 스타일

tf.layer.borderColor = UIColor.gray.cgColor // 테두리 색상

tf.layer.borderWidth = 1.0 // 테두리 두께

tf.contentVerticalAlignment = UIColor.ContentVerticalAlignment.center // 수직 방향 텍스트 배열 위치

```

**최초 응답자(First Responder)**
iOS에서 모바일 기기의 디스플레이에 앱의 콘텐츠를 표현하기 위해 사용하는 UIWundow객체는 사용자 인터페이스 구조에서 사용자에 가장 가까이 위치한 객체로, 사용자로부터 발생하는 터치 관련 이벤트를 내부 객체로 전달하는 역할을 담당한다. 이를 위해 UIWindow는 이벤트가 발생했을 때 우선적으로 응답할 객체를 가리키는 **최초 응답자(First Responder)**라는 포인터를 가지고 있다.
사용자가 화면에서 텍스트 필드를 터치하면 윈도우는 최초 응답자 포인터를 해당 텍스트 필드로 옮겨준다. 그러면 모바일 기기에서 발생하는 모션 이벤트(터치, 드래그, 스와이프 등 손가락의 움직임으로 발생하는 각종 제스처)는 모두 최초 응답자 포인터에 연결된 객체로 전달된다.
텍스트 필드나 텍스트 뷰가 최초 응답자 객체가 되면, iOS에서 제공하는 가상 키보드가 화면에 나타나 입력을 할 수 있는 상태가 된다. 만약 이들 객체가 최초 응답자 상태를 잃게 되면 키보드는 다시 사라진다.
특정 객체를 최초 응답자로 만들고 싶다면 그 객체에 대한 **becomeFirstResponder()**메소드를 호출하면 된다. 이 메소드는 **UIResponder** 클래스에 정의되어 있는데, 이 클래스를 상속받은 객체들은 모두 **becomeResponder()**메소드를 호출하여 최초 응답자 객체가 될 수 있다.
대부분의 뷰들은 최초 응답자가 되길 거부한다. 현재 선택된 텍스트 필드나 텍스트 뷰에서 포커스를 빼앗고 싶어하지 않기 때문이다. 뷰를 상속받은 하나의 객체인 USSlider 객체는 터치 이벤트를 입력받아 처리하지만, 최초 응답자 상태를 허용하지 않는다. 바로 이것이 화면에 키보드가 표시된 상태에서 다른 요소를 건드려도 키보드가 사라지지 않은 이유이다. 다른 요소를 터치하더라고 그 객체가 UIResponder를 상속 받지 않았다면 터치 이벤트만 발생할 뿐, 최초 응답자 포인터는 텍스트 필드를 그대로 가리키기 때문이다.

```swift
let tf = UITextField()

// 최초 응답자 객체로 지정한다. 키보드가 나타나고 입력상태가 된다.
tf.becomeFirstResponder()

// ...(필요한 코드 삽입)...

// 입력이 완료되면 최초 응답자 객체를 해제한다. 키보드가 사라진다.
tf.resignFirstResponder()
```



