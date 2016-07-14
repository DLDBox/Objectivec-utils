//
//  DSPersistor.h
//  DuaSmile
//
//  Created by Dana Devoe on 4/17/16.
//  Copyright © 2016 Dana Devoe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AutoEncodingObject.h"

/* This object is designed to persist the contents of the object which inherits it.
 the object will create an file on disk with the same names as the class of the child object
 
 The contents are read into memory when the object is initialized
 The contents can be written by calling [id sync];
 
 */

typedef void (^ErrorNotification)(NSError *error);

@interface DSPersistor : AutoEncodingObject

@property (nonatomic,copy) ErrorNotification errorBlock;

//Writes out the current values in the child class to the disk with the same name as the class
- (void) sync;

//Deletes the file which is persisting the object values
- (void) wipe;

@end
