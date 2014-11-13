//
//  DogsViewController.m
//  Assessment4
//
//  Created by Vik Denic on 8/11/14.
//  Copyright (c) 2014 MobileMakers. All rights reserved.
//

#import "DogsViewController.h"
#import "Dog.h"
#import "DogOwner.h"
#import "AddDogViewController.h"

@interface DogsViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *dogsTableView;
@property (strong, nonatomic) NSArray *dogsArray;

@end

@implementation DogsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Dogs";
    [self loadDogsForOwnerAndReloadData];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self loadDogsForOwnerAndReloadData];
}


#pragma mark - UITableView Delegate Methods

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dogsArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"dogCell"];

    Dog *dog = self.dogsArray[indexPath.row];
    cell.textLabel.text = dog.name;
    return cell;
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    Dog *chosenDog = self.dogsArray[indexPath.row];
    [self showAddDogViewControllerForDog:chosenDog];
}

- (void)showAddDogViewControllerForDog:(Dog *)dog
{
    AddDogViewController *addDogVC = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([AddDogViewController class])];
    addDogVC.dog = dog;

    //Creating a navVC
    UINavigationController *navVC = [[UINavigationController alloc]initWithRootViewController:addDogVC];

    [self presentViewController:navVC animated:YES completion:^{
        nil;
    }];
}

#pragma mark Load Dogs Data

- (void)loadDogsForOwnerAndReloadData
{
    self.dogsArray = [self.chosenDogOwner.dogs allObjects];
    [self.dogsTableView reloadData];
}

#pragma mark Segue

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString: @"AddDogSegue"])
    {
        AddDogViewController *addDogVC =  segue.destinationViewController;
        addDogVC.managedObjectContext = self.managedObjectContext;
        addDogVC.chosenDogOwner = self.chosenDogOwner;
    }
    else
    {
        AddDogViewController *addDogVC = segue.destinationViewController;
        NSInteger rowNumber = [self.dogsTableView indexPathForSelectedRow].row;
        Dog *chosenDog = [self.dogsArray objectAtIndex:rowNumber];
        addDogVC.dog = chosenDog;
    }
}

@end

























