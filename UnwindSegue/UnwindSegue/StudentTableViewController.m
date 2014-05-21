//
//  StudentTableViewController.m
//  UnwindSegue
//
//  Created by Vishal Deep on 19/05/14.
//  Copyright (c) 2014 Logiciel Solutions. All rights reserved.
//

#import "StudentTableViewController.h"
#import "StudentDetailViewController.h"
#import "StudentModel.h"

@interface StudentTableViewController () {
    NSMutableArray *students;
}
@end

@implementation StudentTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // configure the view
    self.title = @"Students";
    
    // configure navbar items
    [self.navigationItem setBackBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil]];
    
    students = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [students count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    StudentModel *student = [students objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", student._firstName, student._lastName];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)studentAddCancelled:(UIStoryboardSegue *)segue {
    NSLog(@"Cancelled");
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)studentAddCompleted:(UIStoryboardSegue *)segue {
    NSLog(@"Saved");
    
    StudentModel *student = [[StudentModel alloc] init];
    
    StudentDetailViewController *viewController = (StudentDetailViewController*)segue.sourceViewController;
    student._id = [NSNumber numberWithInt:[viewController.txtFld_ID.text intValue]];
    student._firstName = viewController.txtFld_FirstName.text;
    student._lastName = viewController.txtFld_LastName.text;
    student._phoneNumber = viewController.txtFld_PhoneNumber.text;
    
    [students addObject:student];
    
    [self.tableView reloadData];
}

@end
