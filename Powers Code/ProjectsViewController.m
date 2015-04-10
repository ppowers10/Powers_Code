//
//  ProjectsViewController.m
//  Powers Code
//
//  Created by Patrick Powers on 4/6/15.
//  Copyright (c) 2015 Patrick Powers. All rights reserved.
//

#import "ProjectsViewController.h"
#import "SlideNavigationContorllerAnimatorSlide.h"
#import "SignUpViewController.h"
#import "AFNetworking.h"
#import "CustomTableViewCell.h"
#import "SDWebImage/UIImageView+WebCache.h"

@interface ProjectsViewController ()

@property (nonatomic, strong) NSArray *projectsArray;
@property (nonatomic, strong) IBOutlet UITableView *tableView;

@end

@implementation ProjectsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager GET:@"https://api.myjson.com/bins/29arp" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@", responseObject);
        _projectsArray = (NSArray *)responseObject;
        [_tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {}];
    
    [self setUpNav];
    
}

-(void) setUpNav
{
    [self slideNavigationControllerShouldDisplayLeftMenu];
    CGFloat screenWidth = [[UIScreen mainScreen] bounds].size.width;
    [SlideNavigationController sharedInstance].portraitSlideOffset = screenWidth * .40;
    self.navigationItem.title = @"Projects";
}


- (BOOL)slideNavigationControllerShouldDisplayLeftMenu
{
    return YES;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _projectsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"Cell";
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell==nil) {
        cell = [[CustomTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    cell.appName.text = [[_projectsArray objectAtIndex:indexPath.row] objectForKey:@"name"];
    cell.appDescription.text = [[_projectsArray objectAtIndex:indexPath.row] objectForKey:@"description"];
    cell.appStore.text = [[_projectsArray objectAtIndex:indexPath.row] objectForKey:@"onAppStore"];
    cell.appImage.layer.cornerRadius = 20;
    cell.appImage.layer.borderWidth = .5;
    cell.appImage.clipsToBounds = YES;
    [cell.appImage sd_setImageWithURL:[NSURL URLWithString:[[_projectsArray objectAtIndex:indexPath.row] objectForKey:@"iconURL"]] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    return cell;
}



@end
