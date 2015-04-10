//
//  LeftMenuViewController.h
//  Contact Management
//
//  Created by Patrick Powers on 1/17/15.
//  Copyright (c) 2015 Patrick Powers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlideNavigationController.h"

@interface LeftMenuViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>


@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, assign) BOOL slideOutAnimationEnabled;

@end
