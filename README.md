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

## Delegate
- 클래스 또는 구조체가 다른 유형의 인스턴스로 책임을 전달 또는 위임할 수 있도록 하는 디자인 패턴
- 즉, delegate는 사용자 인터페이스 제어에 관련된 권한을 위임받는다.
```objc
@protocol UIWebViewDelegate <NSObject>
@optional
- (void)webViewDidStartLoad:(UIWebView *)webView;
// ... other methods here
@end

@interface MyClass <UIWebViewDelegate>
@property id <UIWebViewDelegate> delegate;
// ...
@end
```
- AppDelegate에 delegate추가하기
```
@interface AppDelegate ()
@property DelegateClass *ptr;
@end
```

### Delegate 주의사항
- 메서드 이름을 잘못 적는것
- 델리게이트 아웃렛 지정을 잊어 버리는 것

### Delegate를 가지는 객체들
- NSAlert
- NSAnimation
- NSApplication
- NSBrowser
- NSDatePiker
- NSDrawer
- NSFontManager
- NSImage
- NSLayoutManager
- NSMatrix
- NSMenu
- NSPathControl
- NSRuleEditor
- NSSavePanel
- NSSound
- NSSpeechRecognizer
- NSSpeechSynthesizer
- NSSplitView
- NSTabView
- NSTableView
- NSText
- NSTextField
- NSTextStorage
- NSTextView
- NSTokenField
- NSToolbar
- NSWindow


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

## NSTableView

## Key-value Coding : KVC
- 변수의 이름으로 변수의 값을 설정하거나 가져오는 방식
```objc
@interface Student : NSObject{
  NSString *firstName;
}
...
@end

Student *s = [[Student alloc]init];
[s setValue@"Larry" forKey:@"firstName"];

NSString *x = [s valueForKey:@"firstName"];
```

##  Key-value Observing : KVO
- 특정 키의 값의 변화를 감지하기 위한 기능
