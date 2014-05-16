//
//  DetailViewController.m
//  Tutorial - Table View
//
//  Created by Vishal Deep on 12/05/14.
//  Copyright (c) 2014 Logiciel Solutions. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize student;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark - UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"ID";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%d", student.sid];
            break;
        case 1:
            cell.textLabel.text = @"First Name";
            cell.detailTextLabel.text = student.firstName;
            break;
        case 2:
            cell.textLabel.text = @"Last Name";
            cell.detailTextLabel.text = student.lastName;
            break;
        case 3:
            cell.textLabel.text = @"Roll Number";
            cell.detailTextLabel.text = student.rollNumber;
            break;
            
        default:
            break;
    }
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"EditSegue"]) {
        UINavigationController *navController = (UINavigationController*)segue.destinationViewController;
        EditViewController *viewController = (EditViewController*)[navController topViewController];
        [viewController setDelegate:self];
        
        NSLog(@"Student first name: %@", student.firstName);
        [viewController setStudent:self.student];
    }
}

#pragma mark - EditViewDelegate

- (void)editViewRecordSaved {
    [[self presentedViewController] dismissViewControllerAnimated:YES completion:^(void) {
        [[self navigationController] popViewControllerAnimated:YES];
    }];
}

@end
