//
//  StudentTableViewController.h
//  UnwindSegue
//
//  Created by Vishal Deep on 19/05/14.
//  Copyright (c) 2014 Logiciel Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StudentTableViewController : UITableViewController

- (IBAction)studentAddCancelled:(UIStoryboardSegue*)segue;
- (IBAction)studentAddCompleted:(UIStoryboardSegue*)segue;

@end
