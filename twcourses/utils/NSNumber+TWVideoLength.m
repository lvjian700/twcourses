//
//  NSNumber+TWVideoLength.m
//  twcourses
//
//  Created by 吕健 on 13-12-29.
//  Copyright (c) 2013年 xi'an thoughtworks. All rights reserved.
//

#import "NSNumber+TWVideoLength.h"

@implementation NSNumber (TWVideoLength)

- (NSString *) stringValueOfMinite {
	int min = self.intValue / 60 + 1;
	
	NSString *value = [NSString stringWithFormat:@"%d %@", min, NSLocalizedString(@"min", @"minite")];
	
	return value;
}

@end
