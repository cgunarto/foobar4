//
//  Dog.h
//  Assessment4
//
//  Created by CHRISTINA GUNARTO on 11/13/14.
//  Copyright (c) 2014 MobileMakers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DogOwner;

@interface Dog : NSManagedObject

@property (nonatomic, retain) NSString * breed;
@property (nonatomic, retain) NSString * color;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) DogOwner *owner;

@end
