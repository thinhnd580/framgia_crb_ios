//
//  LoginViewController.m
//  crbios
//
//  Created by  on 7/7/16.
//  Copyright © 2016 framgia. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *txtEmail;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;
- (IBAction)btnLogin:(id)sender;
- (IBAction)btnLoginFacebook:(id)sender;
- (IBAction)btnLoginGoogle:(id)sender;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Click Button

- (IBAction)btnLogin:(id)sender {
    [self.view endEditing:YES];
    // TODO: Login
}

- (IBAction)btnLoginFacebook:(id)sender {
    [self.view endEditing:YES];
    // TODO: Login with Facebook
}

- (IBAction)btnLoginGoogle:(id)sender {
    [self.view endEditing:YES];
    // TODO: Login with Google
}

@end
