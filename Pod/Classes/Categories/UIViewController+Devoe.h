//
//  UIViewController+Devoe.h
//  LightPhoto
//
//  Created by Dana De Voe on 5/11/14.
//  Copyright (c) 2014 Dana Devoe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Devoe)

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

- (void) errorMessage:(NSString *)message
            withTitle:(NSString *)title
         cancelButton:(NSString *)cancelText
    acknowledgeButton:(NSString *)ackText
      completionBlock:( void (^)() )block;

+ (void) errorInViewController:(UIViewController*)vc
                          withMessage:(NSString *)message
                            withTitle:(NSString *)title
                         cancelButton:(NSString *)cancelText
                    acknowledgeButton:(NSString *)text
                      completionBlock:( void (^)() )block;

- (void) warningMessage:(NSString *)message;
- (void) errorMessage:(NSString *)message;

- (void) errorMessage:(NSString *)message acknowledgeButton:(NSString *)text completionBlock:( void (^)() )block;

- (void) toast:(NSString *)message duration:(CGFloat)seconds;

- (void) activityIndicators:(BOOL)on;

@end
