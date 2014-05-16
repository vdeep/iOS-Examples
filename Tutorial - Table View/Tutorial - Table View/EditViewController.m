//
//  EditViewController.m
//  Tutorial - Table View
//
//  Created by Vishal Deep on 12/05/14.
//  Copyright (c) 2014 Logiciel Solutions. All rights reserved.
//

#import "EditViewController.h"

@interface EditViewController ()

@end

@implementation EditViewController

@synthesize student;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"-Student first name: %@", student.firstName);
    
    self.textField_ID.text = [NSString stringWithFormat:@"%d",student.sid];
    self.textField_FirstName.text = student.firstName;
    self.textField_LastName.text = student.lastName;
    self.textField_RollNumber.text = student.rollNumber;
    
    self.label_ID.text = [NSString stringWithFormat:@"%d",student.sid];
    self.label_FirstName.text = student.firstName;
    self.label_LastName.text = student.lastName;
    self.label_RollNumber.text = student.rollNumber;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)saveDetails:(id)sender {
    student.sid = [self.textField_ID.text intValue];
    student.firstName = self.textField_FirstName.text;
    student.lastName = self.textField_LastName.text;
    student.rollNumber = self.textField_RollNumber.text;
    
    [self.delegate editViewRecordSaved];
    // [self.navigationController popViewControllerAnimated:YES];
}

- (void)cancelClicked:(id)sender {
    [[self navigationController] dismissViewControllerAnimated:YES completion:nil];
}

@end
