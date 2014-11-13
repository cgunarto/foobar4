//
//  AddDogViewController.m
//  Assessment4
//
//  Created by Vik Denic on 8/11/14.
//  Copyright (c) 2014 MobileMakers. All rights reserved.
//

#import "AddDogViewController.h"
#import "DogOwner.h"
#import "Dog.h"

@interface AddDogViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *breedTextField;
@property (weak, nonatomic) IBOutlet UITextField *colorTextField;

@end

@implementation AddDogViewController

//TODO: UPDATE CODE ACCORIDNGLY

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Add Dog";
}

- (IBAction)onPressedUpdateDog:(UIButton *)sender
{
    if ([self.nameTextField.text isEqualToString:@""] ||
        [self.breedTextField.text isEqualToString:@""] ||
        [self.colorTextField.text isEqualToString:@""])
    {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"INVALID ENTRY"
                                                                       message:@"Please make sure there are no blank spaces"
                                                                preferredStyle:UIAlertControllerStyleAlert];

        UIAlertAction *okButton = [UIAlertAction actionWithTitle:@"OK"
                                                           style:UIAlertActionStyleDefault
                                                         handler:nil];
        [alert addAction:okButton];
        [self presentViewController:alert
                           animated:YES
                         completion:nil];

    }
    else
    {
        Dog *dog = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([Dog class]) inManagedObjectContext:self.managedObjectContext];
        dog.name = self.nameTextField.text;
        dog.breed = self.breedTextField.text;
        dog.color = self.colorTextField.text;

        [self.chosenDogOwner addDogsObject:dog];
        [self.managedObjectContext save:nil];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

@end
