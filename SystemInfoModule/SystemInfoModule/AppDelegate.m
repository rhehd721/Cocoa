#import "AppDelegate.h"

@interface AppDelegate ()

@property (strong) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    [self checkDefaultBrowser];
//    [self checkScreenResolution];
//    [self checkHostVersion];
//    [self checkFolderPermission];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
    return YES;
}

#pragma mark 기본 브라우저 확인
-(void)checkDefaultBrowser{
    NSString * content = @"x=~/Library/Preferences/com.apple.LaunchServices/com.apple.launchservices.secure.plist; plutil -convert xml1 $x; grep 'https' -b3 $x | awk 'NR==2 {split($2, arr, \"[><]\"); print arr[3]}'; plutil -convert binary1 $x";
    
    NSPipe *pipe = [NSPipe pipe];
    NSFileHandle *file = pipe.fileHandleForReading;

    NSTask *task = [[NSTask alloc] init];
    task.launchPath = @"/bin/bash";
    task.arguments = @[@"-c", content];
    task.standardOutput = pipe;

    [task launch];

    NSData *data = [file readDataToEndOfFile];
    [file closeFile];

    NSString *grepOutput = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
    NSLog (@"%@", grepOutput);
    
    // com.google.chrome
    // com.apple.safari
}

#pragma mark 해상도 확인
-(void)checkScreenResolution{
    int width = [[NSScreen mainScreen] frame].size.width;
    int height = [[NSScreen mainScreen] frame].size.height;
    
    NSLog(@"%d * %d", width, height);
    NSLog(@"%@", [NSFileManager defaultManager]);
}

#pragma mark file read
-(void)checkHostVersion{
    // file read    info.plist
    
    NSString * fileContents = [NSString stringWithContentsOfFile:@"/Users/bhpark/Desktop/cp.sh" encoding:NSUTF8StringEncoding error:nil];
    
    NSLog(@"%@", fileContents);

}

#pragma mark 폴더 권한 확인
-(void)checkFolderPermission{
    NSFileManager *filemgr;

    filemgr = [NSFileManager defaultManager];

    if ([filemgr isWritableFileAtPath: @"/Users/bhpark/Desktop/cp.sh"]  == YES)
            NSLog (@"File is writable");
    else
            NSLog (@"File is read only");
    
//    filemgr isReadableFileAtPath:@"path"
}


@end
