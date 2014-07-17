//
//  RACLandingViewController.m
//  Rivet&Cuff
//
//  Created by Chad D Colby on 7/17/14.
//  Copyright (c) 2014 Byte Meets World. All rights reserved.
//

#import "RACLandingViewController.h"
#import <POP/POP.h>

@interface RACLandingViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *logoView;
@property (weak, nonatomic) IBOutlet UIButton *signUpButton;
@property (weak, nonatomic) IBOutlet UIButton *logInButton;

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

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

#pragma mark - IBActions

- (IBAction)signUpPressed:(UIButton *)sender
{
    NSLog(@"sign up");
    POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleAnimation.velocity = [NSValue valueWithCGSize:CGSizeMake(3.f, 3.f)];
    scaleAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(1.f, 1.f)];
    scaleAnimation.springBounciness = 18.0f;
    [self.logoView.layer pop_addAnimation:scaleAnimation forKey:@"layerScaleSpringAnimation"];
}

- (IBAction)logInPressed:(UIButton *)sender
{
    if (self.shouldAnimate) {
        
        [self.emailTextField becomeFirstResponder];
        
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
    
        POPSpringAnimation *moveLoginButton = [POPSpringAnimation animation];
        moveLoginButton.property = [POPAnimatableProperty propertyWithName:kPOPViewCenter];
        moveLoginButton.toValue = [NSValue valueWithCGPoint:CGPointMake(160, 320)];
        moveLoginButton.name = @"moveButton";
        moveLoginButton.delegate = self;
        [self.logInButton pop_addAnimation:moveLoginButton forKey:@"moveButton"];
        
        self.shouldAnimate = NO;
    }   else {

        POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
        scaleAnimation.velocity = [NSValue valueWithCGSize:CGSizeMake(3.f, 3.f)];
        scaleAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(1.f, 1.f)];
        scaleAnimation.springBounciness = 18.0f;
        [self.logInButton.layer pop_addAnimation:scaleAnimation forKey:@"layerScaleSpringAnimation"];

    }
}

#pragma mark - UITextField delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField.tag == 1) {
        [self.passwordTextField becomeFirstResponder];
    } else if (textField.tag == 2) {
        [self performSelector:@selector(logInPressed:) withObject:nil];
        [self.passwordTextField resignFirstResponder];
    }
    
    return true;
}




@end
