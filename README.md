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
- -(BOOL)respondsToSelector:(SEL)aSelector
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
```objc
// fido의 값이 변경되면 나에게 메세지를 보내줘!
[theAppDelegate addObserver:self forKeyPath:@"fido" options:NSKeyValueChangeOldKey context:somePointer];

// 값이 변결될 떄 실행되는 메서드
-(void)observeValueForKeyPath:(NSString*)ketPath ofObject:(id)object change:(NSDictionary *)chage context:(void *)context{
  // ...
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

|메서드|내용|
|------|---|
|-(void)setEnabled:(BOOL)yn|Button의 활성화 설정|
|-(NSInteger)state|Button이 켜져있으면 1 아니면 0|
|-(void)setState:(NSInteger)aState|NSOnState, NSOffState를 이용하여 Button을 끄고 킨다.|

- NSSlider
  - (void)setFloatValue:(float)x  // 슬라이더를 x까지 움직인다.
  - (float)floatValue // 슬라이더의 현재 값을 리턴한다.

|메서드|내용|
|------|---|
|-(void)setFloatValue:(float)x|슬라이더를 x만큼 움직인다.|
|-(float)floatValue|현재 슬라이더의 값을 리턴|

- NSTextField

|메서드|내용|
|------|---|
|-(NSString *)stringValue|현재 값 리턴|
|-(void)setStringValue:(NSString *)aString|데이터 set|
|-(NSObject *)objectValue|임의 객체 유형으로 가져오기|
|-(void)setObjectValue:(NSObjct *)obj|임의 객체 유형으로 설정하기 |

- NSColorWell

## NSWindowController
- ContentViewController 변경

```objc
[_window_ setContentViewController:_view_];
```

- CustomView 변경하기

```objc
// 반드시 showWindow 이후 또는 windowDidLoad 이후에 addSubview를 넣어주어야 한다. (아마 showWindow를 해야 객체가 생성되는듯 싶다.)
  _testViewController = [[TestViewController alloc]initWithNibName:@"TestViewController" bundle:nil];
  _testWindowController = [[TestWindowController alloc]initWithWindowNibName:@"TestWindowController"];
    
  
  [_testWindowController showWindow:nil];
    
  [_testWindowController.customView addSubview:_testViewController.view];
```

- Title 변경하기

```objc
  _mainWindow = [[MainWindow alloc]initWithWindowNibName:@"MainWindow"];

  NSString * windowTitle = @"New Title";
  [_mainWindow.window setTitle:windowTitle];

  [_mainWindow showWindow:nil];
```

## NSViewController

- custom view size 맞추기

```objc
  _errorCodeExplanationViewContoller = [[ErrorCodeExplanationViewContoller alloc]initWithNibName:@"ErrorCodeExplanationViewContoller" bundle:nil];
  _errorCodeExplanationViewContoller.view.frame = CGRectMake(0, 0, self.errorCodeExplanationCustomView.frame.size.width, self.errorCodeExplanationCustomView.frame.size.height);
   self.errorCodeExplanationCustomView addSubview:_errorCodeExplanationViewContoller.view];
```

## NSTableView
```objc
// 사용법 예시
@implementation TableviewWindowController

- (instancetype)initWithWindowNibName:(NSNibName)windowNibName {
    self = [super initWithWindowNibName:windowNibName];
    if(self) {
        NSLog(@"init");
//        self.testArray = @[@"Process1",@"Process2",@"Process3",@"Process4",@"Process5",@"Process6"];
    }
    return self;
}

- (void)windowDidLoad {
    [super windowDidLoad];  // 1
    NSLog(@"didload");
    self.testArray = [NSMutableArray arrayWithObjects:@"Process1",@"Process2",@"Process3",@"Process4",@"Process5",@"Process6", nil];
    [_tableView reloadData];
}
- (IBAction)addaction:(id)sender {
    [_testArray addObject:[NSString stringWithFormat:@"Process%lu", _testArray.count+1]];
    [_tableView reloadData];
}
- (IBAction)removeaction:(id)sender {
    [_testArray removeLastObject];
    [_tableView reloadData];
}

#pragma mark tableview delegate
- (NSInteger)numberOfRowsInTableView:(NSTableView *)aTableView1 // 2
{
    NSLog(@"datasource count");
    return [_testArray count];
}

- (id)tableView:(NSTableView *)aTableView objectValueForTableColumn:(NSTableColumn *)aTableColumn row:(NSInteger)rowIndex   // 3
{
    NSLog(@"datasource item");
    return [_testArray objectAtIndex:rowIndex];
}

