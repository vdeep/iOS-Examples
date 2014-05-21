//
//  StudentDetailViewController.m
//  UnwindSegue
//
//  Created by Vishal Deep on 19/05/14.
//  Copyright (c) 2014 Logiciel Solutions. All rights reserved.
//

#import "StudentDetailViewController.h"

@interface StudentDetailViewController ()

@end

@implementation StudentDetailViewController

@synthesize txtFld_ID, txtFld_FirstName, txtFld_LastName, txtFld_PhoneNumber;

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
    
    self.title = @"Add Student";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
