//
//  EditViewController.h
//  Tutorial - Table View
//
//  Created by Vishal Deep on 12/05/14.
//  Copyright (c) 2014 Logiciel Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StudentModel.h"

@protocol EditViewDelegate <NSObject>

- (void)editViewRecordSaved;

@end

@interface EditViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *textField_ID;
@property (strong, nonatomic) IBOutlet UITextField *textField_FirstName;
@property (strong, nonatomic) IBOutlet UITextField *textField_LastName;
@property (strong, nonatomic) IBOutlet UITextField *textField_RollNumber;
@property (strong, nonatomic) IBOutlet UILabel *label_ID;
@property (strong, nonatomic) IBOutlet UILabel *label_FirstName;
@property (strong, nonatomic) IBOutlet UILabel *label_LastName;
@property (strong, nonatomic) IBOutlet UILabel *label_RollNumber;

@property (strong, nonatomic) StudentModel *student;
@property (strong, nonatomic) id<EditViewDelegate> delegate;

- (IBAction)saveDetails:(id)sender;
- (IBAction)cancelClicked:(id)sender;

@end
