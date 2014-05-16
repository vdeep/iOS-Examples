//
//  DetailViewController.h
//  Tutorial - Table View
//
//  Created by Vishal Deep on 12/05/14.
//  Copyright (c) 2014 Logiciel Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StudentModel.h"
#import "EditViewController.h"

@interface DetailViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, EditViewDelegate>

@property (strong, nonatomic) StudentModel *student;

@end
