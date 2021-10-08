//
//  Window_2.m
//  ColorChange
//
//  Created by bhPark on 2021/10/07.
//

#import "Window_2.h"

@interface Window_2 ()
@property NSInteger num;
@property (strong) IBOutlet NSWindow *window;

@end

@implementation Window_2
- (IBAction)clickBtn:(id)sender {
    [self.delegate ChageWindow_1Color];
}

- (void)windowDidLoad {
    [super windowDidLoad];
    _num = 0;
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    
}
-(void)ChageWindow_2Color{
    NSLog(@"del2");
    if(_num == 1){
        [self.window setBackgroundColor:[NSColor grayColor]];
        _num = 0;
    }
    else{
        [self.window setBackgroundColor:[NSColor yellowColor]];
        _num = 1;
    }
    
}
@end
