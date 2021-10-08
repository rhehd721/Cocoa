//
//  Table_1.h
//  TableView
//
//  Created by bhPark on 2021/10/08.
//

#import <Cocoa/Cocoa.h>
#import "Delegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface Table_1 : NSWindowController <Table_2_Controll>

@property id <Table_2_Controll> delegate;

@end

NS_ASSUME_NONNULL_END
