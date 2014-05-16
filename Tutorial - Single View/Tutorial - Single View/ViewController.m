//
//  ViewController.m
//  Tutorial - Single View
//
//  Created by Vishal Deep on 10/05/14.
//  Copyright (c) 2014 Logiciel Solutions. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"ViewDidLoad");
    [self logViewSize];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    NSLog(@"ViewWillLayoutSubviews");
    [self logViewSize];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    NSLog(@"ViewDidLayoutSubviews");
    [self logViewSize];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSLog(@"ViewWillAppear");
    [self logViewSize];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    NSLog(@"ViewDidAppear");
    [self logViewSize];
}

- (void)logViewSize {
    NSLog(@"View frame: %2f, %2f, %2f, %2f", self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height);
    NSLog(@"View center: %2f, %2f", self.view.center.x, self.view.center.y);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"SecondView"]) {
        SecondViewController *viewController = (SecondViewController*)segue.destinationViewController;
        
        viewController.labelText = self.textField_Title.text;
    }
}

@end
