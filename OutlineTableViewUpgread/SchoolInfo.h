//
//  SchoolInfo.h
//  OutlineTableViewUpgread
//
//  Created by bhPark on 2021/10/08.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface SchoolInfo : NSWindowController

@property NSArray *school;  // root

@property NSArray *classA;   // a반, b반, c반 ...
@property NSArray *classB;   // a반, b반, c반 ...
@property NSArray *classC;   // a반, b반, c반 ...

@property NSDictionary *aClassStudent_1;  // a반1번 정보
@property NSDictionary *aClassStudent_2;  // a반2번 정보
@property NSDictionary *aClassStudent_3;  // a반3번 정보

@property NSDictionary *bClassStudent_1;  // b반1번 정보
@property NSDictionary *bClassStudent_2;  // b반2번 정보
@property NSDictionary *bClassStudent_3;  // b반3번 정보

@property NSDictionary *cClassStudent_1;  // c반1번 정보
@property NSDictionary *cClassStudent_2;  // c반2번 정보
@property NSDictionary *cClassStudent_3;  // c반3번 정보



@end

NS_ASSUME_NONNULL_END
