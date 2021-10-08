//
//  SchoolInfo.m
//  OutlineTableViewUpgread
//
//  Created by bhPark on 2021/10/08.
//

#import "SchoolInfo.h"

@interface SchoolInfo ()
@property (weak) IBOutlet NSOutlineView *schoolTableView;

@end

@implementation SchoolInfo

-(id)initWithWindowNibName:(NSString*)Name{
    NSLog(@"initWithWindowNibName");
    self = [super initWithWindowNibName:Name];
    if(self){
        // add data
        _aClassStudent_1 = @{@"name": @"park", @"age": @"10", @"sex": @"male"};  // a반1번 정보
        _aClassStudent_2 = @{@"name": @"kim", @"age": @"20", @"sex": @"female"};  // a반2번 정보
        _aClassStudent_3 = @{@"name": @"lee", @"age": @"30", @"sex": @"female"};  // a반3번 정보

        _bClassStudent_1 = @{@"name": @"park", @"age": @"10", @"sex": @"male"};  // b반1번 정보
        _bClassStudent_2 = @{@"name": @"kim", @"age": @"20", @"sex": @"female"};  // b반2번 정보
        _bClassStudent_3 = @{@"name": @"lee", @"age": @"30", @"sex": @"female"};  // b반3번 정보

        _cClassStudent_1 = @{@"name": @"park", @"age": @"10", @"sex": @"male"};  // c반1번 정보
        _cClassStudent_2 = @{@"name": @"kim", @"age": @"20", @"sex": @"female"};  // c반2번 정보
        _cClassStudent_3 = @{@"name": @"lee", @"age": @"30", @"sex": @"female"};  // c반3번 정보

        
        _classA = @[_aClassStudent_1, _aClassStudent_2, _aClassStudent_3];   // a반, b반, c반 ...
        _classB = @[_bClassStudent_1, _bClassStudent_2, _bClassStudent_3];   // a반, b반, c반 ...
        _classC = @[_cClassStudent_1, _cClassStudent_2, _cClassStudent_3];   // a반, b반, c반 ...
        
        _school = @[_classA, _classB, _classC];  // root
        
    }
    return self;
}

- (void)windowDidLoad {
    [super windowDidLoad];
    [_schoolTableView reloadData];
}

- (NSInteger)outlineView:(NSOutlineView *)outlineView numberOfChildrenOfItem:(id)item
{

    if (item == nil) { //item is nil when the outline view wants to inquire for root level items
        return [_school count];
    }
    
    if ([item isKindOfClass:[NSArray class]]) { // array 라면
        return [item count];
    }

    if ([item isKindOfClass:[NSDictionary class]]) {    // dic 이라면
        return [[item objectForKey:@"children"] count];
    }

    return 0;
}

- (id)outlineView:(NSOutlineView *)outlineView child:(NSInteger)index ofItem:(id)item
{

    if (item == nil) { //item is nil when the outline view wants to inquire for root level items
        return [_school objectAtIndex:index];
    }
    
    if ([item isKindOfClass:[NSArray class]]) { // array 라면
        return [item objectAtIndex:index];
    }

    if ([item isKindOfClass:[NSDictionary class]]) {    // dic 이라면
        return [[item objectForKey:@"children"] objectAtIndex:index];
    }

    return nil;
}

- (BOOL)outlineView:(NSOutlineView *)outlineView isItemExpandable:(id)item
{
    if ([item isKindOfClass:[NSDictionary class]]) {
        return YES;
    }else {
        return YES;
    }
}

- (id)outlineView:(NSOutlineView *)outlineView objectValueForTableColumn:(NSTableColumn *)theColumn byItem:(id)item
{

    if ([[theColumn identifier] isEqualToString:@"data"]) { // children 컬럼이 들어왔을 때
        if ([item isKindOfClass:[NSDictionary class]]) {
            return [NSString stringWithFormat:@"%i folder",[[item objectForKey:@"children"] count]];
        }
    }else{
        if ([item isKindOfClass:[NSDictionary class]]) {
            return [item objectForKey:@"parent"];
        }
        return item;
    }

    return nil;
}

@end
