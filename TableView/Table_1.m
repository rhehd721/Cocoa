//
//  Table_1.m
//  TableView
//
//  Created by bhPark on 2021/10/08.
//

#import "Table_1.h"


@interface Table_1 ()
@property (weak) IBOutlet NSTextField *textField;
@property NSMutableArray *tableArr;
@property (weak) IBOutlet NSTableView *tableView;
@end

@implementation Table_1


- (void)windowDidLoad { // window가 load 끝난 후 실행
    [super windowDidLoad];
    _tableArr = [NSMutableArray arrayWithObjects:@"Process3",@"Process4",@"Process5",@"Process6", nil];
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
    NSLog(@"add");
    
    [_tableArr addObject:stringValue];
    
    [_tableView reloadData];
}

-(void)del{ // table seleted data 삭제하기
    NSLog(@"del");
    
//    [_tableArr removeObjectAtIndex:[_tableView selectedRow]];
    
    [_tableArr removeLastObject];
    
    [_tableView reloadData];
}

#pragma mark tableview delegate
- (NSInteger)numberOfRowsInTableView:(NSTableView *)aTableView1 // 2
{
//    NSLog(@"datasource count");
    return [_tableArr count];
}

- (id)tableView:(NSTableView *)aTableView objectValueForTableColumn:(NSTableColumn *)aTableColumn row:(NSInteger)rowIndex   // 3
{
//    NSLog(@"datasource item");
    return [_tableArr objectAtIndex:rowIndex];
}

@end
