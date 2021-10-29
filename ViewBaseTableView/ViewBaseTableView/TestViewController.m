//
//  TestViewController.m
//  ViewBaseTableView
//
//  Created by bhPark on 2021/10/27.
//

#import "TestViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _getViewArray = [[GetViewArray alloc]init];
    _viewArray = [_getViewArray returnViewArray];
}

#pragma mark tableview datasource? delegate?
- (NSInteger)numberOfRowsInTableView:(NSTableView *)aTableView
{
    return [_viewArray count];
}

#pragma mark tableview delegate
- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    NSLog(@"view");
    NSString *identifier = [tableColumn identifier];
    if([identifier isEqualToString:@"Main"]){
        NSTableCellView *cellView = [tableView makeViewWithIdentifier:@"Main" owner:self]; // 이름 중요
        [cellView addSubview:_viewArray[row]];
        return cellView;
    }
    return nil;
}



@end
