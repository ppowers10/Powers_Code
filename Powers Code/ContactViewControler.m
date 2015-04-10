//
//  ContactViewControler.m
//  Powers Code
//
//  Created by Patrick Powers on 4/3/15.
//  Copyright (c) 2015 Patrick Powers. All rights reserved.
//

#import "ContactViewControler.h"
#import "QuartzCore/QuartzCore.h"
#import "SlideNavigationContorllerAnimatorSlide.h"
#import "SCLAlertView.h"

@interface ContactViewControler ()

@property (nonatomic, strong) UIButton *centerButton;
@property (nonatomic, strong) IBOutlet UIImageView *pic;

@end

@implementation ContactViewControler



-(void)viewDidLoad{
    
    [super viewDidLoad];
    
    self.radialMenu = [[ALRadialMenu alloc] init];
    self.radialMenu.delegate = self;
    
    _centerButton = [[UIButton alloc] init];
    [_centerButton addTarget:self action:@selector(startAnimation) forControlEvents:UIControlEventTouchUpInside];
    _centerButton.frame = CGRectMake(kScreenWidth/2 - 20, kScreenHeight/2 +40, 40, 40);
    
    [_centerButton sendActionsForControlEvents: UIControlEventTouchUpInside];
    _centerButton.userInteractionEnabled = NO;
    
    self.navigationItem.title = @"Contact Me";
    
    _pic.layer.zPosition = 20;
    
}

- (BOOL)slideNavigationControllerShouldDisplayLeftMenu
{
    return YES;
}

-(void)startAnimation{
    [self.radialMenu buttonsWillAnimateFromButton:_centerButton withFrame:self.centerButton.frame inView:self.view];
    _pic.layer.zPosition = -15;
}

#pragma mark - radial menu delegate methods
- (NSInteger) numberOfItemsInRadialMenu:(ALRadialMenu *)radialMenu {
    return 4;
}


- (NSInteger) arcSizeForRadialMenu:(ALRadialMenu *)radialMenu {
    return 180;
}


- (NSInteger) arcRadiusForRadialMenu:(ALRadialMenu *)radialMenu {
    return 105;
}

- (void) radialMenu:(ALRadialMenu *)radialMenu didSelectItemAtIndex:(NSInteger)index {
    
    if (index == 1) {
        [self onWebsite];
    }else if (index == 2) {
        [self onEmail];
    }else if (index == 3){
        [self onSms];
    }else if (index == 4){
        [self onCall];
    }
}


- (ALRadialButton *) radialMenu:(ALRadialMenu *)radialMenu buttonForIndex:(NSInteger)index {
    
    ALRadialButton *button = [[ALRadialButton alloc] init];
    if (index == 1) {
        UIImage *mapImageToAdd = [UIImage imageNamed:@"Domain"];
        [button setImage:mapImageToAdd forState:UIControlStateNormal];
    } else if (index == 2) {
        UIImage *emailImageToAdd = [UIImage imageNamed:@"Email"];
        [button setImage:emailImageToAdd forState:UIControlStateNormal];
    } else if (index == 3) {
        UIImage *phone2ImageToAdd = [UIImage imageNamed:@"Text"];
        [button setImage:phone2ImageToAdd forState:UIControlStateNormal];
    } else if (index == 4) {
        UIImage *phone1ImageToAdd = [UIImage imageNamed:@"Phone"];
        [button setImage:phone1ImageToAdd forState:UIControlStateNormal];
    }
    
    button.layer.cornerRadius = 25.0f;
    button.layer.borderWidth = 1.2;
    button.layer.borderColor = [UIColor darkGrayColor].CGColor;
    button.clipsToBounds = YES;
    
    if (button.imageView.image) {
        return button;
    }
    return nil;
}

- (void)onCall{
    
    UIDevice *device = [UIDevice currentDevice];
    if ([[device model] isEqualToString:@"iPhone"] ) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:4079259165"]]];
    } else {
       [self customAlert];
    }
    
}

- (void)onSms {
    
    UIDevice *device = [UIDevice currentDevice];
    if ([[device model] isEqualToString:@"iPhone"] ) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"sms:4079259165"]]];
    } else {
        [self customAlert];
    }
}

- (void)onEmail {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString
        stringWithFormat:@"mailto:patrickpowers10@gmail.com?subject=Hired!"]]];
}

- (void)onWebsite {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://www.ppdesdev.com"]]];
}

-(void)customAlert{
    SCLAlertView *alert = [[SCLAlertView alloc] init];
    alert.view.layer.zPosition = 20;
    alert.backgroundType = Blur;
    [alert showError:self title:@"Failed Attempt" subTitle:@"Your device does not support this feature." closeButtonTitle:@"OK" duration:0.0f];
}


@end
