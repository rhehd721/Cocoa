//
//  Window_1.m
//  ColorChange
//
//  Created by bhPark on 2021/10/07.
//

#import "Window_1.h"

@interface Window_1 ()
@property (strong) IBOutlet NSWindow *window;
@property NSInteger num;
@end

@implementation Window_1

- (IBAction)clickBtn:(id)sender {
    [self.delegate ChageWindow_2Color];
}


- (void)windowDidLoad {
    [super windowDidLoad];
    _num = 0;
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    
}
-(void)ChageWindow_1Color{
    NSLog(@"del1");
    if(_num == 1){
        [self.window setBackgroundColor:[NSColor greenColor]];
        _num = 0;
    }
    else{
        [self.window setBackgroundColor:[NSColor purpleColor]];
        _num = 1;
    }
    
}

@end
