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
    courses.overview = @"Updated for iOS 7. Tools and APIs required to build applications for the iPhone and iPad platform using the iOS SDK. User interface designs for mobile devices and unique user interactions using multi-touch technologies. Object-oriented design using model-view-controller paradigm, memory management, Objective-C programming language. Other topics include: object-oriented database API, animation, multi-threading and performance considerations.";
    courses.coverImagePath = @"stanford.png";
    
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
    section.name = @"Objective C";
    section.chapterNumber = 3;
    [sections addObject:section];
    
    section = [[TWSection alloc] init];
    section.name = @"Foundation and Attributed Strings";
    section.chapterNumber = 4;
    [sections addObject:section];
    
    section = [[TWSection alloc] init];
    section.name = @"View Controller Lifecycle";
    section.chapterNumber = 5;
    [sections addObject:section];
    
    section = [[TWSection alloc] init];
    section.name = @"Polymoriphism with Controllers, UINavigation, UITabBar";
    section.chapterNumber = 6;
    [sections addObject:section];
    section = [[TWSection alloc] init];
    
    section.name = @"Views adn Gestures";
    section.chapterNumber = 7;
    [sections addObject:section];
    section = [[TWSection alloc] init];
    
    section.name = @"Protocols, Blocks, and Animation";
    section.chapterNumber = 8;
    [sections addObject:section];
    section = [[TWSection alloc] init];
    
    section.name = @"Animation adn Autolayout";
    section.chapterNumber = 9;
    [sections addObject:section];
    
    
    section = [[TWSection alloc] init];
    section.name = @"Multithreading, Scroll View";
    section.chapterNumber = 10;
    [sections addObject:section];
    section = [[TWSection alloc] init];
    
    section.name = @"Table View and iPad";
    section.chapterNumber = 11;
    [sections addObject:section];
    section = [[TWSection alloc] init];
    
    section.name = @"Documents and Core Data";
    section.chapterNumber = 12;
    [sections addObject:section];
    
    section = [[TWSection alloc] init];
    section.name = @"Core Data and Table View";
    section.chapterNumber = 13;
    [sections addObject:section];
    
    section = [[TWSection alloc] init];
    section.name = @"UIApplication, Network Activity Indicator, and Maps";
    section.chapterNumber = 14;
    [sections addObject:section];
    
    section = [[TWSection alloc] init];
    section.name = @"Modal Segues, Text Fields, Alerts, and Action Sheets";
    section.chapterNumber = 15;
    [sections addObject:section];
    
    courses.sections = sections;
    
    return courses;
}

@end
