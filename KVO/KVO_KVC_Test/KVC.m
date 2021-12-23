//
//  KVC.m
//  KVO_KVC_Test
//
//  Created by bhPark on 2021/12/23.
//

#import "KVC.h"

@implementation KVC

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}


//- (void)changeName(Person *p, NSString *newName)
//{
//    // using the KVC accessor (getter) method
//    NSString *originalName = [p valueForKey:@"name"];
//
//    // using the KVC  accessor (setter) method.
//    [p setValue:newName forKey:@"name"];
//
//    NSLog(@"Changed %@'s name to: %@", originalName, newName);
//}
//
//- (void) logMarriage(Person *p)
//{
//    // just using the accessor again, same as example above
//    NSString *personsName = [p valueForKey:@"name"];
//
//    // this line is different, because it is using
//    // a "key path" instead of a normal "key"
//    NSString *spousesName = [p valueForKeyPath:@"spouse.name"];
//
//    NSLog(@"%@ is happily married to %@", personsName, spousesName);
//}

@end
