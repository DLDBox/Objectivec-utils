//
//  DTReachability.m
//  DeluxeHome
//
//  Created by Dana on 6/1/13.
//  Copyright (c) 2013 DevoeTechnologies. All rights reserved.
//

#import "DTReachability.h"

@implementation DTReachability

+ (BOOL) is3GReachable:(NSString*)hostName
{
	NetworkStatus netStatus = [[Reachability reachabilityWithHostName:hostName] currentReachabilityStatus];
	BOOL connectionRequired = [[Reachability reachabilityWithHostName:hostName] connectionRequired];
	
	if ((netStatus == ReachableViaWWAN) && !connectionRequired)
		return YES;
	
	return NO;
}

+ (BOOL) isWiFiReachable:(NSString*)hostName
{
	NetworkStatus netStatus = [[Reachability reachabilityWithHostName:hostName] currentReachabilityStatus];
	
	return (netStatus == ReachableViaWiFi) ? TRUE : FALSE;
}

+ (BOOL) isServerReachable:(NSString*)hostName
{
	NetworkStatus netStatus = [[Reachability reachabilityWithHostName:hostName] currentReachabilityStatus];
	BOOL connectionRequired = [[Reachability reachabilityWithHostName:hostName] connectionRequired];
	
	//server is reachable
	if ( (netStatus == ReachableViaWiFi) || ((netStatus == ReachableViaWWAN) && !connectionRequired) )
		return YES;
	
	return NO;
}


+ (BOOL) isConnectionRequired:(NSString*)hostName
{
    return [[Reachability reachabilityWithHostName:hostName] connectionRequired] ? YES : NO;
}
@end
