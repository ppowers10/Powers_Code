//
//  CustomTableViewCell.h
//  testJSON
//
//  Created by Powers, Patrick (US - Orlando) on 4/6/15.
//  Copyright (c) 2015 Powers, Patrick. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel *appName;
@property (nonatomic, strong) IBOutlet UILabel *appStore;
@property (nonatomic, strong) IBOutlet UILabel *appDescription;
@property (nonatomic, strong) IBOutlet UIImageView *appImage;

@end
