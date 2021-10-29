//
//  DesktopEntity.h
//  GroupTable
//
//  Created by bhPark on 2021/10/28.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface DesktopEntity : NSObject

@property (strong, nonatomic) NSURL *fileURL;
@property (strong, readonly) NSString *name;

-(id)initWithFileURL:(NSURL *)fileURL;
+(DesktopEntity*)entityForURL:(NSURL*)url;

@end

# pragma mark DesktopImageEntity
@interface DesktopImageEntity : DesktopEntity

@property (strong, nonatomic)  NSImage *image;

@end


# pragma mark DesktopFolderEntity
@interface DesktopFolderEntity : DesktopEntity

@end

NS_ASSUME_NONNULL_END