@end
```

- table data replace

```objc
-(void)updateTable:(NSInteger)index result:(NSInteger)result{
    if(result == 0){
        [_tableData replaceObjectAtIndex:index withObject:@"0"];
    }else if(result == 1){    // success
        [tableData replaceObjectAtIndex:index withObject:@"1"];
    }else if(result == -1){ // error
        [tableData replaceObjectAtIndex:index withObject:@"-1"];
    }

    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}
```

- table row color change

```objc
  [[TableView rowViewAtRow:row makeIfNecessary:NO] setBackgroundColor:[NSColor colorWithRed:0.992 green:0.851 blue:0.710 alpha:1.0]];
  [textView.textField setTextColor:[NSColor redColor]];
```

## NSOutlineView
```objc
// 필수 delegate
- (BOOL) outlineView: (NSOutlineView *)ov
         isItemExpandable: (id)item { return NO; }

- (int)  outlineView: (NSOutlineView *)ov
         numberOfChildrenOfItem:(id)item { return 0; }

- (id)   outlineView: (NSOutlineView *)ov
         child:(int)index
         ofItem:(id)item { return nil; }

- (id)   outlineView: (NSOutlineView *)ov
         objectValueForTableColumn:(NSTableColumn*)col
         byItem:(id)item { return nil; }
         
- (BOOL) outlineView: (NSOutlineView *)ov
          acceptDrop: (id )info
                item: (id)item
          childIndex: (int)index
{
    item = [item observedObject];
    
    // do whatever you would normally do with the item
}
```
```objc
// 사용법 예시
-(id)initWithWindowNibName:(NSString*)Name{
    NSLog(@"initWithWindowNibName");
    self = [super initWithWindowNibName:Name];
    
    if(self){
        // add data
        _aClassStudent_1 = [NSMutableDictionary dictionary];
        [_aClassStudent_1 setObject:@"aClassStudent_1" forKey:@"parent"];
        [_aClassStudent_1 setObject:@"name : park, age : 10, sex : male" forKey:@"Infomation"];
        _aClassStudent_2 = [NSMutableDictionary dictionary];
        [_aClassStudent_2 setObject:@"aClassStudent_2" forKey:@"parent"];
        [_aClassStudent_2 setObject:@"name : park, age : 10, sex : male" forKey:@"Infomation"];
        _aClassStudent_3 = [NSMutableDictionary dictionary];
        [_aClassStudent_3 setObject:@"aClassStudent_3" forKey:@"parent"];
        [_aClassStudent_3 setObject:@"name : park, age : 10, sex : male" forKey:@"Infomation"];
        
        _bClassStudent_1 = [NSMutableDictionary dictionary];
        [_bClassStudent_1 setObject:@"bClassStudent_1" forKey:@"parent"];
        [_bClassStudent_1 setObject:@"name : park, age : 10, sex : male" forKey:@"Infomation"];
        _bClassStudent_2 = [NSMutableDictionary dictionary];
        [_bClassStudent_2 setObject:@"bClassStudent_2" forKey:@"parent"];
        [_bClassStudent_2 setObject:@"name : park, age : 10, sex : male" forKey:@"Infomation"];
        _bClassStudent_3 = [NSMutableDictionary dictionary];
        [_bClassStudent_3 setObject:@"bClassStudent_3" forKey:@"parent"];
        [_bClassStudent_3 setObject:@"name : park, age : 10, sex : male" forKey:@"Infomation"];
        
        _cClassStudent_1 = [NSMutableDictionary dictionary];
        [_cClassStudent_1 setObject:@"cClassStudent_1" forKey:@"parent"];
        [_cClassStudent_1 setObject:@"name : park, age : 10, sex : male" forKey:@"Infomation"];
        _cClassStudent_2 = [NSMutableDictionary dictionary];
        [_cClassStudent_2 setObject:@"cClassStudent_2" forKey:@"parent"];
        [_cClassStudent_2 setObject:@"name : park, age : 10, sex : male" forKey:@"Infomation"];
        _cClassStudent_3 = [NSMutableDictionary dictionary];
        [_cClassStudent_3 setObject:@"cClassStudent_3" forKey:@"parent"];
        [_cClassStudent_3 setObject:@"name : park, age : 10, sex : male" forKey:@"Infomation"];
        
        _classA = [NSMutableDictionary dictionary];
        [_classA setObject:@"ClassA" forKey:@"parent"];
        [_classA setObject:[NSMutableArray arrayWithObjects:_aClassStudent_1, _aClassStudent_2, _aClassStudent_3, nil] forKey:@"children"];
        
        _classB = [NSMutableDictionary dictionary];
        [_classB setObject:@"ClassB" forKey:@"parent"];
        [_classB setObject:[NSMutableArray arrayWithObjects:_bClassStudent_1, _bClassStudent_2, _bClassStudent_3, nil] forKey:@"children"];
        
        _classC = [NSMutableDictionary dictionary];
        [_classC setObject:@"ClassC" forKey:@"parent"];
        [_classC setObject:[NSMutableArray arrayWithObjects:_cClassStudent_1, _cClassStudent_2, _cClassStudent_3, nil] forKey:@"children"];
        
        _school = [NSMutableArray arrayWithObjects:_classA, _classB, _classC, nil];
    }

    return self;
}

