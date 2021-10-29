//
//  AppDelegate.m
//  GroupTable
//
//  Created by bhPark on 2021/10/28.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (strong) IBOutlet NSWindow *window;
@property NSMutableArray * tableContents;
@property (weak) IBOutlet NSTableView *tableView;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    _tableContents = [[NSMutableArray alloc]init];
//    NSString *path = @"/Users/bhpark/Desktop/testImage";
    NSString *path = @"/Users/bhpark/Desktop/testImage/";   // Data가 들어있는 폴더
    NSURL *url = [[NSURL alloc]initFileURLWithPath:path];   // url path로 초기화
    NSFileManager *fileManager = [NSFileManager defaultManager];    // fileManaget 초기화
    NSDirectoryEnumerator * directoryEnum = [fileManager enumeratorAtURL:url includingPropertiesForKeys:nil options:0 errorHandler:^BOOL(NSURL *url, NSError *error){   // fileManager를 통해 url에 있는 데이터 가져오기
        return YES;
    }];
    
//    NSString *file;
//    while(file = [directoryEnum nextObject]){
//        NSString *filePath = [path stringByAppendingFormat:@"/%@", file];
//        NSLog(@"%@", filePath);
//        NSDictionary *obj = @{@"image":[[NSImage alloc] initByReferencingFile:filePath], @"name":[file stringByDeletingPathExtension]};
//        [_tableContents addObject:obj];
//    }
    
    for (NSURL *fileURL in directoryEnum){
        NSLog(@"%@", fileURL);
        DesktopEntity *entity = [DesktopEntity entityForURL:fileURL];   // 파일 속 Data를 Image인지 Folder인지 구별하여 데이터 생성
        [_tableContents addObject:entity];  //
    }
    [_tableView reloadData];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
    return YES;
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)aTableView1
{
    return [_tableContents count];
}

#pragma mark tableview delegate
- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
//        NSDictionary *flag = _tableContents[row];
//        NSString *identifier = [tableColumn identifier];
//        if([identifier isEqualToString:@"Main"]){
//            NSTableCellView *cellView = [tableView makeViewWithIdentifier:@"Main" owner:self];
//            [cellView.textField setStringValue:flag[@"name"]];
//            [cellView.imageView setImage:flag[@"image"]];
//            return cellView;
//        }
//        return nil;
    DesktopEntity *entity = _tableContents[row];
    if([entity isKindOfClass:[DesktopFolderEntity class]]){
        NSTextField *groupCell = [tableView makeViewWithIdentifier:@"GroupCell" owner:self];
        [groupCell setStringValue:entity.name];
        return groupCell;
    }
    if([entity isKindOfClass:[DesktopImageEntity class]]){
        NSTableCellView *cellView = [tableView makeViewWithIdentifier:@"Main" owner:self];
        [cellView.textField setStringValue:entity.name];
        [cellView.imageView setImage:[(DesktopImageEntity *)entity image]];
        return cellView;
    }
    return nil;
}

-(BOOL)tableView:(NSTableView *)tableView isGroupRow:(NSInteger)row{
    DesktopEntity *entity = _tableContents[row];
    if([entity isKindOfClass:[DesktopFolderEntity class]]){ // Folder부터 하나의 그룹
        return YES;
    }
    return NO;
}

-(CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row{
    DesktopEntity *entity = _tableContents[row];
    if([entity isKindOfClass:[DesktopFolderEntity class]]){ // group 일때 cell의 크기
        return 22;
    }
    return [_tableView rowHeight];  // group이 아닐땐 cell을 작게 표시
}
@end
