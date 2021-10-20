//
//  Window_1.h
//  ColorChange
//
//  Created by bhPark on 2021/10/07.
//

#import <Cocoa/Cocoa.h>
#import "Delegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface Window_1 : NSWindowController <Window_2ColorControll>
@property id <Window_2ColorControll> delegate;
@end

NS_ASSUME_NONNULL_END
