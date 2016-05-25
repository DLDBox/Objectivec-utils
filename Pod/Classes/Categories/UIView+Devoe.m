//
//  UIView+Devoe.m
//  LightPhoto
//
//  Created by Dana De Voe on 6/6/14.
//  Copyright (c) 2014 Dana Devoe. All rights reserved.
//

#import "UIView+Devoe.h"
#import "NSString+Devoe.h"

@implementation UIView (Devoe)

+(id)autolayoutView
{
    UIView *view = [self new];
    
    view.translatesAutoresizingMaskIntoConstraints = NO;
    return view;
}

+ (UIImage *) getScreenShotOfView:(UIView *)theView
{
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)])
        UIGraphicsBeginImageContextWithOptions(theView.bounds.size, NO, [UIScreen mainScreen].scale);
    else
        UIGraphicsBeginImageContext(theView.bounds.size);
    
    [theView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *) getScreenShotOfView:(UIView *)theView withRect:(CGRect)rect
{
    return nil;
}

#pragma mark Validation Methods

- (BOOL)validateNonZeroLength:(UITextField *)textField
{
   return [textField.text length] ? YES : NO;
}

- (BOOL)validateNameString:(UITextField *)textField
{
   return [textField.text validateCharOnly];
}

- (BOOL)validateAddress:(UITextField *)textField
{
   return [self validateNonZeroLength:textField];
}

- (BOOL)validateCity:(UITextField *)textField
{
   return [textField.text validateCharOnly];
}

- (BOOL)validateState:(UITextField *)textField
{
   return [textField.text validateCharOnly];
}

- (BOOL)validateZip:(UITextField *)textField
{
   return [textField.text validateDigitsOnly];
}

- (BOOL)validateEmail:(UITextField *)textField
{
   return [textField.text validateEmail];
}

- (BOOL)validateCreditCard:(UITextField *)textField
{
   return [textField.text validateDigitsOnly];
}

- (BOOL)validateDate:(UITextField *)textField
{
   DLog( @"Date Validation not implemented yet" ) ;
   return YES;
}

- (BOOL)validatePhone:(UITextField *)textField
{
   return [textField.text validateDigitsOnly];
   //return [textField.text validatePhoneNumber];
}

- (BOOL)validateCVV:(UITextField *)textField
{
   return [textField.text validateDigitsOnly];
}


@end
