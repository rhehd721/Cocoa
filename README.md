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

## NSControl
- NSButton
  - (void)setEnabled:(BOOL)yn // Button Disable, Enable
  - (NSInteger)state  // 눌려있으면 1, 꺼져있으면 0
  - (void)setState:(NSInteger)aState  // 버튼 설정
- NSSlider
  - (void)setFloatValue:(float)x  // 슬라이더를 x까지 움직인다.
  - (float)floatValue // 슬라이더의 현재 값을 리턴한다.
- NSTextView
  - (NSString *)stringValue // 현재 값 리턴
  - (void)setStringValue:(NSString *)aString  // 데이터 set
  - (NSObject *)objectValue // 
  - (void)setObjectValue:(NSObjct *)obj //
- NSColorWell
