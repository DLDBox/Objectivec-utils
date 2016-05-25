//
//  UIView+Devoe.h
//  LightPhoto
//
//  Created by Dana De Voe on 6/6/14.
//  Copyright (c) 2014 Dana Devoe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Devoe)

+ (id) autolayoutView;
+ (UIImage *) getScreenShotOfView:(UIView *)theView;

- (BOOL)validateNonZeroLength:(UITextField *)textField;
- (BOOL)validateNameString:(UITextField *)textField;
- (BOOL)validateAddress:(UITextField *)textField;
- (BOOL)validateCity:(UITextField *)textField;
- (BOOL)validateState:(UITextField *)textField;
- (BOOL)validateZip:(UITextField *)textField;
- (BOOL)validatePhone:(UITextField *)textField;
- (BOOL)validateEmail:(UITextField *)textField;

- (BOOL)validateCreditCard:(UITextField *)textField;
- (BOOL)validateDate:(UITextField *)textField;
- (BOOL)validateCVV:(UITextField *)textField;

@end
