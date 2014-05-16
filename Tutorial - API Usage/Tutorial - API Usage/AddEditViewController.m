//
//  AddEditViewController.m
//  Tutorial - API Usage
//
//  Created by Vishal Deep on 14/05/14.
//  Copyright (c) 2014 Logiciel Solutions. All rights reserved.
//

#import "AddEditViewController.h"

@interface AddEditViewController ()

@end

@implementation AddEditViewController

@synthesize student;
@synthesize delegate;

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)cancelClicked:(id)sender {
    [[self navigationController] popToRootViewControllerAnimated:YES];
}

- (void)saveClicked:(id)sender {
    NSURL *url = [[NSURL alloc] initWithString:@"http://192.168.3.101/cakephp-api/students/add"];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setHTTPMethod:@"POST"];
    NSString *postString = [NSString stringWithFormat:@"data[Student][name]=%@&data[Student][age]=%@&data[Student][roll_number]=%@&data[Student][email]=%@&data[Student][address]=%@&data[Student][contact_number]=%@", self.textField_Name.text, self.textField_Age.text, self.textField_RollNumber.text, self.textField_Email.text, self.textField_Address.text, self.textField_ContactNumber.text];
    
    [request setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[postString length]] forHTTPHeaderField:@"Content-length"];
    [request setHTTPBody:[postString dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [connection start];
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

#pragma mark - NSURLConnectionDataDelegate

- (void)connection:(NSURLConnection *)connection didSendBodyData:(NSInteger)bytesWritten totalBytesWritten:(NSInteger)totalBytesWritten totalBytesExpectedToWrite:(NSInteger)totalBytesExpectedToWrite {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Success" message:@"Record saved" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alertView show];
}

#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    [self.delegate studentSaved];
}

@end
