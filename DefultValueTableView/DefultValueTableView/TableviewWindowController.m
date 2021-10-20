//
//  TableviewWindowController.m
//  DefultValueTableView
//
//  Created by bhPark on 2021/10/07.
//

#import "TableviewWindowController.h"

@interface TableviewWindowController () <NSTableViewDataSource>

@property (weak) IBOutlet NSTableView *tableView;
@property NSMutableArray *testArray;

@end

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
