//
//  DetailViewController.m
//  Tutorial - API Usage
//
//  Created by Vishal Deep on 13/05/14.
//  Copyright (c) 2014 Logiciel Solutions. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

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

    self.label_Id.text = [NSString stringWithFormat:@"%d", student.studentId];
    self.label_Name.text = student.studentName;
    self.label_Age.text = [NSString stringWithFormat:@"%d", student.studentAge];
    self.label_RollNumber.text = student.studentRollNumber;
    self.label_Email.text = student.studentEmail;
    self.label_Address.text = student.studentAddress;
    
    CGSize addressLabelSize = CGSizeMake(self.label_Address.frame.size.width, 9999);
    
    CGSize expectedSize = [student.studentAddress sizeWithFont:self.label_Address.font constrainedToSize:addressLabelSize lineBreakMode:NSLineBreakByWordWrapping];
    
    [self.label_Address setFrame:CGRectMake(self.label_Address.frame.origin.x, self.label_Address.frame.origin.y, expectedSize.width, expectedSize.height)];
    
    self.label_ContactNumber.text = student.studentContactNumber;
    
    CGRect contactNumberLabelFrame = CGRectMake(self.label_ContactNumber.frame.origin.x, self.label_Address.frame.origin.y + expectedSize.height + 8, self.label_ContactNumber.frame.size.width, self.label_ContactNumber.frame.size.height);
    
    [self.label_ContactNumber setFrame:contactNumberLabelFrame];
    
    
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

@end
