//
//  TWSection.h
//  twcourses
//
//  Created by lvjian on 12/21/13.
//  Copyright (c) 2013 xi'an thoughtworks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TWCourses.h"
#import "TWSection.h"

@interface TWCourses : NSObject

+ (TWCourses *) coursesFromRemote;

@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *overview;

@property (copy, nonatomic) NSArray *sections;

@end
