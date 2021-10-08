//
//  OutlineView.h
//  TestOutline
//
//  Created by bhPark on 2021/10/08.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface OutlineView : NSWindowController

@property NSDictionary *firstParent;
@property NSDictionary *secondParent;
@property NSArray *list;

@end

NS_ASSUME_NONNULL_END
