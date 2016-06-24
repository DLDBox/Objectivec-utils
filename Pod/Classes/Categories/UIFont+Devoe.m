//
//  UIFont+Devoe.m
//  LightPhoto
//
//  Created by Dana De Voe on 2/26/15.
//  Copyright (c) 2015 Dana Devoe. All rights reserved.
//

#import "UIFont+Devoe.h"

@implementation UIFont (Devoe)

+ (id) popupMenuFont
{
    //NSArray *fontNames = [UIFont fontNamesForFamilyName:@"Avenir"];
    
    return [UIFont fontWithName:@"Avenir Book" size: 12.0];
}

+ (id) mediumFont
{
    //NSArray *fontNames = [UIFont fontNamesForFamilyName:@"Avenir"];
    
    return [UIFont fontWithName:@"Avenir Book" size: 12.0];
}

+ (id) defaultFont
{
    //NSArray *fontNames = [UIFont fontNamesForFamilyName:@"Avenir"];
    
    return [UIFont fontWithName:@"Avenir Book" size: 15.0];
}

+ (id) bigFont
{
    return [UIFont fontWithName:@"Avenir Book" size: 20.0];
}

+ (id) menuFont
{
    return [UIFont fontWithName:@"Avenir Book" size: 18.0];
}

@end
