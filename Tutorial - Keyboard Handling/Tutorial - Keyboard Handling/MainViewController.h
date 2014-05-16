//
//  MainViewController.h
//  Tutorial - Keyboard Handling
//
//  Created by Vishal Deep on 15/05/14.
//  Copyright (c) 2014 Logiciel Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

- (IBAction)viewTapped:(id)sender;

@end
