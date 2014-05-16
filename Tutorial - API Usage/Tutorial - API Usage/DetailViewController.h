//
//  DetailViewController.h
//  Tutorial - API Usage
//
//  Created by Vishal Deep on 13/05/14.
//  Copyright (c) 2014 Logiciel Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Student.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *label_Id;
@property (strong, nonatomic) IBOutlet UILabel *label_Name;
@property (strong, nonatomic) IBOutlet UILabel *label_RollNumber;
@property (strong, nonatomic) IBOutlet UILabel *label_Age;
@property (strong, nonatomic) IBOutlet UILabel *label_Email;
@property (strong, nonatomic) IBOutlet UILabel *label_Address;
@property (strong, nonatomic) IBOutlet UILabel *label_ContactNumber;

@property (strong, nonatomic) Student *student;

@end
