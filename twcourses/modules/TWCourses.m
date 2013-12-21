//
//  TWSection.m
//  twcourses
//
//  Created by lvjian on 12/21/13.
//  Copyright (c) 2013 xi'an thoughtworks. All rights reserved.
//

#import "TWCourses.h"

@implementation TWCourses

+ (TWCourses *) coursesFromRemote {
    TWCourses *courses = [[TWCourses alloc] init];
    
    courses.name = @"Developing iOS 7 App for iPhone and iPad";
    courses.overview = @"2013 Standford";
    
    NSMutableArray *sections = [NSMutableArray array];
    
    TWSection *section = [[TWSection alloc] init];
    section.name = @"Class Logistics, Overview of iOS, MVC, Objective-C";
    section.chapterNumber = 1;
    [sections addObject:section];
    
    
    section = [[TWSection alloc] init];
    section.name = @"Xcode5";
    section.chapterNumber = 2;
    [sections addObject:section];
    
    
    section = [[TWSection alloc] init];
    section.name = @"Foundation and Attributed Strings";
    section.chapterNumber = 3;
    [sections addObject:section];
    
    section = [[TWSection alloc] init];
    section.name = @"Objective C";
    section.chapterNumber = 4;
    [sections addObject:section];
    
    
    courses.sections = sections;
    
    return courses;
}

@end
