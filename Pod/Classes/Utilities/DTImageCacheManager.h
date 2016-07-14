//
//  DTImageCacheManager.h
//  LightPhoto
//
//  Created by Dana De Voe on 10/18/14.
//  Copyright (c) 2014 Dana Devoe. All rights reserved.
//

#import <Foundation/Foundation.h>

#define CACHEDIMAGES [DTImageCacheManager sharedImageCache]
#define IMAGECACHE [DTImageCacheManager sharedImageCache]
//#define IMAGE(n) [UIImage imageNamed:n]
//#define PERMIMG(n) [UIImage imageNamed:n]
#define IMAGE(n) [[DTImageCacheManager sharedImageCache] name:n]
#define PERMIMG(n) [[DTImageCacheManager sharedImageCache] persist:n]

@interface DTImageCacheManager : NSObject

+ (id) sharedImageCache;

- (UIImage*) name:(NSString *)imgName;
- (UIImage*) persist:(NSString *)imgName;

/* returns a set of the image index inthe array which were not loaded
 */
- (NSSet *) preloadImages:(NSArray *)imageNames;
- (void) removeImageName:(NSString *)imgName;
- (void) removeImage:(UIImage *)image;
- (void) removeAll;

- (void) setMaxByteSize:(NSInteger)byteSize;
- (NSInteger)byteSize;

@end
