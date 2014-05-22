//
//  MainTableViewController.m
//  Tutorial - Custom Table Cells
//
//  Created by Vishal Deep on 21/05/14.
//  Copyright (c) 2014 Logiciel Solutions. All rights reserved.
//

#import "MainTableViewController.h"
#import "Student.h"
#import "MainTableViewCell.h"
#import "UIImage+Helpers.h"

@interface MainTableViewController () {
    NSMutableArray *records;
}

@end

@implementation MainTableViewController

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
    
    records = [[NSMutableArray alloc] init];
    Student *student = [[Student alloc] init];
    [student setName:@"Rajan"];
    [student setImagePath:@"http://graph.facebook.com/rajan.kumar/picture?type=large"];
    [student setDescription:@"Developer at Logiciel Solutions"];
    [records addObject:student];
    
    student = [[Student alloc] init];
    [student setName:@"Ajay"];
    [student setImagePath:@"http://graph.facebook.com/ajstyle173/picture?type=large"];
    [student setDescription:@"Developer at Logiciel Solutions"];
    [records addObject:student];
    
    student = [[Student alloc] init];
    [student setName:@"Vikash"];
    [student setImagePath:@"http://graph.facebook.com/vikashpathak91/picture?type=large"];
    [student setDescription:@"Developer at Logiciel Solutions"];
    [records addObject:student];
    
    self.tableView.tableFooterView = [[UIView alloc] init];
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
    return [records count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MainTableViewCell *cell = (MainTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    Student *student = [records objectAtIndex:indexPath.row];
    
    cell.label_Title.text = student.name;
    cell.label_description.text = student.description;
    
    [UIImage loadFromURL:[NSURL URLWithString:student.imagePath] callback:^(UIImage *image) {
        cell.imageView_pic.image = image;
    }];
    
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

@end
