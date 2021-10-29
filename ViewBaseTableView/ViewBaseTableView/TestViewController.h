//
//  TestViewController.h
//  ViewBaseTableView
//
//  Created by bhPark on 2021/10/27.
//

#import <Cocoa/Cocoa.h>
#import "GetViewArray.h"

NS_ASSUME_NONNULL_BEGIN

@interface TestViewController : NSViewController
@property (strong) IBOutlet NSView *viewControllerCustomView;
@property (weak) IBOutlet NSTableView *tableView;
@property GetViewArray * getViewArray;
@property NSMutableArray * viewArray;
@end

NS_ASSUME_NONNULL_END
