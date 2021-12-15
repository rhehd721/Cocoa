//
//  ProgressBar.m
//  CircleProgressBar
//
//  Created by bhPark on 2021/12/15.
//

#import "ProgressBarView.h"

@implementation ProgressBarView

- (instancetype)initWithFrame:(NSRect)frameRect {
    self = [super initWithFrame:frameRect];
    [[NSBundle mainBundle] loadNibNamed:@"ProgressBarView" owner:self topLevelObjects:nil];
    
    NSRect rect = NSMakeRect(0, 0, frameRect.size.width, frameRect.size.height);
    [self.view setFrame:rect];
    
    _progressBar.doubleValue = 0;
    
    [self.progressBar setTranslatesAutoresizingMaskIntoConstraints:YES];
    
    [self addSubview:self.view];
    return self;
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
}

-(void)increaseProgressBar{
    [_progressBar incrementBy:1];
}

-(void)resetProgressBar{
    _progressBar.doubleValue = 0;
}

@end
