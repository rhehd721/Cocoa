//
//  DesktopEntity.m
//  GroupTable
//
//  Created by bhPark on 2021/10/28.
//

#import "DesktopEntity.h"

@implementation DesktopEntity

-(id)initWithFileURL:(NSURL *)fileURL{
    self = [super init];
    if(self){
        _fileURL = fileURL;
    }
    return self;
}

+(DesktopEntity*)entityForURL:(NSURL *)url{ // Image 데이터와 Folder 데이터 클래스로 구별
    NSString * typeIdentfier;
    if([url getResourceValue:&typeIdentfier forKey:NSURLTypeIdentifierKey error:NULL]){
        NSArray *imgTypes = [NSImage imageTypes];
        if([imgTypes containsObject:typeIdentfier]){
            return [[DesktopImageEntity alloc]initWithFileURL:url];
        }else if ([typeIdentfier isEqualToString:(NSString*)kUTTypeFolder]){
            return [[DesktopFolderEntity alloc]initWithFileURL:url];
        }
    }
    return nil;
}

-(NSString*)name{
    NSString *name;
    if([self.fileURL getResourceValue:&name forKey:NSURLLocalizedNameKey error:NULL]){
        return name;
    }
    return nil;
}

@end

# pragma mark DesktopImageEntity
@implementation DesktopImageEntity

-(NSImage*)image{
    if(!_image){
        _image = [[NSImage alloc]initByReferencingURL:self.fileURL];
    }
    return _image;
}

@end


# pragma mark DesktopFolderEntity
@implementation DesktopFolderEntity

@end
