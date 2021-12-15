//
//  ProgressBar.h
//  CircleProgressBar
//
//  Created by bhPark on 2021/12/15.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface ProgressBarView : NSView
@property (weak) IBOutlet NSProgressIndicator *progressBar;
@property (strong) IBOutlet NSView *view;

-(void)increaseProgressBar;
-(void)resetProgressBar;
@end

NS_ASSUME_NONNULL_END
