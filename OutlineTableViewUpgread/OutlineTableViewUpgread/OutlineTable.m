#import "OutlineTable.h"


@interface OutlineTable ()

@property (weak) IBOutlet NSOutlineView *outlineTable;
@property (weak) IBOutlet NSTextField *countProcessLabel;
@property TerminalCmd * terminalCmd;
@property BOOL checkSortNum;
@property (strong) IBOutlet NSPanel *panel;
@property (weak) IBOutlet NSTextField *panelContent;
@property NSString * myProcess;
@end

@implementation OutlineTable

-(void)dataReload{
    [_delegate prcessListRefrash];
    [_outlineTable reloadData];
    [_countProcessLabel setStringValue:[NSString stringWithFormat:@"Process Count : %ld",[_list count]]];
}

- (void)windowDidLoad {
    _myProcess = [NSString stringWithFormat:@"%d", [[NSProcessInfo processInfo] processIdentifier]];
    _checkSortNum = YES;
    [super windowDidLoad];
    [self dataReload];
}

- (NSInteger)outlineView:(NSOutlineView *)outlineView numberOfChildrenOfItem:(id)item   // 1
{
    if (item == nil) { //item is nil when the outline view wants to inquire for root level items
        return [_list count];
    }

    if ([item isKindOfClass:[NSDictionary class]]) {
        return [[item objectForKey:@"information"] count];
    }

    return 0;
}

- (id)outlineView:(NSOutlineView *)outlineView child:(NSInteger)index ofItem:(id)item   // 2
{
    if (item == nil) { //item is nil when the outline view wants to inquire for root level items
        return [_list objectAtIndex:index];
    }

    if ([item isKindOfClass:[NSDictionary class]]) {    // item이 존재하니깐 childern 리턴
        return [[item objectForKey:@"information"] objectAtIndex:index];   // 아이템중 children 뽑은 뒤 하나씩 리턴
    }

    return nil;
}

- (BOOL)outlineView:(NSOutlineView *)outlineView isItemExpandable:(id)item
{
    if ([item isKindOfClass:[NSDictionary class]]) {
        if([item objectForKey:@"information"]){ // 자식이 있다면
            return YES;
        }
        return NO;
    }else {
        return NO;
    }
}

- (id)outlineView:(NSOutlineView *)outlineView objectValueForTableColumn:(NSTableColumn *)theColumn byItem:(id)item // 데이터를 뿌려주는 곳  // colum을 순회하며 데이터를 뿌림
{
    if ([[theColumn identifier] isEqualToString:@"value"]) { // value 컬럼이 들어왔을 때
        if ([item isKindOfClass:[NSDictionary class]]) {
            if([item objectForKey:@"value"]){
                return [item valueForKey:@"value"];
            }
            return [NSString stringWithFormat:@"%d pieces of information", [[item objectForKey:@"information"] count]];
        }
    }else{  // data 컬럼이 아니라면
        if ([item isKindOfClass:[NSDictionary class]]) {
            return [item objectForKey:@"procName"];   // parent에 해당하는 값 리턴
        }
        return item;
    }

    return nil;
}

- (IBAction)pushRefrashBtn:(id)sender {
    [self dataReload];
}

- (IBAction)pushSortBtn:(id)sender {
    NSLog(@"sort!");
    
    NSSortDescriptor * descriptor = [[NSSortDescriptor alloc] initWithKey:@"procName" ascending:_checkSortNum];
    _list = [_list sortedArrayUsingDescriptors:@[descriptor]];
    
    if(_checkSortNum){
        _checkSortNum = NO;
    }
    else{
        _checkSortNum = YES;
    }
    
    [_outlineTable reloadData];
    [_countProcessLabel setStringValue:[NSString stringWithFormat:@"Process Count : %ld",[_list count]]];
}

- (IBAction)pushKillBtn:(id)sender {
    id selectedItem = [_outlineTable itemAtRow:[_outlineTable selectedRow]];
    
    if([selectedItem valueForKey:@"procName"] == @"PID"){
        NSString * pid = [selectedItem valueForKey:@"value"];
        if(pid == _myProcess){
            [self showPanel:@"The current process cannot be killed." color:[NSColor redColor]];
            return;
        }
        _terminalCmd = [[TerminalCmd alloc]init];
        [_terminalCmd killProcess:pid];
        [self dataReload];
        return;
    }
    [self showPanel:@"Please select the pid of the process." color:[NSColor yellowColor]];
}

-(void)showPanel:(NSString*)text color:(NSColor*)color{
    NSWindowController *panelWindow = [NSWindowController new];
    
    [_panel setTitle:@"warning"];
    [_panelContent setStringValue:text];
    [_panelContent setTextColor:color];
    
    [panelWindow initWithWindow:_panel];
    [panelWindow showWindow:nil];
}

@end
