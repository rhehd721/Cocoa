//
//  Table_2.m
//  TableView
//
//  Created by bhPark on 2021/10/08.
//

#import "Table_2.h"

@interface Table_2 () <NSTableViewDataSource>
@property (weak) IBOutlet NSTableView *tableView;
@property NSMutableArray *tableArr;
@property (weak) IBOutlet NSTextField *textField;

@end

@implementation Table_2

- (void)windowDidLoad {
    [super windowDidLoad];
    _tableArr = [NSMutableArray arrayWithObjects:@"Process1",@"Process2", nil];
    [_tableView setDataSource:self];
    [_tableView reloadData];
}

- (IBAction)clickAdd:(id)sender {
    [_delegate add:[_textField stringValue]];
}

- (IBAction)clickDelete:(id)sender {
    [_delegate del];
}

- (void)add:(NSString*)stringValue{    // textField data 추가하기
    NSLog(@"add_2");
    
    [_tableArr addObject:stringValue];
    
    [_tableView reloadData];
}

-(void)del{ // table seleted data 삭제하기
    NSLog(@"del_2");
    
//    [_tableArr removeObjectAtIndex:[_tableView selectedRow]];
    
    [_tableArr removeLastObject];
    
    [_tableView reloadData];
}

#pragma mark tableview delegate
- (NSInteger)numberOfRowsInTableView:(NSTableView *)aTableView1 // 2
{
    return [_tableArr count];
}

- (id)tableView:(NSTableView *)aTableView objectValueForTableColumn:(NSTableColumn *)aTableColumn row:(NSInteger)rowIndex   // 3
{
    return [_tableArr objectAtIndex:rowIndex];
}

@end
