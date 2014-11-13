//
//  ViewController.m
//  Assessment4
//
//  Created by Vik Denic on 8/11/14.
//  Copyright (c) 2014 MobileMakers. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "DogOwner.h"
#import "DogsViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource, UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (strong, nonatomic) NSMutableArray *dogOwnersArray;

@property UIAlertView *addAlert;
@property UIAlertView *colorAlert;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Dog Owners";

    AppDelegate *delegate = [[UIApplication sharedApplication]delegate];
    self.managedObjectContext = delegate.managedObjectContext;

    [self loadDogOwnersAndReloadData];
    [self.myTableView reloadData];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self loadDogOwnersAndReloadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    DogsViewController *dogVC = segue.destinationViewController;
    dogVC.managedObjectContext = self.managedObjectContext;

    NSIndexPath *indexPath = [self.myTableView indexPathForSelectedRow];
    DogOwner *chosenDogOwner = self.dogOwnersArray[indexPath.row];

    dogVC.chosenDogOwner = chosenDogOwner;
}

#pragma mark - UITableView Delegate Methods

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dogOwnersArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"myCell"];
    DogOwner *dogOwner = self.dogOwnersArray[indexPath.row];

    cell.textLabel.text = dogOwner.name;

    return cell;
}

#pragma mark - UIAlertView Methods

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //TODO: SAVE USER'S DEFAULT COLOR PREFERENCE USING THE CONDITIONAL BELOW

    if (buttonIndex == 0)
    {
        self.navigationController.navigationBar.tintColor = [UIColor purpleColor];
    }
    else if (buttonIndex == 1)
    {
        self.navigationController.navigationBar.tintColor = [UIColor blueColor];
    }
    else if (buttonIndex == 2)
    {
        self.navigationController.navigationBar.tintColor = [UIColor orangeColor];
    }
    else if (buttonIndex == 3)
    {
        self.navigationController.navigationBar.tintColor = [UIColor greenColor];
    }

}

//METHOD FOR PRESENTING USER'S COLOR PREFERENCE
- (IBAction)onColorButtonTapped:(UIBarButtonItem *)sender
{
    self.colorAlert = [[UIAlertView alloc] initWithTitle:@"Choose a default color!"
                                                    message:nil
                                                   delegate:self
                                          cancelButtonTitle:nil
                                          otherButtonTitles:@"Purple", @"Blue", @"Orange", @"Green", nil];
    self.colorAlert.tag = 1;
    [self.colorAlert show];
}

- (void)loadDogOwnersAndReloadData
{
    NSError *error;
    NSFetchRequest *request = [[NSFetchRequest alloc]initWithEntityName:@"DogOwner"];
    NSSortDescriptor *sortByName = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    request.sortDescriptors = @[sortByName];

    self.dogOwnersArray = [[self.managedObjectContext executeFetchRequest:request error:&error]mutableCopy];

    //if readersListArray is empty, populate it with Reader objects and save it to core data
    if (self.dogOwnersArray.count == 0)
    {
        //JSON Data retrieval consolidation in the model array
        [DogOwner retrieveDogOwnersWithCompletion:^(NSMutableArray *dogOwnerObjectsArray, NSError *error)
        {
            self.dogOwnersArray = dogOwnerObjectsArray;
        }];

        [self.managedObjectContext save:nil];
    }
    [self.myTableView reloadData];

}

@end
