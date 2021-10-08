//
//  OutlineView.m
//  OutlineView
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
        _firstParent = @{@"parent": @"Foo", @"children": @[@{@"Foox":@[@"test",@"test2"]}, @"Fooz"]};
        _secondParent = @{@"parent": @"Bar", @"children": @[@"Barx", @"Barz"]};
        _list = @[_firstParent, _secondParent];
        [_outlineTable setDataSource:self];
    }
    return self;
}

- (void)windowDidLoad {
    NSLog(@"windowDidLoad");
    [super windowDidLoad];
    [_outlineTable reloadData];
}

- (NSInteger)outlineView:(NSOutlineView *)outlineView numberOfChildrenOfItem:(id)item   // 1
{
    NSLog(@"1 : %@", item);
    NSLog(@"1");
    if (item == nil) { // item이 없다면 list count로 row 갯수 파악??
        NSLog(@"1.1");
//        return [_list count];
        return 1;
    }

    if ([item isKindOfClass:[NSDictionary class]]) {
        NSLog(@"1.2");
//        return [[item objectForKey:@"children"] count]; // 자식 수?
        return [(NSDictionary*)item allKeys].count;
    }
    else if([item isKindOfClass:[NSArray class]]) {
        return [(NSArray*)item count];
    }
    NSLog(@"1.3");

    return 0;
}

- (id)outlineView:(NSOutlineView *)outlineView child:(NSInteger)index ofItem:(id)item   // 2 데이터 크기
{
    
    NSLog(@"2 : %@ / %ld", item, index);
    NSLog(@"2");
    if (item == nil) { // data 주기??
        NSLog(@"2.1");
        return [_list objectAtIndex:index];
    }

    if ([item isKindOfClass:[NSDictionary class]]) {
        NSLog(@"2.2");
//        return [[item objectForKey:@"children"] objectAtIndex:index];   // 자식 수?
        return [[(NSDictionary*)item allKeys] objectAtIndex:index];
    }
    else if([item isKindOfClass:[NSArray class]]) {
        return item;
    }
        
    NSLog(@"2.3");

    return nil;
}

- (BOOL)outlineView:(NSOutlineView *)outlineView isItemExpandable:(id)item  // 3 데이터 종류 파악?
{
    NSLog(@"3 : %@", item);
    NSLog(@"3");
    if ([item isKindOfClass:[NSDictionary class]]) {    // item의 자료형 파악?
        NSLog(@"3.1");
        return YES;
    }else {
        NSLog(@"3.2");
        return YES;  // 화살표
    }
}

- (id)outlineView:(NSOutlineView *)outlineView objectValueForTableColumn:(NSTableColumn *)theColumn byItem:(id)item // 4 데이터 뿌려주기
{
    NSLog(@"4 : %@", item);
    NSLog(@"4");
    NSLog(@"theColumn : %@", theColumn);
    if ([[theColumn identifier] isEqualToString:@"children"]) { // Column identifier == children 일 경우 아래 데이터를 줄거야
        NSLog(@"4.1");
        if ([item isKindOfClass:[NSDictionary class]]) {
            NSLog(@"4.1.1");
            return [NSString stringWithFormat:@"%i kids",[[item objectForKey:@"children"] count]];  // 데이터 중 children에 해당하는 데이터를 줄거야
        }
//        return item;
    }else{
        NSLog(@"4.2");
        if ([item isKindOfClass:[NSDictionary class]]) {
            NSLog(@"4.2.1");
//            return [item objectForKey:@"parent"];   // 부모
            return [item objectForKey:@"parent"];   // 부모
        }
        return item;
    }

    return nil;
}

@end
