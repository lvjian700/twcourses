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

+ (void) findOneByName:(NSString *)name success:(void (^)(TWCourses *))success {
   
	NSString *escapedName = [name stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *path = [NSString stringWithFormat:TWCoursesLoadPathByName, escapedName];
    
    [TWClient getObject:nil path:path parameters:nil success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
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
    
    RKResponseDescriptor *detailsResp = [RKResponseDescriptor responseDescriptorWithMapping:objectMapping
                                                                                  method:RKRequestMethodGET
                                                                             pathPattern:@"courses/:name"
                                                                                 keyPath:nil
                                                                             statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    
   
    [manager addResponseDescriptor:listResp];
    [manager addResponseDescriptor:detailsResp];
    [manager.router.routeSet addRoute:[RKRoute routeWithClass:[TWCourses class]
                                                  pathPattern:@"courses/:name"
                                                       method:RKRequestMethodGET]];
}

@end
