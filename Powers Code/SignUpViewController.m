//
//  SignUpViewController.m
//  CCLogin
//
//  Created by Powers, Patrick (US - Orlando) on 2/19/15.
//  Copyright (c) 2015 Powers, Patrick. All rights reserved.
//

#import "SignUpViewController.h"
#import "EmailValidation.h"
#import "SCLAlertView.h"

@interface SignUpViewController ()
{
    BOOL emailScreen;
}

@property (strong, nonatomic) IBOutlet UIButton *facebookButton;
@property (strong, nonatomic) IBOutlet UIButton *emailButton;
@property (strong, nonatomic) IBOutlet UIImageView *logo;
@property (strong, nonatomic) IBOutlet UILabel *appName;
@property (strong, nonatomic) IBOutlet UILabel *gettingStartedLabel;
@property (strong, nonatomic) UITextField *emailTextField;
@property (strong, nonatomic) UITextField *passwordTextField;
@property (strong, nonatomic) IBOutlet UIView *logoView;
@property (strong, nonatomic) UIButton *continueButton;


@property (strong, nonatomic) IBOutlet NSLayoutConstraint *topLayout;

- (IBAction)facebookSignUpClick:(id)sender;
- (IBAction)emailSignUpClick:(id)sender;
@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.navigationController setNavigationBarHidden:YES];
    
    _facebookButton.layer.cornerRadius = 25;
    _facebookButton.layer.borderWidth = 2.0;
    _facebookButton.layer.borderColor = [UIColor darkGrayColor].CGColor;
    _facebookButton.clipsToBounds = YES;
    
    _emailButton.layer.cornerRadius = 25;
    _emailButton.layer.borderWidth = 2.0;
    _emailButton.layer.borderColor = [UIColor darkGrayColor].CGColor;
    _emailButton.clipsToBounds = YES;

    _emailTextField = [[UITextField alloc] initWithFrame:CGRectMake(kScreenWidth/2-125, kScreenHeight+10, 250, 50)];
    _emailTextField.delegate = self;
    _emailTextField.placeholder = @"Email Address";
    _emailTextField.textAlignment = NSTextAlignmentCenter;
    _emailTextField.layer.cornerRadius = 25;
    _emailTextField.layer.borderWidth = 2.0;
    _emailTextField.layer.borderColor = [UIColor darkGrayColor].CGColor;
    _emailTextField.clipsToBounds = YES;
    [self.view addSubview:_emailTextField];
    
    _passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(kScreenWidth/2-125, kScreenHeight+70, 250, 50)];
    _passwordTextField.delegate = self;
    _passwordTextField.placeholder = @"Password";
    _passwordTextField.secureTextEntry = YES;
    _passwordTextField.textAlignment = NSTextAlignmentCenter;
    _passwordTextField.layer.cornerRadius = 25;
    _passwordTextField.layer.borderWidth = 2.0;
    _passwordTextField.layer.borderColor = [UIColor darkGrayColor].CGColor;
    _passwordTextField.clipsToBounds = YES;
    [self.view addSubview:_passwordTextField];
    
    _continueButton = [[UIButton alloc] initWithFrame:CGRectMake(kScreenWidth/2-125, kScreenHeight+70, 250, 50)];
    [_continueButton setTitle: @"Continue" forState: UIControlStateNormal];
    [_continueButton setBackgroundImage:[self imageWithColor:[UIColor grayColor]] forState:UIControlStateHighlighted];
    _continueButton.titleLabel.textColor = [UIColor whiteColor];
    _continueButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    _continueButton.layer.cornerRadius = 25;
    _continueButton.layer.borderWidth = 2.0;
    _continueButton.layer.borderColor = [UIColor darkGrayColor].CGColor;
    _continueButton.clipsToBounds = YES;
    _continueButton.backgroundColor = [UIColor darkGrayColor];
    [_continueButton addTarget:self action:@selector(continueButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_continueButton];
}

-(void)viewWillAppear:(BOOL)animated{
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard:)]];
}

