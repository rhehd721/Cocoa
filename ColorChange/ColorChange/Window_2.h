//
//  Window_2.h
//  ColorChange
//
//  Created by bhPark on 2021/10/07.
//

#import <Cocoa/Cocoa.h>
#import "Delegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface Window_2 : NSWindowController <Window_1ColorControll>
@property id <Window_1ColorControll> delegate;
@end

NS_ASSUME_NONNULL_END
