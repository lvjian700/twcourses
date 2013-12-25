//
//  TWSection.m
//  twcourses
//
//  Created by lvjian on 12/21/13.
//  Copyright (c) 2013 xi'an thoughtworks. All rights reserved.
//

#import "TWCourses.h"
#import "TWChapter.h"

#define TWCoursesLoadPath @"courses"
#define TWCoursesLoadPathByName @"courses/%@"

@implementation TWCourses

+ (void) loadAll: (void (^) (NSArray *courses) ) success  {
    
    [TWClient getObject:[TWCourses class] path:TWCoursesLoadPath parameters:nil success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        DLog(@"load twcourses from: %@", TWCoursesLoadPath);
        NSArray *result = mappingResult.array;
        DLog(@"courses count: %d", (int)[result count]);
        success(result);
        
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        DLog(@"fail to load courses list.");
    }];
}

+ (void) findOneByName:(NSString *)name sucess:(void (^)(TWCourses *))success {
    
    NSString *path = [NSString stringWithFormat:TWCoursesLoadPathByName, name];
    
    [TWClient getObject:[TWCourses class] path:path parameters:nil success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        DLog(@"load courses details by name");
        TWCourses *courses = mappingResult.firstObject;
        success(courses);
        
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        DLog(@"fail to load couses");
        DLog(@"%@", [error localizedDescription]);
        
    }];
    
}


+ (RKObjectMapping *) objectMapping {
    
    NSDictionary *mapping = @{
                              @"_id": @"_id",
                              @"name": @"name",
                              @"author": @"author",
                              @"overview": @"overview",
                              @"coverImagePath": @"coverImagePath",
                              @"created_at": @"created_at"
                              };
    
    RKObjectMapping *objectMapping = [RKObjectMapping mappingForClass:[TWCourses class]];
	[objectMapping addAttributeMappingsFromDictionary: mapping];
    
    return objectMapping;
}

+ (void) addToObjectManager:(RKObjectManager *)manager {
    
    RKObjectMapping *objectMapping = [TWCourses objectMapping];
    RKObjectMapping *chapterMapping = [TWChapter objectMapping];
    [objectMapping addRelationshipMappingWithSourceKeyPath:@"chapters" mapping:chapterMapping];
    
    RKResponseDescriptor *listResp = [RKResponseDescriptor responseDescriptorWithMapping:objectMapping
                                                                                  method:RKRequestMethodGET
                                                                             pathPattern:@"courses"
                                                                                 keyPath:nil
                                                                             statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
   
    [manager addResponseDescriptor:listResp];
    [manager.router.routeSet addRoute:[RKRoute routeWithClass:[TWCourses class]
                                                  pathPattern:@"courses/:name"
                                                       method:RKRequestMethodGET]];
}

+ (TWCourses *) coursesFromRemote {
    TWCourses *courses = [[TWCourses alloc] init];
    
    courses.name = @"Developing iOS 7 App for iPhone and iPad";
    courses.overview = @"Updated for iOS 7. Tools and APIs required to build applications for the iPhone and iPad platform using the iOS SDK. User interface designs for mobile devices and unique user interactions using multi-touch technologies. Object-oriented design using model-view-controller paradigm, memory management, Objective-C programming language. Other topics include: object-oriented database API, animation, multi-threading and performance considerations.";
    courses.coverImagePath = @"stanford.png";
    
    NSMutableArray *sections = [NSMutableArray array];
    
    TWChapter *section = [[TWChapter alloc] init];
    section.name = @"Class Logistics, Overview of iOS, MVC, Objective-C";
    section.chapterNumber = 1;
    [sections addObject:section];
    
    
    section = [[TWChapter alloc] init];
    section.name = @"Xcode5";
    section.chapterNumber = 2;
    [sections addObject:section];
    
    section = [[TWChapter alloc] init];
    section.name = @"Objective C";
    section.chapterNumber = 3;
    [sections addObject:section];
    
    section = [[TWChapter alloc] init];
    section.name = @"Foundation and Attributed Strings";
    section.chapterNumber = 4;
    [sections addObject:section];
    
    section = [[TWChapter alloc] init];
    section.name = @"View Controller Lifecycle";
    section.chapterNumber = 5;
    [sections addObject:section];
    
    section = [[TWChapter alloc] init];
    section.name = @"Polymoriphism with Controllers, UINavigation, UITabBar";
    section.chapterNumber = 6;
    [sections addObject:section];
    section = [[TWChapter alloc] init];
    
    section.name = @"Views adn Gestures";
    section.chapterNumber = 7;
    [sections addObject:section];
    section = [[TWChapter alloc] init];
    
    section.name = @"Protocols, Blocks, and Animation";
    section.chapterNumber = 8;
    [sections addObject:section];
    section = [[TWChapter alloc] init];
    
    section.name = @"Animation adn Autolayout";
    section.chapterNumber = 9;
    [sections addObject:section];
    
    
    section = [[TWChapter alloc] init];
    section.name = @"Multithreading, Scroll View";
    section.chapterNumber = 10;
    [sections addObject:section];
    section = [[TWChapter alloc] init];
    
    section.name = @"Table View and iPad";
    section.chapterNumber = 11;
    [sections addObject:section];
    section = [[TWChapter alloc] init];
    
    section.name = @"Documents and Core Data";
    section.chapterNumber = 12;
    [sections addObject:section];
    
    section = [[TWChapter alloc] init];
    section.name = @"Core Data and Table View";
    section.chapterNumber = 13;
    [sections addObject:section];
    
    section = [[TWChapter alloc] init];
    section.name = @"UIApplication, Network Activity Indicator, and Maps";
    section.chapterNumber = 14;
    [sections addObject:section];
    
    section = [[TWChapter alloc] init];
    section.name = @"Modal Segues, Text Fields, Alerts, and Action Sheets";
    section.chapterNumber = 15;
    [sections addObject:section];
    
    courses.chapters = sections;
    
    return courses;
}

@end