- (IBAction)facebookSignUpClick:(id)sender {

    SCLAlertView *alert = [[SCLAlertView alloc] init];
    [alert setShowAnimationType:SlideInToCenter];
    [alert setHideAnimationType:SlideOutFromCenter];
    alert.backgroundType = Blur;
    [alert alertIsDismissed:^{
        NSUserDefaults *login = [NSUserDefaults standardUserDefaults];
        [login setBool:YES forKey:@"loggedIn"];
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    [alert showWaiting:self title:@"Facebook" subTitle:@"Pretending to login..." closeButtonTitle:nil duration:2.0f];
}

- (IBAction)emailSignUpClick:(id)sender {
    
    emailScreen = YES;
    _topLayout.constant = -80;
    
    [self.view setNeedsUpdateConstraints];
    
    [UIView animateWithDuration:0.4 delay: 0.0 options: UIViewAnimationOptionCurveEaseInOut animations:^{
                         
        _logoView.frame = CGRectMake(self.view.frame.size.width/2 - _logoView.frame.size.width/2, -30.0f, _logoView.frame.size.width, _logoView.frame.size.height);
                         
        _logo.alpha = 0.0;
        _emailButton.alpha = 0.0;
        _gettingStartedLabel.alpha = 0.0;
        _facebookButton.alpha = 0.0;
        
        _emailTextField.frame = CGRectMake(kScreenWidth/2 - 125, _logoView.frame.size.height - 50, _emailTextField.frame.size.width, _emailTextField.frame.size.height);
        _passwordTextField.frame = CGRectMake(kScreenWidth/2 - 125, _logoView.frame.size.height + 5, _passwordTextField.frame.size.width, _passwordTextField.frame.size.height);
        _continueButton.frame = CGRectMake(kScreenWidth/2 - 125, _logoView.frame.size.height + 5, _continueButton.frame.size.width, _continueButton.frame.size.height);
                         
        [_logoView layoutIfNeeded];
                         
    }completion:^(BOOL finished){
        [_emailTextField becomeFirstResponder];
    }];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField becomeFirstResponder];
    
    return YES;
}

- (IBAction)hideKeyboard:(id)sender {
    
    if (emailScreen){
        emailScreen = NO;
        _topLayout.constant = 65;
    
        [self.view setNeedsUpdateConstraints];
    
        [UIView animateWithDuration:0.3 delay: 0.0 options: UIViewAnimationOptionCurveEaseInOut animations:^{
                         
            _logoView.frame = CGRectMake(self.view.frame.size.width/2 - _logoView.frame.size.width/2, 30.0f, _logoView.frame.size.width, _logoView.frame.size.height);
            _appName.text = @"Powers' Code";
            
            _logo.alpha = 1.0;
            _emailButton.alpha = 1.0;
            _gettingStartedLabel.alpha = 1.0;
            _facebookButton.alpha = 1.0;
                         
            _emailTextField.frame = CGRectMake(kScreenWidth/2-125, kScreenHeight+10, 250, 50);
            _passwordTextField.frame = CGRectMake(kScreenWidth/2-125, kScreenHeight+70, 250, 50);
            _continueButton.frame = CGRectMake(kScreenWidth/2-125, kScreenHeight+70, 250, 50);
                         
            [_logoView layoutIfNeeded];
        }completion:^(BOOL finished){
            [self.view endEditing:YES];
        }];
    }
}

- (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (void) continueButtonTapped
{
    
    if ([EmailValidation NSStringIsValidEmail:_emailTextField.text] && [_passwordTextField.text isEqualToString:@""]) {
 
        [UIView animateWithDuration:0.4 delay: 0.0 options: UIViewAnimationOptionCurveEaseInOut animations:^{
                                         
            _continueButton.frame = CGRectMake(kScreenWidth/2 - 125, _logoView.frame.size.height + 60, _continueButton.frame.size.width, _continueButton.frame.size.height);
                                         
        }completion:^(BOOL finished){
            [_passwordTextField becomeFirstResponder];
        }];
        
        _passwordTextField.placeholder = @"Enter Password";
        _appName.text = @"Almost There";
    }
    
    else if ([EmailValidation NSStringIsValidEmail:_emailTextField.text] && ![_passwordTextField.text isEqualToString:@""]){
        
        SCLAlertView *alert = [[SCLAlertView alloc] init];
        [alert setShowAnimationType:SlideInToCenter];
        [alert setHideAnimationType:SlideOutFromCenter];
        alert.backgroundType = Blur;
        [alert alertIsDismissed:^{
            NSUserDefaults *login = [NSUserDefaults standardUserDefaults];
            [login setBool:YES forKey:@"loggedIn"];
            [self dismissViewControllerAnimated:YES completion:nil];
        }];
        [alert showWaiting:self title:@"Logging In" subTitle:nil closeButtonTitle:nil duration:1.0f];
    }
    
    else if (![EmailValidation NSStringIsValidEmail:_emailTextField.text]){
        
        [_emailTextField resignFirstResponder];
        
        SCLAlertView *alert = [[SCLAlertView alloc] init];
        alert.backgroundType = Blur;
        [alert addButton:@"Try Again" actionBlock:^(void) {
            [self emailSignUpClick:_emailButton];
        }];
        [alert showError:self title:@"Not Valid Email" subTitle:@"We only accepts valid emails" closeButtonTitle:nil duration:0.0f];
    }
}

@end
