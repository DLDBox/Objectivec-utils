//
//  NSString+Devoe.h
//  GUITest
//
//  Created by Dana Devoe on 11/3/11.
//  Copyright 2011 Dana L. De Voe. All rights reserved.
//

/* Debug methods
 */
#import <Foundation/Foundation.h>

@interface NSString (DevoeTech)

+ (NSString*) stringWithUUID;

- (BOOL)validateEmail;
- (BOOL)validatePhoneNumber;
- (BOOL)validateCharOnly;
- (BOOL)validateDigitsOnly;

#ifdef IOS_DEVELOPMENT
#pragma mark - 
#pragma mark Orientation Methods
+ (NSString*) deviceOrientationFromEnum:(UIDeviceOrientation)deviceOrientation ;
+ (NSString*) interfaceOrientationFromEnum:(UIInterfaceOrientation)interfaceOrientation ;

#pragma mark - 
#pragma mark View Enums
+ (NSString*) viewContentMode:(UIViewContentMode)mode ;
#endif 

#pragma mark - 
#pragma mark dimension methods
+ (NSString*) rect:(CGRect)rect ;
+ (NSString*) size:(CGSize)size ;
+ (NSString*) point:(CGPoint)point;

- (NSString*) sha1;
- (NSString*) md5;

//- (NSString*)encodeToPercentEscapeString;
//- (NSString*)decodeFromPercentEscapeString;

#pragma mark - 
#pragma mark quickies
- (NSString*) trimWhiteSpace;

@end
