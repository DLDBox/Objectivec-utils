//
//  DTImageCacheManager.m
//  LightPhoto
//
//  Created by Dana De Voe on 10/18/14.
//  Copyright (c) 2014 Dana Devoe. All rights reserved.
//

#import "DTImageCacheManager.h"
#import "DTGlobals.h"

@interface DTImageCacheManager()
@property (nonatomic,assign) NSInteger byteSize;
@property (nonatomic,assign) NSInteger maxByteSize;

@property (nonatomic,assign) NSInteger persistantByteSize;
@property (nonatomic,assign) NSInteger maxPersistantByteSize;

@property (nonatomic,strong) NSMutableDictionary *imageDictionary;
@property (nonatomic,strong) NSMutableDictionary *persistantImageDictionary;
@end

@implementation DTImageCacheManager

+ (id) sharedImageCache
{
    static DTImageCacheManager *shareImageCache = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        shareImageCache = [[DTImageCacheManager alloc] init];
    });
    
    return shareImageCache;
}

- (id) init
{
    self = [super init];
    
    if (self) {
        self.imageDictionary = [[NSMutableDictionary alloc] init];
        self.persistantImageDictionary = [[NSMutableDictionary alloc] init];
    }
    return  self;
}

- (NSInteger) imageByteSize:(UIImage *)image
{
    int height = image.size.height,
        width = image.size.width;
    
    int bytesPerRow = 4*width;
    if (bytesPerRow % 16){
        bytesPerRow = ((bytesPerRow / 16) + 1) * 16;
    }
    
    return height*bytesPerRow;
    
    // if the above does not work use the below
    //NSData *data = UIImagePNGRepresentation(image);
    //_byteSize += [data length];
}

- (UIImage*) name:(NSString *)imgName
{
    UIImage *image = _imageDictionary[imgName];
    
    if ( !image )
    {
        image = [UIImage imageNamed:imgName];
        
        if ( image ) {
            [_imageDictionary setObject:image forKey:imgName];
        }
        else{
            DLog( @"ImageNamed(%@) not found",imgName );
        }
    }
    _byteSize += [self imageByteSize:image];
    
    
    return image ;
}

- (UIImage*) persist:(NSString *)imgName
{
    UIImage *image = self.persistantImageDictionary[imgName];
    
    if ( !image )
    {
        image = [UIImage imageNamed:imgName];
        
        if ( image ) {
            [self.persistantImageDictionary setObject:image forKey:imgName];
        }
    }
    _byteSize += [self imageByteSize:image];
    
    return image ;
    
}


- (NSSet *) preloadImages:(NSArray *)imageNames
{
    __block NSMutableSet *aSet = [[NSMutableSet alloc] init];

    [imageNames enumerateObjectsUsingBlock:^(id obj,NSUInteger idx,BOOL *stop){
        if ( ![self name:(NSString*)obj] ) {
            [aSet addObject:@(idx)];
        }
    } ];
    
    return aSet;
}

- (void) removeImageName:(NSString *)imgName
{
    _byteSize -= [self imageByteSize:_imageDictionary[imgName]];
    [_imageDictionary removeObjectForKey:imgName];
}

- (void) removeImage:(UIImage *)image
{
    _byteSize -= [self imageByteSize:image];
    [_imageDictionary enumerateKeysAndObjectsUsingBlock:^(id key,id obj,BOOL *stop){
        if ( [obj isEqual:image] == YES) {
            [_imageDictionary removeObjectForKey:key];
        }
    } ];
}

- (void) removeAll
{
    _byteSize = 0;
    [_imageDictionary removeAllObjects];
}

- (void) setMaxByteSize:(NSInteger)byteSize
{
    _maxByteSize = byteSize;
}

- (NSInteger)byteSize
{
    return _byteSize;
}

@end
