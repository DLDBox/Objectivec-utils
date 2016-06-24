//
//  DTAnalyticManager.h
//  LightPhoto
//
//  Created by Dana De Voe on 6/21/14.
//  Copyright (c) 2014 Dana Devoe. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, DTAnalyticVendor){
     DTAnalyticVendorFlurry=1
    ,DTAnalyticVendorMixPanel=2
    ,DTAnalyticVendorGoogle=4
    ,DTAnalyticVendorOmniture=8
    ,DTAnalyticVendorParse=16
};

#define LOGEVENT(e) [DTAnalyticManager logEvent:e withVendor:DTAnalyticVendorFlurry]
#define LOGEVENTPARAM(e,p) [DTAnalyticManager logEvent:e withProperty:p withVendor:DTAnalyticVendorFlurry]

static NSString const* kEventInitialExecution = @"Initial Execution";
static NSString const* kEventReinstalled = @"Reinstalled";
static NSString const* kApplicationRun = @"Application Run";
static NSString const* kRunWithNoCamera = @"Run with No Camera";

static NSString const* kPurchaseSuccessful = @"Purchase Successful";
static NSString const* kPurchaseError = @"Purchase Error";
static NSString const* kPurchaseStarted = @"Purchase Started";
static NSString const* kImageUploadError = @"Image Upload Error";
static NSString const* kImageNotFound = @"Image Not Found";
static NSString const* kOrderCancel = @"Order canceled";

static NSString const* kEnterPurchasePage = @"Enter Purchase Page";
static NSString const* kEnterExitPurchasePageNoPurchase = @"Exit Purchase Page without purcahsing";

static NSString const* kEventMenu = @"Menu";
static NSString const* kEventMenuShareApp = @"Menu Share App";
static NSString const* kEventMenuSetting = @"Menu Setting" ;
static NSString const* kEventMenuBrowse = @"Menu Browse" ;
static NSString const* kEventMenuContact = @"Menu Contact" ;
static NSString const* kEventMenuTutorial = @"Menu Tutorial" ;
static NSString const* kEventMenuAbout = @"Menu About" ;

//static NSString const* kEvent = @"" ;

///////////////////////////////////
//smile tyme
static NSString const* kNetWorkCreated = @"Network Created"; ///parameters @{ }
//static NSString const* kNetWorkCreated_CrewCount = @"Crew Count"; ///parameters @{ @"Crew Count" : @(5) } // look at this one on disconnect
static NSString const* kNetWorkCreated_UsedPassword = @"Used Password"; ///parameters @{ @"Used Password" : @(FALSE) }
static NSString const* kNetWorkCreated_UsersDisconnected = @"Users Disconnected"; ///parameters @{ @"Used Password" : @(FALSE) }
static NSString const* kNetWorkCreated_CrewCount = @"Crew Count"; ///parameters @{ @"Crew Count" : @(5), kNetWorkCreated_Hash: @(ewrdsf) } // look at this one on disconnect
static NSString const* kNetWorkCreated_Hash = @"Network Hash";

static NSString const* kNetworkCancelled = @"Network Canceled"; ///parameters @{ }

static NSString const* kNetworkDisconnected = @"Network Disconnected"; ///parameters @{ }
static NSString const* kNetworkDisconnected_Pic_Count = @"Pictures"; ///parameters @{ @"Pictures" : @(10) }
static NSString const* kNetWorkDisconnected_CrewCount = @"Crew Count"; ///parameters @{ @"Crew Count" : @(5) } // look at this one on disconnect

static NSString const* kNetworkError = @"Network Error";
static NSString const* kNetworkErrorDisconnect = @"Network Error Disconnect";

//static NSString const* kMenuHelp = @"Menu Help";
//static NSString const* kMenuAbout = @"Menu About";
//static NSString const* kMenuBrowse = @"Menu Browse";
//static NSString const* kMenuContact = @"Menu Contact";
//static NSString const* kMenuSetting = @"Menu Setting";
//static NSString const* kMenuFriend = @"Menu Friend";

static NSString const* kEditPhoto = @"Edit Photo";
static NSString const* kUseFilter = @"Use Fitler"; // @{ kUseFilter_Filter : @"FilterName" }
static NSString const* kUseFilter_Filter = @"Use Fitler";

static NSString const* kCaptureImage = @"Capture Image";

// @{ @"ToneOnNewImage" : @(BOOL), @"VibrateOnNewImage" : @(BOOL),@"VibrateOnDisconnect" : @(BOOL),
//    @"ConnectDisconnectAlert":@(BOOL),@"ImageQuality":@(0:lowest,1:low,etc)  }
static NSString const* kSetting = @"Settings";


//static NSString const* k = @"";

@interface DTAnalyticManager : NSObject
+ (void) initAnalytic:(DTAnalyticVendor)vendor withAPPKey:(NSString*)appKey;
+ (void) logEvent:(NSString const*)string withVendor:(DTAnalyticVendor)vendor;
+ (void) logEvent:(NSString const*)string withProperty:(NSDictionary *)dictionary withVendor:(DTAnalyticVendor)vendor;

+ (void) logPeople:(NSString const*)name withEmail:(NSString*)email withAPNToken:(NSString *)token withVendor:(DTAnalyticVendor)vendor;

@end
