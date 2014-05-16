//
//  SecondViewController.h
//  Tutorial - Single View
//
//  Created by Vishal Deep on 10/05/14.
//  Copyright (c) 2014 Logiciel Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController

@property (strong, nonatomic) NSString *labelText;
@property (strong, nonatomic) IBOutlet UILabel *label_TextLabel;

- (IBAction)goBackClicked:(id)sender;

@end
