//
//  AddEditViewController.h
//  Tutorial - API Usage
//
//  Created by Vishal Deep on 14/05/14.
//  Copyright (c) 2014 Logiciel Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Student.h"

@protocol AddEditDelegate <NSObject>

- (void)studentSaved;

@end

@interface AddEditViewController : UIViewController <NSURLConnectionDataDelegate, UIAlertViewDelegate>

@property (strong, nonatomic) IBOutlet UITextField *textField_Name;
@property (strong, nonatomic) IBOutlet UITextField *textField_Age;
@property (strong, nonatomic) IBOutlet UITextField *textField_RollNumber;
@property (strong, nonatomic) IBOutlet UITextField *textField_Email;
@property (strong, nonatomic) IBOutlet UITextField *textField_Address;
@property (strong, nonatomic) IBOutlet UITextField *textField_ContactNumber;

@property (strong, nonatomic) Student *student;
@property (nonatomic) id<AddEditDelegate> delegate;

- (IBAction)cancelClicked:(id)sender;
- (IBAction)saveClicked:(id)sender;

@end
