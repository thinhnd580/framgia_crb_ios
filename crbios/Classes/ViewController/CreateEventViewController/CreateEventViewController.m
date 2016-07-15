//
//  CreateEventViewController.m
//  crbios
//
//  Created by  on 7/14/16.
//  Copyright © 2016 framgia. All rights reserved.
//

#import "CreateEventViewController.h"

@interface CreateEventViewController () <UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *viewTime;
@property (weak, nonatomic) IBOutlet UIView *viewPerson;
@property (weak, nonatomic) IBOutlet UIView *viewInvite;
@property (weak, nonatomic) IBOutlet UITextField *txtCreateEvent;
@property (weak, nonatomic) IBOutlet UITextView *txtDescription;
@property (weak, nonatomic) IBOutlet UIButton *btnOk;
@property (weak, nonatomic) IBOutlet UIButton *btnDayStart;
@property (weak, nonatomic) IBOutlet UIButton *btnTimeStart;
@property (weak, nonatomic) IBOutlet UIButton *btnDayFinish;
@property (weak, nonatomic) IBOutlet UIButton *btnTimeFinish;

- (IBAction)btnOk:(id)sender;
- (IBAction)btnDayStart:(id)sender;
- (IBAction)btnTimeStart:(id)sender;
- (IBAction)btnDayFinish:(id)sender;
- (IBAction)btnTimeFinish:(id)sender;

@end

@implementation CreateEventViewController

bool _isOk = NO;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self display];
}

- (void)display {
    [self customNavigation];
    [self customTextView];
    [self customBorderView];
    [self turnOff];
}

#pragma mark - Custom Navigation

- (void)customNavigation {
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.topItem.title = @"";
    UILabel *lblTitle = [[UILabel alloc] init];
    lblTitle.text = @"New Event";
    lblTitle.textColor = [UIColor whiteColor];
    [lblTitle sizeToFit];
    self.navigationItem.titleView = lblTitle;
}

#pragma mark - Custom View

- (void)customBorderView {
    [self customBorderWithView:self.viewTime];
    [self customBorderWithView:self.viewPerson];
    [self customBorderWithView:self.viewInvite];
    [self customBorderWithView:self.txtCreateEvent];
}

- (void)customBorderWithView:(UIView *)view {
    CGFloat borderWidth = 0.1f;
    view.frame = CGRectInset(view.frame, -borderWidth, -borderWidth);
    view.layer.borderColor = [UIColor lightGrayColor].CGColor;
    view.layer.borderWidth = borderWidth;
    view.layer.cornerRadius = 10.f;
    UIColor *color = [UIColor grayColor];
    view.layer.shadowColor = [color CGColor];
    view.layer.shadowRadius = 0.1f;
    view.layer.shadowOpacity = 0.1;
}

- (void)customTextView {
    self.txtDescription.delegate = self;
    self.txtDescription.text = @"Description";
    self.txtDescription.textColor = [UIColor lightGrayColor]; //optional
    [self customBorderWithView:self.txtDescription];
}

#pragma mark - Placeholder Textview

- (void)textViewDidBeginEditing:(UITextView *)textView {
    if ([textView.text isEqualToString:@"Description"]) {
        textView.text = @"";
        textView.textColor = [UIColor blackColor]; //optional
    }
    [textView becomeFirstResponder];
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    if ([textView.text isEqualToString:@""]) {
        textView.text = @"Description";
        textView.textColor = [UIColor lightGrayColor]; //optional
    }
    [textView resignFirstResponder];
}

#pragma mark - Turn On/Off All Day

- (void)turnOff {
    _isOk = NO;
    [self.btnOk setTitle:@"OFF" forState:UIControlStateNormal];
    self.btnOk.backgroundColor = [UIColor colorWithRed:194/255.f
                                                 green:194/255.f
                                                  blue:194/255.f
                                                 alpha:1];
}

- (void)turnOn {
    _isOk = YES;
    [self.btnOk setTitle:@"ON" forState:UIControlStateNormal];
    self.btnOk.backgroundColor = [UIColor colorWithRed:45/255.f
                                                 green:209/255.f
                                                  blue:255/255.f
                                                 alpha:1];
}

#pragma mark - Click Button

- (IBAction)btnOk:(id)sender {
    if (_isOk) {
        [self turnOff];
    } else {
        [self turnOn];
    }
}

- (IBAction)btnDayStart:(id)sender {
    NSLog(@"Day Start");
}

- (IBAction)btnTimeStart:(id)sender {
    NSLog(@"Time Start");
}

- (IBAction)btnDayFinish:(id)sender {
    NSLog(@"Day Finish");
}

- (IBAction)btnTimeFinish:(id)sender {
    NSLog(@"Time Finish");
}

@end