- (void)windowDidLoad {
    [super windowDidLoad];
    [_schoolTableView reloadData];
}

- (NSInteger)outlineView:(NSOutlineView *)outlineView numberOfChildrenOfItem:(id)item   // 전체 데이터 크기?   // count == index??
{
    if (item == nil) { //item is nil when the outline view wants to inquire for root level items
        return [_school count];
    }

    if ([item isKindOfClass:[NSMutableDictionary class]]) {    // dic 이라면
        return [[item objectForKey:@"children"] count];
    }

    return 0;
}

- (id)outlineView:(NSOutlineView *)outlineView child:(NSInteger)index ofItem:(id)item
{
    

    if (item == nil) { //item is nil when the outline view wants to inquire for root level items
        return [_school objectAtIndex:index];
    }

    if ([item isKindOfClass:[NSMutableDictionary class]]) {    // dic 이라면
        return [[item objectForKey:@"children"] objectAtIndex:index];
    }

    return nil;
}

- (BOOL)outlineView:(NSOutlineView *)outlineView isItemExpandable:(id)item
{
    
    if ([item isKindOfClass:[NSMutableDictionary class]]) {
        if([item objectForKey:@"children"] == nil){
            return NO;
        }
        return YES;
    }else {
        return NO;
    }
}

- (id)outlineView:(NSOutlineView *)outlineView objectValueForTableColumn:(NSTableColumn *)theColumn byItem:(id)item
{
    
    if ([[theColumn identifier] isEqualToString:@"Infomation"]) { // children 컬럼이 들어왔을 때
        if ([item isKindOfClass:[NSMutableDictionary class]]) {
            if([item objectForKey:@"Infomation"] != nil){
                return [item objectForKey:@"Infomation"];
            }
            return [NSString stringWithFormat:@"%i folder",[[item objectForKey:@"children"] count]];
        }
    }else{
        if ([item isKindOfClass:[NSMutableDictionary class]]) {
            return [item objectForKey:@"parent"];
        }
        return item;
    }

    return nil;
}
```
- outlineView에서 선택한 data의 정보 확인하는 방법
```objc
id selectedItem = [_schoolTableView itemAtRow:[_schoolTableView selectedRow]];
    NSLog(@"%@", selectedItem);
```
- 메서드
|메서드|내용|
|---|---|
|id selectedItem = [outlineView itemAtRow:[outlineView selectedRow]];|선택한 row의 value 가져오기|


## NSPanel
- NSWindow 서브클래스

## NSTabView

## NSMenu

## NSTread
```objc
    _thread = [[NSThread alloc] initWithTarget:self selector:@selector(instanceName) object:nil];
    [_thread start];
    [_thread cancel];
```

## NSDate
```objc
// 현재시간 구하기
  NSDateFormatter * today = [[NSDateFormatter alloc] init];
//  [today setDateFormat:@"yyyy-MM-dd-HH-mm-ss"];
  [today setDateFormat:@"HH:mm:ss.SSS"];
  NSString * date = [today stringFromDate:[NSDate date]];
  NSLog(@"realTime : %@", date);

// Milliseconds 구하기
  NSTimeInterval seconds = [NSDate timeIntervalSinceReferenceDate];
  double milliseconds = seconds*1000;
```

## NSTask
- 예제 코드
```objc
// ‘ /bin/grep foo bar.txt‘를 실행하는 예
// bar.txt 파일에서 foo 라는 문자열이 있는 라인을 찾아서 출력한다.
NSPipe *pipe = [NSPipe pipe];
NSFileHandle *file = pipe.fileHandleForReading;

NSTask *task = [[NSTask alloc] init];
task.launchPath = @"/bin/grep";
task.arguments = @[@"foo", @"bar.txt"];
task.standardOutput = pipe;

[task launch];

NSData *data = [file readDataToEndOfFile];
[file closeFile];

