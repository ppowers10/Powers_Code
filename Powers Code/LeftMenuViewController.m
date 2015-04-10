//
//  LeftMenuViewController.m
//  Contact Management
//
//  Created by Patrick Powers on 1/17/15.
//  Copyright (c) 2015 Patrick Powers. All rights reserved.
//

#import "LeftMenuViewController.h"
#import "SlideNavigationContorllerAnimatorSlide.h"

@interface LeftMenuViewController ()

@end

@implementation LeftMenuViewController

#pragma mark - UIViewController Methods -

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self.slideOutAnimationEnabled = YES;
    
    return [super initWithCoder:aDecoder];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.separatorColor = [UIColor lightGrayColor];

}

#pragma mark - UITableView Delegate & Datasrouce -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 64)];

    [headerView setBackgroundColor:[UIColor darkGrayColor]];
    
    // create the button object
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    headerLabel.textColor = [UIColor whiteColor];
    headerLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:25.0];
    headerLabel.frame = CGRectMake(20.0, 10.0, tableView.bounds.size.width, 64.0);
    
    headerLabel.text = @"Menu";

    [headerView addSubview:headerLabel];
    
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 64.0;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"Menu";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"leftMenuCell"];
    
    switch (indexPath.row)
    {
        case 0:
            cell.textLabel.text = @"Home";
            cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:18.0];
            cell.imageView.image = [UIImage imageNamed:@"home.png"];
        
       // setTitleTextAttributes: @{NSForegroundColorAttributeName: [UIColor whiteColor], NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue" size:21.0]}];
            break;
            
        case 1:
            cell.textLabel.text = @"Projects";
            cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:18.0];
            cell.imageView.image = [UIImage imageNamed:@"Apps.png"];
            break;
            
        case 2:
            cell.textLabel.text = @"Contact";
            cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:18.0];
            cell.imageView.image = [UIImage imageNamed:@"user.png"];
            break;
            
        case 3:
            cell.textLabel.text = @"Log Out";
            cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:18.0];
            cell.imageView.image = [UIImage imageNamed:@"Exit.png"];
            break;

    }
    
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main"
                                                             bundle: nil];
    
    UIViewController *vc ;
    
    switch (indexPath.row)
    {
        case 0:
            vc = [mainStoryboard instantiateViewControllerWithIdentifier: @"home"];
            break;
            
        case 1:
            vc = [mainStoryboard instantiateViewControllerWithIdentifier: @"apps"];
            break;
            
        case 2:
            
            vc = [mainStoryboard instantiateViewControllerWithIdentifier: @"contact"];
            break;
        case 3:
            vc = [mainStoryboard instantiateViewControllerWithIdentifier: @"home"];
            break;

    }
    
    if (indexPath.row == 3) {
        NSUserDefaults *login = [NSUserDefaults standardUserDefaults];
        [login setBool:NO forKey:@"loggedIn"];
    }
    
    [[SlideNavigationController sharedInstance] popToRootAndSwitchToViewController:vc
                                                             withSlideOutAnimation:self.slideOutAnimationEnabled
                                                                     andCompletion:nil];
}

@end

