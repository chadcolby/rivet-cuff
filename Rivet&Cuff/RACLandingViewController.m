//
//  RACLandingViewController.m
//  Rivet&Cuff
//
//  Created by Chad D Colby on 7/17/14.
//  Copyright (c) 2014 Byte Meets World. All rights reserved.
//

#import "RACLandingViewController.h"
#import <POP/POP.h>
#import "RACRoundedButton.h"

@interface RACLandingViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *logoView;
@property (weak, nonatomic) IBOutlet UIButton *signUpButton;
@property (weak, nonatomic) IBOutlet UIButton *logInButton;
@property (strong, nonatomic) RACRoundedButton *cancelButton;

@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@property (nonatomic) BOOL shouldAnimate;

@end

@implementation RACLandingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.shouldAnimate = YES;
    self.emailTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.passwordTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.emailTextField.delegate = self;
    self.emailTextField.tag = 1;
    self.passwordTextField.delegate = self;
    self.passwordTextField.tag = 2;
    
    self.signUpButton.backgroundColor = [UIColor colorWithRed:0 green:103./255 blue:96./255 alpha:1.0f];
    self.logInButton.backgroundColor = [UIColor colorWithRed:0 green:103./255 blue:96./255 alpha:1.0f];
    self.logInButton.enabled = NO;
    self.logInButton.highlighted = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([segue.identifier isEqualToString:@"logInSuccessful"]) {
        
    }
}


#pragma mark - IBActions

- (IBAction)signUpPressed:(UIButton *)sender
{
    NSLog(@"sign up");

}

- (IBAction)logInPressed:(UIButton *)sender
{
        POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
        scaleAnimation.velocity = [NSValue valueWithCGSize:CGSizeMake(3.f, 3.f)];
        scaleAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(1.f, 1.f)];
        scaleAnimation.springBounciness = 18.0f;
        [self.logInButton.layer pop_addAnimation:scaleAnimation forKey:@"layerScaleSpringAnimation"];
        [self performSegueWithIdentifier:@"logInSuccessful" sender:self];
    
}

#pragma mark - UITextField delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField.tag == 1) {
        [self.passwordTextField becomeFirstResponder];
    } else if (textField.tag == 2) {
        
        [self.passwordTextField resignFirstResponder];
        
        [self largeLogoViewAnimation];
        
        self.logInButton.enabled = YES;
        
    }
    self.cancelButton.isVisible = NO;
    return true;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (!self.cancelButton) {
        self.cancelButton = [[RACRoundedButton alloc] initWithFrame:CGRectMake(self.view.bounds.size.width /2 - 20, 290, 40, 40)];
        [self.cancelButton addTarget:self action:@selector(closeButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self.cancelButton addTarget:self action:@selector(animateCloseButton:) forControlEvents:UIControlEventTouchDown];
        [self.view addSubview:self.cancelButton];
    }
    [self textFieldsBecameActiveAnimation];
}

- (void)closeButtonPressed:(RACRoundedButton *)sender
{
    [self.emailTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];

    self.cancelButton.isVisible = NO;
    [self largeLogoViewAnimation];
}

#pragma mark - Animation Functions

