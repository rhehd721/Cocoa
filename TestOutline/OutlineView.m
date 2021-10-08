//
//  OutlineView.m
//  TestOutline
//
//  Created by bhPark on 2021/10/08.
//

#import "OutlineView.h"

@interface OutlineView ()
@property (weak) IBOutlet NSOutlineView *outlineTable;

@end

@implementation OutlineView

-(id)initWithWindowNibName:(NSString*)Name{
    NSLog(@"initWithWindowNibName");
    self = [super initWithWindowNibName:Name];
    if(self){
        _firstParent = @{@"parent": @"Foo", @"children": @[@"Foox", @"Fooz"]};
        _secondParent = @{@"parent": @"Bar", @"children": @[@"Barx", @"Barz"]};
        _list = @[_firstParent, _secondParent];
    }
    return self;
}

- (void)windowDidLoad {
    NSLog(@"windowDidLoad");
    [super windowDidLoad];
    [_outlineTable reloadData];
}

- (NSInteger)outlineView:(NSOutlineView *)outlineView numberOfChildrenOfItem:(id)item
{

    if (item == nil) { //item is nil when the outline view wants to inquire for root level items
        return [_list count];
    }

    if ([item isKindOfClass:[NSDictionary class]]) {
        return [[item objectForKey:@"children"] count];
    }

    return 0;
}

- (id)outlineView:(NSOutlineView *)outlineView child:(NSInteger)index ofItem:(id)item
{

    if (item == nil) { //item is nil when the outline view wants to inquire for root level items
        return [_list objectAtIndex:index];
    }

    if ([item isKindOfClass:[NSDictionary class]]) {
        return [[item objectForKey:@"children"] objectAtIndex:index];
    }

    return nil;
}

- (BOOL)outlineView:(NSOutlineView *)outlineView isItemExpandable:(id)item
{
    if ([item isKindOfClass:[NSDictionary class]]) {
        return YES;
    }else {
        return NO;
    }
}

- (id)outlineView:(NSOutlineView *)outlineView objectValueForTableColumn:(NSTableColumn *)theColumn byItem:(id)item
{

    if ([[theColumn identifier] isEqualToString:@"children"]) {
        if ([item isKindOfClass:[NSDictionary class]]) {
            return [NSString stringWithFormat:@"%i kids",[[item objectForKey:@"children"] count]];
        }
        return item;
    }else{
        if ([item isKindOfClass:[NSDictionary class]]) {
            return [item objectForKey:@"parent"];
        }
    }

    return nil;
}

@end