NSString *grepOutput = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
NSLog (@"grep returned:\n%@", grepOutput);
```

## File Read
```objc
    NSString *filepath = [[NSBundle mainBundle] pathForResource:@"./test" ofType:@"txt"];
    NSError *error;
    NSString *fileContents = [NSString stringWithContentsOfFile:filepath encoding:NSUTF8StringEncoding error:&error];

    if (error)
        NSLog(@"Error reading file: %@", error.localizedDescription);

    // maybe for debugging...
//    NSLog(@"contents: %@", fileContents);
    for (id i in filepath){
        NSLog(@"contents: %@", i);
    }

    NSArray *listArray = [fileContents componentsSeparatedByString:@"\n"];
    NSLog(@"items = %lu", [listArray count]);
```

## NSUndoManager(ctrl+z)
- 애플리케이션에 취소 기능(Undo)을 추가할 수 있는 방법
- 객체 추가, 삭제, 편집 동작을 취소하는 메세지를 취소하기 관리지(undo manager(에서 모두 추적할 수 있다.
### NSInvocation
- 메세지(selector, receiver)를 마음대로 부를 수 있는 객체로 만드는 인스턴스

|메서드|내용|추가설명|
|---|---|---|
|-(void)forwardInvocation:(NSInvocation *)x|Message Forwarding 메서스|메세지가 NSInvication으로 변환되어 forwardInvocation:을 호출한다.|

## NSNotification
- 옵저버가 필요로 하는 데이터를 담은 봉투
- NSNotificationCenter( == 명령을 내리는 두뇌)
  - 옵저버 객체를 등록하거나 노티피케이션을 알리고 옵저버 등록을 해제하는 일을 한다.


|메서드|내용|
|---|---|
|+(NSNotificationCenter *)defaultCenter|노티피케이션 센터를 리턴하는 메서드|
|-(void)addObserver:(id)anObserver selector:(SEL)aSeletor name:(NSString *)notificationName object:(id)anObject|notificationName이란 이름과 anObject 객체를 포함한 노티피케이션을 받을 anObserver를 등록한다.|
|-(void)postNotification:(NSNotification *)notification|노티피케이션을 노티피케이션 센터에 알리는 메서드|
|-(void)postNotificationName:(NSString *)aName object:(id)anObject|노티피케이션을 만들어서 노티피케이션 센터로 알리는 메서드|
|-(void)removeObserver:(id)observer|옵저버 목록에서 observer를 지우는 |

## Archive 만들기
- xcode 상단 Product - Archive 클릭
- 생성된 아카이브를 클릭하고 Distribute Content 클릭

## otool

```
otool -l libStaticLibraryTest.dylib	—> 바이너리의 정보 확인
otool -L libStaticLibraryTest.dylib	—> 바이너리 동적 의존성 확인

```

- 바이너리 id path 바꾸기
```
install_name_tool -id @rpath/libStaticLibraryTest.dylib libStaticLibraryTest.dylib
install_name_tool -id @executable_path/../Frameworks/libStaticLibraryTest.dylib libStaticLibraryTest.dylib
```

## XPC
[XPC Sample Code](https://developer.apple.com/library/archive/documentation/MacOSX/Conceptual/BPSystemStartup/Chapters/CreatingXPCServices.html).
- 프로세스간 통신 API
- Apple이 제공하는 IPC의 한 종류

## Sleep Mode
[Sleep Sample Code](https://developer.apple.com/library/archive/qa/qa1340/_index.html).

# ERROR
- UI API called on a background thread
```objc
    dispatch_async(dispatch_get_main_queue(), ^{

        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];

    });
```
- Block implicitly retains 'self'; explicitly mention 'self' to indicate this is intended behavior
```objc
    // [_progressBarCircleView setNeedsDisplay:true];
    // 아래처럼 변환
    [self.progressBarCircleView setNeedsDisplay:true];
```
- IOS DYLD: LIBRARY NOT LOADED: ... REASON: IMAGE NOT FOUND
  - Embed Libraries 에 해당 lib 추가

- nw_endpoint_handler_set_adaptive_write_handler
  - ProjectSetting -> Info -> add (App Transport Security Settings) -> add (Allow Arbitrary Loads) YES  

- Command CodeSign failed with a nonzero exit code  
  - cd DerivedData 으로 이동한 후에
  - xattr -c *
  - xattr -rc .

- no suitable image found.
  - Code Signing Identify 문제 

- UI Main Thread 문제 해결
```objc
  dispatch_async(dispatch_get_main_queue(), ^{
      [self.tableView reloadData];
  });
```
