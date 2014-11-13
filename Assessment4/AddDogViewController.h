//
//  AddDogViewController.h
//  Assessment4
//
//  Created by Vik Denic on 8/11/14.
//  Copyright (c) 2014 MobileMakers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@class DogOwner;
@class Dog;

@interface AddDogViewController : UIViewController
@property DogOwner *chosenDogOwner;
@property Dog *dog;

@property NSManagedObjectContext *managedObjectContext;

@end
