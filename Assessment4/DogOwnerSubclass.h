//
//  DogOwnerSubclass.h
//  Assessment4
//
//  Created by CHRISTINA GUNARTO on 11/13/14.
//  Copyright (c) 2014 MobileMakers. All rights reserved.
//

#import "DogOwner.h"

@interface DogOwnerSubclass : DogOwner

+ (void)retrieveDogOwnersWithCompletion:(void(^)(NSMutableArray *dogOwnerObjectsArray, NSError *error))complete;

@end
