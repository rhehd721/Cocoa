#import <Cocoa/Cocoa.h>
#import "BSDProcessList.h"
#import "TerminalCmd.h"
#import "Delegates.h"

NS_ASSUME_NONNULL_BEGIN

@interface OutlineTable : NSWindowController <obtainFreshProcessList>

@property NSArray *list;
@property id <obtainFreshProcessList> delegate;

-(void)dataReload;

-(void)windowDidLoad;

-(void)showPanel:(NSString*)text color:(NSColor*)color;

@end

NS_ASSUME_NONNULL_END
