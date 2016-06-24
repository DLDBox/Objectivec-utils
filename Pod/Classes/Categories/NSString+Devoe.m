//
//  NSString+Devoe.m
//  GUITest
//
//  Created by Dana Devoe on 11/3/11.
//  Copyright 2011 Dana L. De Voe. All rights reserved.
//

#ifdef IOS_DEVELOPMENT
#import <UIKit.h>
#import <UIGeometry.h>
#endif

#import <CommonCrypto/CommonDigest.h>

#import "NSString+Devoe.h"

@implementation NSString (DevoeTech)

#ifdef IOS_DEVELOPMENT
+ (NSString*) deviceOrientationFromEnum:(UIDeviceOrientation)deviceOrientation 
{
    NSString* outString = @"deviceOrientationError" ;
    
    switch ( deviceOrientation ) {
        case UIDeviceOrientationPortrait:           outString = @"UIDeviceOrientationPortrait";break ;
        case UIDeviceOrientationPortraitUpsideDown: outString = @"UIDeviceOrientationPortraitUpsideDown";break ;
        case UIDeviceOrientationLandscapeLeft:      outString = @"UIDeviceOrientationLandscapeLeft";break ;
        case UIDeviceOrientationLandscapeRight:     outString = @"UIDeviceOrientationLandscapeRight";break ;
        case UIDeviceOrientationFaceUp:             outString = @"UIDeviceOrientationFaceUp";break ;
        case UIDeviceOrientationFaceDown:           outString = @"UIDeviceOrientationFaceDown";break ;
        case UIDeviceOrientationUnknown:           
        default:
            outString = @"UIDeviceOrientationUnknown";
            break;
    }
    return outString ;
}

+ (NSString*) interfaceOrientationFromEnum:(UIInterfaceOrientation)interfaceOrientation 
{    
    NSString* outString = @"interfaceOrientationError" ;
    
    switch ( interfaceOrientation ) {
        case UIInterfaceOrientationPortrait:           outString = @"UIInterfaceOrientationPortrait";break ;
        case UIInterfaceOrientationPortraitUpsideDown: outString = @"UIInterfaceOrientationPortraitUpsideDown";break ;
        case UIInterfaceOrientationLandscapeLeft:      outString = @"UIInterfaceOrientationLandscapeLeft";break ;
        case UIInterfaceOrientationLandscapeRight:     outString = @"UIInterfaceOrientationLandscapeRight";break ;
        default:
            break;
    }
    return outString ;
}

+ (NSString*) viewContentMode:(UIViewContentMode)mode 
{
    NSString* outString = nil ;
    
    switch (mode) {
        case UIViewContentModeScaleToFill:      outString = @"UIViewContentModeScaleToFill" ;break ;
        case UIViewContentModeScaleAspectFit:   outString = @"UIViewContentModeScaleAspectFit" ;break ;
        case UIViewContentModeScaleAspectFill:  outString = @"UIViewContentModeScaleAspectFill" ;break ;
        case UIViewContentModeRedraw:           outString = @"UIViewContentModeRedraw" ;break ;
        case UIViewContentModeCenter:           outString = @"UIViewContentModeCenter" ;break ;
        case UIViewContentModeTop:              outString = @"UIViewContentModeTop" ;break ;
        case UIViewContentModeBottom:           outString = @"UIViewContentModeBottom" ;break ;
        case UIViewContentModeLeft:             outString = @"UIViewContentModeLeft" ;break ;
        case UIViewContentModeRight:            outString = @"UIViewContentModeRight" ;break ;
        case UIViewContentModeTopLeft:          outString = @"UIViewContentModeTopLeft" ;break ;
        case UIViewContentModeTopRight:         outString = @"UIViewContentModeTopRight" ;break ;
        case UIViewContentModeBottomLeft:       outString = @"UIViewContentModeBottomLeft" ;break ;
        case UIViewContentModeBottomRight:      outString = @"UIViewContentModeBottomRight" ;break ;
        default:
            break;
    }
    return outString ;
}
#endif

+ (NSString*) UIEdgeInsets:(UIEdgeInsets) insets
{
  return NSStringFromUIEdgeInsets(insets);
}

+ (NSString*) rect:(CGRect)rect
{
    return [NSString stringWithFormat:@"(%02f:%02f - %02f:%02f)",rect.origin.x,rect.origin.y,rect.size.width,rect.size.height] ;
}

+ (NSString*) size:(CGSize)size 
{
    return [NSString stringWithFormat:@"(%02f:%02f)",size.width,size.height] ;    
}

+ (NSString*) point:(CGPoint)point
{
    return [NSString stringWithFormat:@"(%02f:%02f)",point.x,point.y] ;
}

#pragma mark - 
#pragma mark quickies
- (NSString*) trimWhiteSpace
{
    return [self stringByTrimmingCharactersInSet:
                [NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

+ (NSString*) stringWithUUID
{
    CFUUIDRef	uuidObj = CFUUIDCreate(nil);//create a new UUID
    
    //get the string representation of the UUID
    NSString	*uuidString = (NSString*)CFBridgingRelease(CFUUIDCreateString(nil, uuidObj));
    CFRelease(uuidObj);
    
    return uuidString;
}

- (BOOL)validateEmail
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    return [emailTest evaluateWithObject:self];
}

- (BOOL) validatePhoneNumber
{
    NSString* phoneRegex = @"^\\+(?:[0-9] ?){6,14}[0-9]$";
    NSPredicate* predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    
    return [predicate evaluateWithObject:self];
}

- (BOOL)validateCharOnly
{
    return [self length]; //TODO: fix this one
    
    //NSString *Regex = @"[A-Za-z]";
    //NSPredicate *test = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", Regex];
    
    //return [test evaluateWithObject:self];
}

- (BOOL)validateDigitsOnly
{
    return [self length]; //TODO: fix this one
    
    //NSString* regex = @"[0-9]";
    //NSPredicate *test = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    //return [test evaluateWithObject:self];
}

-(NSString*) sha1
{
    const char *cstr = [self cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:self.length];
    
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    
    CC_SHA1(data.bytes, (CC_LONG)data.length, digest);
    
    NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return output;

}

- (NSString *) md5
{
    const char *cStr = [self UTF8String];
    unsigned char digest[16];
    CC_MD5( cStr, (CC_LONG)strlen(cStr), digest ); // This is the md5 call
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return  output;
    
}

//- (NSString *)hashSHA512 {
//    const char *s = [self cStringUsingEncoding:NSASCIIStringEncoding];
//    NSData *keyData = [NSData dataWithBytes:s length:strlen(s)];
//    uint8_t digest[CC_SHA512_DIGEST_LENGTH] = {0};
//    CC_SHA512(keyData.bytes, keyData.length, digest);
//    NSData *out = [NSData dataWithBytes:digest length:CC_SHA512_DIGEST_LENGTH];
//    return [out description];
//}
//
//// Encode a string to embed in an URL.
//- (NSString*)encodeToPercentEscapeString {
//    return (NSString *)
//    CFURLCreateStringByAddingPercentEscapes(NULL,
//                                            (CFStringRef) self,
//                                            NULL,
//                                            (CFStringRef) @"!*'();:@&=+$,/?%#[]",
//                                            kCFStringEncodingUTF8);
//}
//
//// Decode a percent escape encoded string.
//- (NSString*)decodeFromPercentEscapeString {
//    return (NSString *)
//    CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL,
//                                                            (CFStringRef) self,
//                                                            CFSTR(""),
//                                                            kCFStringEncodingUTF8);
//}


@end