- (void)largeLogoViewAnimation
{
    POPSpringAnimation *bigLogoAnimation = [POPSpringAnimation animation];
    bigLogoAnimation.property = [POPAnimatableProperty propertyWithName:kPOPViewFrame];
    bigLogoAnimation.toValue = [NSValue valueWithCGRect:CGRectMake(1.5, 20, 317, 325)];
    bigLogoAnimation.name = @"bigLogoView";
    bigLogoAnimation.delegate = self;
    [self.logoView pop_addAnimation:bigLogoAnimation forKey:@"bigLogoView"];
    
    POPSpringAnimation *moveEmail = [POPSpringAnimation animation];
    moveEmail.property = [POPAnimatableProperty propertyWithName:kPOPViewFrame];
    moveEmail.toValue = [NSValue valueWithCGRect:CGRectMake(20, 355, 280, 30)];
    moveEmail.name = @"moveEmail";
    moveEmail.delegate = self;
    [self.emailTextField pop_addAnimation:moveEmail forKey:@"moveEmail"];
    
    POPSpringAnimation *movePassword = [POPSpringAnimation animation];
    movePassword.property = [POPAnimatableProperty propertyWithName:kPOPViewFrame];
    movePassword.toValue = [NSValue valueWithCGRect:CGRectMake(20, 395, 280, 30)];
    movePassword.name = @"movePass";
    movePassword.delegate = self;
    [self.passwordTextField pop_addAnimation:movePassword forKey:@"movePass"];
    
    POPSpringAnimation *moveLogInButton = [POPSpringAnimation animation];
    moveLogInButton.property = [POPAnimatableProperty propertyWithName:kPOPViewFrame];
    moveLogInButton.toValue = [NSValue valueWithCGRect:CGRectMake(40, 435, 100, 50)];
    moveLogInButton.name = @"moveLogIn";
    moveLogInButton.delegate = self;
    [self.logInButton pop_addAnimation:moveLogInButton forKey:@"moveLogIn"];
    
    POPSpringAnimation *moveSignUp = [POPSpringAnimation animation];
    moveSignUp.property = [POPAnimatableProperty propertyWithName:kPOPViewFrame];
    moveSignUp.toValue = [NSValue valueWithCGRect:CGRectMake(180, 435, 100, 50)];
    moveSignUp.name = @"moveSignUp";
    moveSignUp.delegate = self;
    [self.signUpButton pop_addAnimation:moveSignUp forKey:@"moveSignUp"];
    
    POPBasicAnimation *hideCloseButton = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
    hideCloseButton.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    hideCloseButton.fromValue = @(1.0);
    hideCloseButton.toValue = @(0.0);
    hideCloseButton.name = @"fade";
    [self.cancelButton pop_addAnimation:hideCloseButton forKey:@"fade"];
}

- (void)textFieldsBecameActiveAnimation
{
    if (!self.cancelButton.isVisible) {
        
        POPSpringAnimation *basicAniamtion = [POPSpringAnimation animation];
        basicAniamtion.property = [POPAnimatableProperty propertyWithName:kPOPViewFrame];
        basicAniamtion.toValue = [NSValue valueWithCGRect:CGRectMake(10, 20, 167, 175)];
        basicAniamtion.name = @"resizeLogoView";
        basicAniamtion.delegate = self;
        [self.logoView pop_addAnimation:basicAniamtion forKey:@"resizeLogoView"];
        
        POPSpringAnimation *showEmailAnimation = [POPSpringAnimation animation];
        showEmailAnimation.property = [POPAnimatableProperty propertyWithName:kPOPViewFrame];
        showEmailAnimation.toValue = [NSValue valueWithCGRect:CGRectMake(20, 205, 280, 30)];
        showEmailAnimation.name = @"showEmail";
        showEmailAnimation.delegate = self;
        [self.emailTextField pop_addAnimation:showEmailAnimation forKey:@"showEmail"];
        
        POPSpringAnimation *showPassword = [POPSpringAnimation animation];
        showPassword.property = [POPAnimatableProperty propertyWithName:kPOPViewFrame];
        showPassword.toValue = [NSValue valueWithCGRect:CGRectMake(20, 245, 280, 30)];
        showPassword.name = @"showPass";
        showPassword.delegate = self;
        [self.passwordTextField pop_addAnimation:showPassword forKey:@"showPass"];
        
        POPBasicAnimation *closeAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
        closeAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        closeAnimation.fromValue = @(0.0);
        closeAnimation.toValue = @(1.0);
        closeAnimation.name = @"showClose";
        [self.cancelButton pop_addAnimation:closeAnimation forKey:@"showClose"];
        self.cancelButton.isVisible = YES;
    }
    
}

- (void)animateCloseButton:(RACRoundedButton *)sender
{
    POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleAnimation.velocity = [NSValue valueWithCGSize:CGSizeMake(3.f, 3.f)];
    scaleAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(1.f, 1.f)];
    scaleAnimation.springBounciness = 18.0f;
    [self.cancelButton.layer pop_addAnimation:scaleAnimation forKey:@"layerScaleSpringAnimation"];
    
    
}

@end
