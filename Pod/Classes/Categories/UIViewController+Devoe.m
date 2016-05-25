//
//  UIViewController+Devoe.m
//  LightPhoto
//
//  Created by Dana De Voe on 5/11/14.
//  Copyright (c) 2014 Dana Devoe. All rights reserved.
//

#import "UIViewController+Devoe.h"
#import "NSString+Devoe.h"
#import "UIAlertController+MZStyle.h"


@implementation UIViewController (Devoe)

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

+ (void) errorInViewController:(UIViewController*)vc
                          withMessage:(NSString *)message
                            withTitle:(NSString *)title
                         cancelButton:(NSString *)cancelText
                    acknowledgeButton:(NSString *)ackText
                      completionBlock:( void (^)() )block{
    
    // Tell UIAlertController that you will use custom style
    [UIAlertController mz_applyCustomStyleForAlertControllerClass:[UIAlertController class]];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    alert.currentStyle.blurEffectStyle = UIBlurEffectStyleDark;
    alert.currentStyle.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
    alert.currentStyle.shouldApplyBlur = YES;
    
    if (cancelText.length ) {
        [alert addAction:[UIAlertAction actionWithTitle:cancelText style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            [vc dismissViewControllerAnimated:YES completion:nil];
        }]];
    }
    
    if ( ackText.length ) {
        [alert addAction:[UIAlertAction actionWithTitle:ackText style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            block();
        }]];
    }
    
    [vc presentViewController:alert animated:YES completion:nil];
}

- (void) errorMessage:(NSString *)message withTitle:(NSString *)title cancelButton:(NSString *)cancelText acknowledgeButton:(NSString *)ackText completionBlock:( void (^)() )block
{
    // Tell UIAlertController that you will use custom style
    [UIAlertController mz_applyCustomStyleForAlertControllerClass:[UIAlertController class]];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    alert.currentStyle.blurEffectStyle = UIBlurEffectStyleDark;
    alert.currentStyle.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
    alert.currentStyle.shouldApplyBlur = YES;
    
    if (cancelText.length ) {
        [alert addAction:[UIAlertAction actionWithTitle:cancelText style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            [self dismissViewControllerAnimated:YES completion:nil];
        }]];
    }
    
    if ( ackText.length ) {
        [alert addAction:[UIAlertAction actionWithTitle:ackText style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            block();
        }]];
    }
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (void) warningMessage:(NSString *)message{
    [self errorMessage:message withTitle:@"Warning" cancelButton:@"OK" acknowledgeButton:nil completionBlock:NULL];
    
}

- (void) errorMessage:(NSString *)message {
    [self errorMessage:message withTitle:@"Error" cancelButton:@"OK" acknowledgeButton:nil completionBlock:NULL];
}

- (void) errorMessage:(NSString *)message acknowledgeButton:(NSString *)ackText completionBlock:( void (^)() )block {
    [self errorMessage:message withTitle:@"Error" cancelButton:@"CANCEL" acknowledgeButton:ackText completionBlock:block];
}

- (void) toast:(NSString *)message duration:(CGFloat)seconds
{
    // Tell UIAlertController that you will use custom style
    [UIAlertController mz_applyCustomStyleForAlertControllerClass:[UIAlertController class]];
    static UIAlertController *alert;
    
    if ( message == nil ) {
        [self dismissViewControllerAnimated:YES completion:^(){}];
    }
    
    alert = [UIAlertController alertControllerWithTitle:nil
                                                message:message
                                         preferredStyle:UIAlertControllerStyleAlert];
    
    alert.currentStyle.blurEffectStyle = UIBlurEffectStyleDark;
    alert.currentStyle.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
    alert.currentStyle.shouldApplyBlur = YES;
    
    if ( seconds )
    {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW,(int64_t)(seconds * NSEC_PER_SEC)), dispatch_get_main_queue(),^(){
            [self dismissViewControllerAnimated:YES completion:^(){}];
        });
    }
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (void) activityIndicators:(BOOL)on
{
    if ( on ) {
        
    }
    else{
        
    }
}

@end
