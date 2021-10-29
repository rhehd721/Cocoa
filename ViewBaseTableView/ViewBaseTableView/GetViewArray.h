//
//  GetViewArray.h
//  ViewBaseTableView
//
//  Created by bhPark on 2021/10/27.
//

#import <Foundation/Foundation.h>
#import "TestView.h"

NS_ASSUME_NONNULL_BEGIN

@interface GetViewArray : NSObject
@property NSMutableArray * viewArray;
@property TestView * testView;
-(NSMutableArray *)returnViewArray;
@end

NS_ASSUME_NONNULL_END
