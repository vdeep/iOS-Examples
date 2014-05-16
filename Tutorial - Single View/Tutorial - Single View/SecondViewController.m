//
//  SecondViewController.m
//  Tutorial - Single View
//
//  Created by Vishal Deep on 10/05/14.
//  Copyright (c) 2014 Logiciel Solutions. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

@synthesize labelText;
@synthesize label_TextLabel;

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
    // Do any additional setup after loading the view.
    
    self.label_TextLabel.text = self.labelText;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)goBackClicked:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
