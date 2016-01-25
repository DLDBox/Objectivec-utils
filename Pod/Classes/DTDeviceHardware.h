//
//  TADeviceHardware.h
//  ThinaireController
//
//  Created by Dana Devoe on 9/9/15.
//  Copyright (c) 2015 Google. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DTDeviceHardware : NSObject

- (NSString *) platform;
- (NSString *) platformString;

- (BOOL) supportBluetoothSmart;

@end
