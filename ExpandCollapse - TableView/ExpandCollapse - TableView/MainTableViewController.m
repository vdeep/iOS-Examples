//
//  MainTableViewController.m
//  ExpandCollapse - TableView
//
//  Created by Vishal Deep on 12/05/14.
//  Copyright (c) 2014 Logiciel Solutions. All rights reserved.
//

#import "MainTableViewController.h"

@interface MainTableViewController () {
    NSMutableArray *records;
    NSMutableIndexSet *expandedSections;
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
    
    expandedSections = [[NSMutableIndexSet alloc] init];
    
    records = [[NSMutableArray alloc] initWithObjects:
               [[NSArray alloc] initWithObjects:@"First row", @"Sub row 1-1", @"Sub row 1-2", @"Sub row 1-3", nil],
               [[NSArray alloc] initWithObjects:@"Second row", @"Sub row 2-1", @"Sub row 2-2", @"Sub row 2-3", @"Sub row 2-4", nil],
               [[NSArray alloc] initWithObjects:@"Third row", @"Sub row 3-1", @"Sub row 3-2", nil],
               nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [records count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([expandedSections containsIndex:section]) {
        return [[records objectAtIndex:section] count];
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.indentationWidth = 10.0;
    
    NSString *cellText;
    cellText = [[records objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    
    if (indexPath.row > 0) {
        cell.indentationLevel = 1;
    }
//    if ([expandedSections containsIndex:indexPath.section]) {
//        cellText =
//    }
//    if (indexPath.row % 2 == 0) {
//        cellText = [records objectAtIndexedSubscript:indexPath.row];
//    } else {
//        cellText = [[records objectAtIndex:indexPath.row] objectAtIndex:0];
//    }
    
    // UILabel *textLabel = (UILabel*)[cell viewWithTag:1];
    
    cell.textLabel.text = cellText;
    // cell.contentView.backgroundColor = [UIColor redColor];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (!indexPath.row) {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        
        NSInteger section = indexPath.section;
        BOOL isExpanded = [expandedSections containsIndex:section];
        NSInteger rows;
        
        NSMutableArray *tmpArray = [NSMutableArray array];
        
        if (isExpanded) {
            rows = [self tableView:tableView numberOfRowsInSection:section];
            [expandedSections removeIndex:section];
        } else {
            [expandedSections addIndex:section];
            rows = [self tableView:tableView numberOfRowsInSection:section];
        }
        
        for (int i = 1; i < rows; i++) {
            NSIndexPath *tmpIndexPath = [NSIndexPath indexPathForRow:i inSection:section];
            [tmpArray addObject:tmpIndexPath];
        }
        
//        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        
        if (isExpanded) {
            [tableView deleteRowsAtIndexPaths:tmpArray withRowAnimation:UITableViewRowAnimationTop];
        } else {
            [tableView insertRowsAtIndexPaths:tmpArray withRowAnimation:UITableViewRowAnimationTop];
        }
    }
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
