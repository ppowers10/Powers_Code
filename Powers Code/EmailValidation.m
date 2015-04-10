//
//  EmailValication.m
//  Powers Code
//
//  Created by Patrick Powers on 4/2/15.
//  Copyright (c) 2015 Patrick Powers. All rights reserved.
//

#import "EmailValidation.h"

@implementation EmailValidation



+(BOOL) NSStringIsValidEmail:(NSString *)checkString{
    
    BOOL stricterFilter = NO;
    NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
    NSString *laxString = @".+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
    
}
@end
