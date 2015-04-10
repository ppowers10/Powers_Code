//
//  HomeAnimation.m
//  Powers Code
//
//  Created by Patrick Powers on 4/5/15.
//  Copyright (c) 2015 Patrick Powers. All rights reserved.
//

#import "HomeAnimation.h"

@implementation HomeAnimation


+(void)startAnimation:(UILabel*)welcome toAnimation:(UILabel*)to sampleAnimation:(UILabel*)sample arrowAnimation:(UILabel*)start arrow:(UIImageView*)arrow
{
    [UIView animateWithDuration:0.4 delay: 0.2 options: UIViewAnimationOptionTransitionFlipFromLeft animations:^{
                         welcome.frame = CGRectMake(0, kScreenHeight/2-100, kScreenWidth, 40);
                     }completion:^(BOOL finished){
                         welcome.font = [UIFont fontWithName:@"HoeflerText-Black" size:35];
                         [self toAnimation:to sampleAnimation:sample arrowAnimation:start arrow:arrow];
                     }];
}


+(void)toAnimation:(UILabel*)to sampleAnimation:(UILabel*)sample arrowAnimation:(UILabel*)start arrow:(UIImageView*)arrow
{
    [UIView animateWithDuration:0.4 delay: 0.2 options: UIViewAnimationOptionTransitionFlipFromRight animations:^{
                         to.frame = CGRectMake(0, kScreenHeight/2-40, kScreenWidth, 150);
                     }completion:^(BOOL finished){
                         to.font = [UIFont fontWithName:@"DamascusLight" size:100];
                         [self sampleAnimation:sample arrowAnimation:start arrow:arrow];
                     }];
}


+(void)sampleAnimation:(UILabel*)sample arrowAnimation:(UILabel*)start arrow:(UIImageView*)arrow
{
    [UIView animateWithDuration:0.4 delay: 0.2 options: UIViewAnimationOptionTransitionFlipFromTop animations:^{
                         sample.frame = CGRectMake(0, kScreenHeight/2+40, kScreenWidth, 100);
                     }completion:^(BOOL finished){
                         sample.font = [UIFont fontWithName:@"Helvetica-Oblique" size:35];
                         [self arrowAnimation:start arrow:arrow];
                     }];
}


+(void)arrowAnimation:(UILabel*)start arrow:(UIImageView*)arrow
{
    [UIView animateWithDuration:0.4 delay: 0.8 options: UIViewAnimationOptionTransitionFlipFromTop animations:^{
                         start.frame = CGRectMake(60, 60, 100, 50);
                         arrow.frame = CGRectMake(10, 80, 100, 50);
                     }completion:^(BOOL finished){//nothing
                     }];
}

@end
