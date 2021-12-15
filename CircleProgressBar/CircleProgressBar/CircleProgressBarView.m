//
//  CircleProgressBarView.m
//  CircleProgressBar
//
//  Created by bhPark on 2021/12/15.
//

#import "CircleProgressBarView.h"

@implementation CircleProgressBarView
@synthesize progress;
@synthesize attributes;

-(void)viewDidMoveToWindow{
    self->progress=30;
    // internal number design (font, size, color ...)
    attributes = [NSDictionary dictionaryWithObjectsAndKeys:[NSFont fontWithName:@"Helvetica" size:26], NSFontAttributeName, [NSColor textColor], NSForegroundColorAttributeName, nil];
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    NSAffineTransform *tran = [NSAffineTransform transform];
    [tran translateXBy:dirtyRect.size.width/2 yBy:dirtyRect.size.height/2]; // 전체 X, Y 축
    [tran rotateByDegrees:270]; // 회전 각도
    [tran concat];
    
    // 하이라이트 원 생성
    NSBezierPath *path = [NSBezierPath bezierPath];   // 새로운 원 할당
    [path setLineWidth:2];
    [path moveToPoint:NSMakePoint(0, 0)];
    [path appendBezierPathWithArcWithCenter:NSMakePoint(0, 0) radius:self.frame.size.height/2.5 startAngle:0 endAngle:360]; // progress에 따라 progress bar 증가
    [path closePath];
//    [[NSColor colorWithRed:0.961 green:0.961 blue:0.961 alpha:1.0] setFill];
    [[NSColor textColor] setFill];
    [path fill];
    
    // 파란 원 생성
    path = [NSBezierPath bezierPath];   // 새로운 원 할당
    [path setLineWidth:2];
    [path moveToPoint:NSMakePoint(0, 0)];
    [path appendBezierPathWithArcWithCenter:NSMakePoint(0, 0) radius:self.frame.size.height/2.5 startAngle:0 endAngle:self.progress*3.6]; // progress에 따라 progress bar 증가
    [path closePath];
    [[NSColor colorWithRed:0.000 green:0.282 blue:0.729 alpha:1.0] setFill];
    [path fill];
    
    // 파란원 가운데 검은 원 생성
    path = [NSBezierPath bezierPath];   // 새로운 원 할당
    [path setLineWidth:2];
    [path moveToPoint:NSMakePoint(0, 0)];
    [path appendBezierPathWithArcWithCenter:NSMakePoint(0, 0) radius:self.frame.size.height/3.05 startAngle:0 endAngle:360];
    [path closePath];
//    [[NSColor underPageBackgroundColor] setFill];
    [[NSColor windowBackgroundColor] setFill];
    [path fill];
    
    tran = [NSAffineTransform transform];
    [tran rotateByDegrees:90];  // 회전각도 0도로 맞춰주기(가운데 숫자를 위해?)
    [tran concat];
    
    // internal number setting
    NSAttributedString * curText = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%d%%", (int)progress] attributes:attributes];
    NSSize textSize = [curText size];
    NSRect r = NSMakeRect(0+(0-textSize.width)/2, 0+(0-textSize.height)/2, textSize.width, textSize.height);
    [curText drawInRect:r];
    
    
}

-(BOOL)isFlipped{
    return true;
}
@end
