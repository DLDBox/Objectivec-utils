//
//  DTAnalyticManager.m
//  LightPhoto
//
//  Created by Dana De Voe on 6/21/14.
//  Copyright (c) 2014 Dana Devoe. All rights reserved.
//

#import "DTAnalyticManager.h"
//#import "Mixpanel.h"
#import "Flurry.h"

@implementation DTAnalyticManager

+ (void) initAnalytic:(DTAnalyticVendor)vendor withAPPKey:(NSString*)appKey
{
   if ( vendor & DTAnalyticVendorFlurry) {
      [Flurry startSession:appKey];
   }
   
    if ( vendor & DTAnalyticVendorMixPanel) {
        DLog( @"Mixpanel logging Not Implemented Yet" );
    }
    
    if ( vendor & DTAnalyticVendorGoogle) {
        DLog( @"Google logging Not Implemented Yet" );
    }
    
    if ( vendor & DTAnalyticVendorOmniture) {
        DLog( @"Omniture logging Not Implemented Yet" );
    }
}

+ (void) logEvent:(NSString const*)string withVendor:(DTAnalyticVendor)vendor
{
   if ( vendor & DTAnalyticVendorFlurry) {
      [Flurry logEvent:(NSString*)string];
   }
   
   if ( vendor & DTAnalyticVendorMixPanel) {
       DLog( @"Mixpanel logging Not Implemented Yet" );
   }
   
   if ( vendor & DTAnalyticVendorGoogle) {
       DLog( @"Google logging Not Implemented Yet" );
   }
   
   if ( vendor & DTAnalyticVendorOmniture) {
       DLog( @"Omniture logging Not Implemented Yet" );
   }
}

+ (void) logEvent:(NSString const*)string withProperty:(NSDictionary *)dictionary withVendor:(DTAnalyticVendor)vendor
{
   if ( vendor & DTAnalyticVendorFlurry) {
      [Flurry logEvent:(NSString*)string withParameters:dictionary];
   }
   
    if ( vendor & DTAnalyticVendorMixPanel) {
        DLog( @"Mixpanel logging Not Implemented Yet" );
    }
    
    if ( vendor & DTAnalyticVendorGoogle) {
        DLog( @"Google logging Not Implemented Yet" );
    }
    
    if ( vendor & DTAnalyticVendorOmniture) {
        DLog( @"Omniture logging Not Implemented Yet" );
    }
}

+ (void) logPeople:(NSString const*)name withEmail:(NSString*)email withAPNToken:(NSString *)token withVendor:(DTAnalyticVendor)vendor
{
   if ( vendor & DTAnalyticVendorFlurry) {
       DLog( @"Flurry People logging Not Implemented Yet" );
   }
   
    if ( vendor & DTAnalyticVendorMixPanel) {
        DLog( @"Mixpanel logging Not Implemented Yet" );
    }
    
    if ( vendor & DTAnalyticVendorGoogle) {
        DLog( @"Google logging Not Implemented Yet" );
    }
    
    if ( vendor & DTAnalyticVendorOmniture) {
        DLog( @"Omniture logging Not Implemented Yet" );
    }
}


@end
