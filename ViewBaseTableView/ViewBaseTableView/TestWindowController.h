//
//  TestWindowController.h
//  ViewBaseTableView
//
//  Created by bhPark on 2021/10/27.
//

#import <Cocoa/Cocoa.h>
#import "TestViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface TestWindowController : NSWindowController
@property TestViewController * testViewController;
@property (weak) IBOutlet NSView *customView;
@end

NS_ASSUME_NONNULL_END
