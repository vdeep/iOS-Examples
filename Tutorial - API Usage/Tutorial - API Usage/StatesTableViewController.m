//
//  StatesTableViewController.m
//  Tutorial - API Usage
//
//  Created by Vishal Deep on 13/05/14.
//  Copyright (c) 2014 Logiciel Solutions. All rights reserved.
//

#import "StatesTableViewController.h"
#import "DetailViewController.h"
#import "Student.h"

@interface StatesTableViewController () {
    UIAlertView *alertView;
    NSMutableArray *records;
    NSIndexPath *selectedRowIndexPath;
}

@end

@implementation StatesTableViewController

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
    
    self.title = @"Students";
    
    [self fetchRecords];
}

- (void)fetchRecords {
    records = [[NSMutableArray alloc] init];
    
    alertView = [[UIAlertView alloc] initWithTitle:nil message:@"Loading..." delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
    
    [alertView show];
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://192.168.3.101/cakephp-api/students/index.json"];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    [connection start];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [records count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    Student *student = (Student*)[records objectAtIndex:indexPath.row];
    cell.textLabel.text = student.studentName;
    
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    selectedRowIndexPath = indexPath;
    [self performSegueWithIdentifier:@"DetailSegue" sender:nil];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"DetailSegue"]) {
        DetailViewController *viewController = (DetailViewController*)segue.destinationViewController;
        [viewController setStudent:[records objectAtIndex:selectedRowIndexPath.row]];
    } else if ([segue.identifier isEqualToString:@"AddSegue"]) {
        AddEditViewController *viewController = (AddEditViewController*)segue.destinationViewController;
        [viewController setDelegate:self];
    }
}

#pragma mark - NSURLConnectionDelegate

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    NSError *error = [[NSError alloc] init];
    NSDictionary *json = [NSJSONSerialization
                          JSONObjectWithData:data
                          options:kNilOptions
                          error:&error];
    
    NSArray *students = [json objectForKey:@"students"];
    
    for (int i = 0; i < [students count]; i++) {
        NSDictionary *studentDictionary = [students objectAtIndex:i];
        
        Student *student = [Student fromDictionary:studentDictionary];
        
        [records addObject:student];
    }
    
    [alertView dismissWithClickedButtonIndex:0 animated:YES];
    
    [self.tableView reloadData];
}

#pragma mark - AddEditDelegate

- (void)studentSaved {
    [[self navigationController] popViewControllerAnimated:YES];
    
    [self fetchRecords];
}

@end
