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
@property (weak, nonatomic) NSArray *dogsArray;

@end

@implementation DogsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Dogs";
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

    }
}

@end
