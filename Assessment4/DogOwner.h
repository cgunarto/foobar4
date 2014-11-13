//
//  DogOwner.h
//  Assessment4
//
//  Created by CHRISTINA GUNARTO on 11/13/14.
//  Copyright (c) 2014 MobileMakers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Dog;

@interface DogOwner : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *dogs;
@end

@interface DogOwner (CoreDataGeneratedAccessors)

- (void)addDogsObject:(Dog *)value;
- (void)removeDogsObject:(Dog *)value;
- (void)addDogs:(NSSet *)values;
- (void)removeDogs:(NSSet *)values;

+ (void)retrieveDogOwnersWithCompletion:(void(^)(NSMutableArray *dogOwnerObjectsArray, NSError *error))complete;


@end
