//
//  StudentDetailViewController.h
//  UnwindSegue
//
//  Created by Vishal Deep on 19/05/14.
//  Copyright (c) 2014 Logiciel Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StudentDetailViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *txtFld_ID;
@property (strong, nonatomic) IBOutlet UITextField *txtFld_FirstName;
@property (strong, nonatomic) IBOutlet UITextField *txtFld_LastName;
@property (strong, nonatomic) IBOutlet UITextField *txtFld_PhoneNumber;

@end
