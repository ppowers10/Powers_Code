//
//  HomeViewController.m
//  Powers Code
//
//  Created by Patrick Powers on 4/2/15.
//  Copyright (c) 2015 Patrick Powers. All rights reserved.
//

#import "HomeViewController.h"
#import "SlideNavigationContorllerAnimatorSlide.h"
#import "SignUpViewController.h"
#import "HomeAnimation.h"

@interface HomeViewController ()

@property (strong, nonatomic) IBOutlet UILabel *welcomeLabel;
@property (strong, nonatomic) IBOutlet UILabel *toLabel;
@property (strong, nonatomic) IBOutlet UILabel *sampleLabel;
@property (strong, nonatomic) IBOutlet UILabel *startLabel;
@property (strong, nonatomic) IBOutlet UIImageView *arrowImage;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


-(void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:self];
    
    NSUserDefaults *login = [NSUserDefaults standardUserDefaults];
    BOOL loggedIn = [login integerForKey:@"loggedIn"];
    
    [self setUpNav];
    
    if (!loggedIn) {
 
        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
        
        SignUpViewController *signUpViewController = (SignUpViewController*)[mainStoryboard instantiateViewControllerWithIdentifier: @"signUpViewController"];

        [self presentViewController:signUpViewController animated:YES completion:nil];

    }else{
        
        [self setUpUI];
        
        [HomeAnimation startAnimation:_welcomeLabel toAnimation:_toLabel sampleAnimation:_sampleLabel arrowAnimation:_startLabel arrow:_arrowImage];
    }
}

-(void) setUpNav
{
    [self slideNavigationControllerShouldDisplayLeftMenu];
    CGFloat screenWidth = [[UIScreen mainScreen] bounds].size.width;
    [SlideNavigationController sharedInstance].portraitSlideOffset = screenWidth * .40;
    self.navigationItem.title = @"Powers' Code";
}

- (BOOL)slideNavigationControllerShouldDisplayLeftMenu
{
    return YES;
}

-(void)setUpUI{
    _welcomeLabel = [[UILabel alloc] initWithFrame:CGRectMake(-320, kScreenHeight/2-160, kScreenWidth, 40)];
    _welcomeLabel.text = @"Welcome";
    _welcomeLabel.font = [UIFont fontWithName:@"HoeflerText-BlackItalic" size:35];
    _welcomeLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_welcomeLabel];
    
    _toLabel = [[UILabel alloc] initWithFrame:CGRectMake(320, kScreenHeight/2-60, kScreenWidth, 150)];
    _toLabel.text = @"To";
    _toLabel.font = [UIFont fontWithName:@"DamascusLight" size:100];
    _toLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_toLabel];
    
    _sampleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, kScreenHeight+60, kScreenWidth, 100)];
    _sampleLabel.text = @"{My Sample App}";
    _sampleLabel.font = [UIFont fontWithName:@"Helvetica-Oblique" size:35];
    _sampleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_sampleLabel];
    
    _startLabel = [[UILabel alloc] initWithFrame:CGRectMake(-100, 60, 100, 50)];
    _startLabel.text = @"Start Here";
    _startLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:15];
    _startLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_startLabel];
    
    _arrowImage = [[UIImageView alloc] initWithFrame:CGRectMake(-150, 80, 100, 50)];
    _arrowImage.image = [UIImage imageNamed:@"curved_arrow.png"];
    [self.view addSubview:_arrowImage];
}

@end
