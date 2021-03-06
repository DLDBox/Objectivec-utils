//
//  UIColor+Devoe.m
//  LightPhoto
//
//  Created by Dana De Voe on 5/8/14.
//  Copyright (c) 2014 Dana Devoe. All rights reserved.
//

#import "UIColor+Devoe.h"
#import "DTGlobals.h"

@implementation UIColor (Devoe)

+ (UIColor *)errorFieldHightLight
{
   return [UIColor colorWithRed:1.0 green:0.4 blue:0.4 alpha:0.7];
}

+ (UIColor *)backgroundColor
{
   return [UIColor clearColor];
}

+ (UIColor *)textColor
{
   return [UIColor lightGrayColor];
}

+ (UIColor *)highLightBlue
{
   return RGBCOLOR(113.0,159.0,225.0);
}

+ (UIColor *)unhighLightBlue
{
   return RGBCOLOR(225.0,230.0,225.0);
}

+ (UIColor *) lightBlue
{
   return [UIColor colorWithRed:0.0 green:0.0 blue:1.0 alpha:0.5];
}

+ (UIColor *) lightGreen
{
   return [UIColor colorWithRed:0.0 green:1.0 blue:0.0 alpha:0.5];
}

#pragma mark - Create colors
/** @name Create colors */

/**
 *  Creates and returns a color object using the specified opacity and RGB component values.
 *
 *  @param red   The red component of the color object, specified as a value from 0 to 255.
 *  @param green The green component of the color object, specified as a value from 0 to 255.
 *  @param blue  The blue component of the color object, specified as a value from 0 to 255.
 *  @param alpha The opacity value of the color object, specified as a value from 0 to 255.
 *
 *  @return The color object. The color information represented by this object is in the device RGB colorspace.
 */
+ (UIColor *)colorWithR255:(NSInteger)red G255:(NSInteger)green B255:(NSInteger)blue A255:(NSInteger)alpha
{
   return ([UIColor colorWithRed:((CGFloat) red / 255) green:((CGFloat) green / 255) blue:((CGFloat) blue / 255) alpha:((CGFloat) alpha / 255)]);
}

#pragma mark - Center view colors
/** @name Center view colors */

/**
 *  Return the background color of the center view.
 *
 *  @return The color object.
 */
+ (UIColor *)centerBackgroundColor
{
   return ([UIColor colorWithR255:102 G255:169 B255:250 A255:255]);
}

/**
 *  Return the navigation bar background color.
 *
 *  @return The color object.
 */
+ (UIColor *)centerNavBarBackgroundColor
{
   return [UIColor whiteColor];
   //return ([UIColor colorWithR255:91 G255:165 B255:255 A255:255]);
}

/**
 *  Return the text background color of the table view footer.
 *
 *  @return The color object.
 */
+ (UIColor *)centerTableViewFooterTextColor
{
   return ([UIColor darkGrayColor]);
}

/**
 *  Return the table view section background color.
 *
 *  @return The color object.
 */
+ (UIColor *)centerTableViewSectionBackgroundColor
{
   return ([UIColor centerBackgroundColor]);
}

#pragma mark - Menu colors
/** @name Menu colors */

/**
 *  Return the background color of the menu.
 *
 *  @return The color object.
 */
+ (UIColor *)menuBackgroundColor
{
    //return ([UIColor colorWithR255:42 G255:42 B255:42 A255:255]);
   return ([UIColor colorWithR255:64 G255:128 B255:128 A255:255]);
}

/**
 *  Return the color of the status bar when the menu view is displayed.
 *
 *  @return The color object.
 */
+ (UIColor *)menuStatusBarColor
{
   return ([UIColor menuBackgroundColor]);
}

/**
 *  Return the background color of the menu's table view cells.
 *
 *  @return The color object.
 */
+ (UIColor *)menuTableViewCellBackgroundColor
{
   return ([self menuBackgroundColor]);
}

/**
 *  Return the background color of the menu's table view selected cells.
 *
 *  @return The color object.
 */
+ (UIColor *)menuTableViewCellBackgroundSelectedColor
{
   return ([UIColor colorWithR255:34 G255:34 B255:34 A255:255]);
}

/**
 *  Return the text color of the menu's table view cells.
 *
 *  @return The color object.
 */
+ (UIColor *)menuTableViewCellTextColor
{
    return ([UIColor blackColor]);
    //return ([UIColor colorWithR255:167 G255:167 B255:167 A255:255]);
}

/**
 *  Return the text color of the menu's table view selected cells.
 *
 *  @return The color object.
 */
+ (UIColor *)menuTableViewCellTextSelectedColor
{
   return ([UIColor colorWithR255:207 G255:207 B255:207 A255:255]);
}

/**
 *  Return the color of the menu's table view separators.
 *
 *  @return The color object.
 */
+ (UIColor *)menuTableViewSeparatorsColor
{
   return ([UIColor colorWithR255:30 G255:30 B255:30 A255:255]);
}

#pragma mark - Navigation bar buttons
/** @name Navigation bar buttons */

/**
 *  Return the color of the navigation bar of type "Menu".
 *
 *  @return The color object.
 */
+ (UIColor *)navigationBarMenuColor
{
   return ([UIColor lightGrayColor]);
}

+(UIColor *)randomColor
{
    CGFloat rChannel = arc4random()%256;
    CGFloat gChannel = arc4random()%256;
    CGFloat bChannel = arc4random()%256;
    
    return [[UIColor alloc] initWithRed:rChannel/256.0
                                  green:gChannel/256.0
                                   blue:bChannel/256.0
                                  alpha:1.0];
}
@end
