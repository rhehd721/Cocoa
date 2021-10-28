//
//  AppDelegate.m
//  DefaultDataViewBaseTableView
//
//  Created by bhPark on 2021/10/27.
//

#import "AppDelegate.h"

@interface AppDelegate ()
@property (strong) IBOutlet NSWindow *window;
@end

@implementation AppDelegate{
    NSMutableArray *_tableContents;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    NSLog(@"applicationDidFinishLaunching");
    // Insert code here to initialize your application
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    NSLog(@"applicationWillTerminate");
    // Insert code here to tear down your application
}


- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
    NSLog(@"applicationSupportsSecureRestorableState");
    return YES;
}

-(void)awakeFromNib{
    NSLog(@"awakeFromNib");
    _tableContents = [[NSMutableArray alloc]init];
    NSString *path = @"/directoryPath";
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSDirectoryEnumerator * directoryEnum = [fileManager enumeratorAtPath:path];
    
    NSString *file;
    while(file = [directoryEnum nextObject]){
        NSString *filePath = [path stringByAppendingFormat:@"/%@", file];
        NSDictionary *obj = @{@"image":[[NSImage alloc] initByReferencingFile:filePath], @"name":[file stringByDeletingPathExtension]};
        [_tableContents addObject:obj];
    }
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)aTableView1
{
    NSLog(@"numberOfRowsInTableView");
    return [_tableContents count];
}

#pragma mark tableview delegate
// CellBase의 경우 - (id)tableView:(NSTableView *)aTableView objectValueForTableColumn:(NSTableColumn *)aTableColumn row:(NSInteger)rowIndex
// 이였지만 ViewBase의 경우 아래와 같으니 유의!
- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
        NSLog(@"tableView");
        NSDictionary *flag = _tableContents[row];
        NSString *identifier = [tableColumn identifier];
        if([identifier isEqualToString:@"MainCell"]){
            NSTableCellView *cellView = [tableView makeViewWithIdentifier:@"MainCell" owner:self];
            [cellView.textField setStringValue:flag[@"name"]];
            [cellView.imageView setImage:flag[@"image"]];
            NSLog(@"%@", cellView);
            return cellView;
        }
        return nil;
}


@end
