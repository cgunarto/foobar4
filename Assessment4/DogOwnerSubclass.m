//
//  DogOwnerSubclass.m
//  Assessment4
//
//  Created by CHRISTINA GUNARTO on 11/13/14.
//  Copyright (c) 2014 MobileMakers. All rights reserved.
//

#import "DogOwnerSubclass.h"

@implementation DogOwnerSubclass

+ (void)retrieveDogOwnersWithCompletion:(void(^)(NSMutableArray *dogOwnerObjectsArray, NSError *error))complete
{

    NSString* path = [[NSBundle mainBundle] pathForResource:@"owners"
                                                     ofType:@"json"];
    NSURL *url = [NSURL fileURLWithPath:path];
    NSData *data = [NSData dataWithContentsOfURL:url];

    NSArray *readersFromJSON = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSMutableArray *dogOwnersArray = [@[]mutableCopy];

    for (NSString *name in readersFromJSON)
    {
        DogOwner *dogOwner = [[DogOwner alloc]init];
        dogOwner.name = name;
        [dogOwnersArray addObject:dogOwner];
    }

    complete (dogOwnersArray,nil);
}

@end
