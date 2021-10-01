# Cocoa

## 참고
- 난수생성 = (int)(random() % 100) +1; // 1~100

## 기본구조
- main() -> return NSApplicationMain(argc, argv) -> AppDelegete <-> MainMenu.xib

## Outlet, Action
- outlet(아웃렛) : 다른 객체들을 가르키는 인스턴스 변수
- action(액션) : 사용자 인터페이스 객체가 호출하는 메서드
```objc
@interface RandomController : NSObject{
  IBOutlet NSTextField *textField;
}
- (IBAction)seed:(id)sender;
- (IBAction)generate:(id)sender;
@end
```

## awakeFromNib
- XIB 객체의 초기화
```objc
-(void)awakeFromNib{  // 자동 호출되는 메서드
  NSDate *noe;
  now = [NSDate date];
  [textField setObjectValue:now];
}
```

## Library
- NSTextField
  - textField 내용 변경
    - [textField setIntValue:(int)]
    - [textField setStringValue:(NSString)]
