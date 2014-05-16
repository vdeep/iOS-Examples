//
//  MainTableViewController.m
//  Tutorial - Database Interaction
//
//  Created by Vishal Deep on 16/05/14.
//  Copyright (c) 2014 Logiciel Solutions. All rights reserved.
//

#import "MainTableViewController.h"

@interface MainTableViewController () {
    FMDatabase *database;
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
    
    NSArray *dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *dbPath = [[NSString alloc] initWithString:[dirPaths[0] stringByAppendingPathComponent:@"db.sqlite"]];
    
    NSLog(@"DB Path: %@", dbPath);
    
    BOOL initDB = NO;
    
    if (![self fileExists:dbPath]) {
        initDB = YES;
    }
    
    database = [[FMDatabase alloc] initWithPath:dbPath];
    [database open];
    
    if (initDB) {
        [self setupDatabase];
    }
    
    
    // queries
    records = [[NSMutableArray alloc] init];
    NSString *queryStudents = @"SELECT * FROM Students";
    
    FMResultSet *result = [database executeQuery:queryStudents];
    
    while ([result next]) {
        NSMutableDictionary *studentDictionary = [[NSMutableDictionary alloc] init];
        
        [studentDictionary setValue:[NSString stringWithFormat:@"%d", [result intForColumn:@"id"]] forKeyPath:@"id"];
        [studentDictionary setValue:[result stringForColumn:@"name"] forKeyPath:@"name"];
        [studentDictionary setValue:[NSString stringWithFormat:@"%d", [result intForColumn:@"age"]] forKeyPath:@"age"];
        [studentDictionary setValue:[result stringForColumn:@"email"] forKeyPath:@"email"];
        
        [records addObject:studentDictionary];
    }
}

- (BOOL)fileExists:(NSString*)filePath {
    return [[NSFileManager defaultManager] fileExistsAtPath:filePath];
}

- (void)setupDatabase {
    NSString *studentTable = @"CREATE TABLE Students (id INTEGER PRIMARY KEY AUTOINCREMENT, name VARCHAR(100), roll_number VARCHAR(50), email VARCHAR(100), address VARCHAR(250), contact_number VARCHAR(20), age INTEGER)";
    
    [database executeUpdate:studentTable];
    
    NSString *insertStudentRecord = @"INSERT INTO Students (name, age, roll_number, email, address, contact_number) VALUES ('Vikash', 23, '123456', 'vikash@logicielsolutions.co.in', 'asdf', '1234');";
    
    [database executeUpdate:insertStudentRecord];
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = [[records objectAtIndex:indexPath.row] valueForKey:@"name"];
    
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
