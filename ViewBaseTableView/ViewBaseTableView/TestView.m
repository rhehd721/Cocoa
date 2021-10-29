//
//  TestView.m
//  ViewBaseTableView
//
//  Created by bhPark on 2021/10/27.
//

#import "TestView.h"

@implementation TestView

-(instancetype)initWithFrame:(NSRect)frameRect {
    self = [super initWithFrame:frameRect];
    [[NSBundle mainBundle] loadNibNamed:@"TestView" owner:self topLevelObjects:nil];
    
    NSRect rect = NSMakeRect(0, 0, frameRect.size.width, frameRect.size.height);
    [self.customCellView setFrame:rect];
    
    [self addSubview:self.customCellView];
    return self;
}

-(void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}


@end
