//
//  ContactViewControler.h
//  Powers Code
//
//  Created by Patrick Powers on 4/3/15.
//  Copyright (c) 2015 Patrick Powers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ALRadialMenu.h"

@interface ContactViewControler : UIViewController <ALRadialMenuDelegate>

@property (strong, nonatomic) ALRadialMenu *radialMenu;

@end
