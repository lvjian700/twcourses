//
//  TWSectionItem.m
//  twcourses
//
//  Created by lvjian on 12/21/13.
//  Copyright (c) 2013 xi'an thoughtworks. All rights reserved.
//

#import "TWChapter.h"

@implementation TWChapter


+ (RKObjectMapping *) objectMapping {
    NSDictionary *mapping = @{
       @"_id": @"_id",
       @"name": @"name",
       @"chapterNumber": @"chapterNumber",
       @"videoPath": @"videoPath",
       @"assignmentPath": @"assignmentPath",
       @"codePath": @"codePath",
	   @"videoLength": @"videoLength",
       @"created_at": @"created_at"
    };
    
    
    RKObjectMapping *objectMapping = [RKObjectMapping mappingForClass:[TWChapter class]];
    [objectMapping addAttributeMappingsFromDictionary:mapping];
    
    return objectMapping;
}

+ (void) addToObjectManager:(RKObjectManager *)manager {
    RKObjectMapping *objectMapping = [TWChapter objectMapping];
    RKResponseDescriptor *resp = [RKResponseDescriptor responseDescriptorWithMapping:objectMapping
                                                                               method:RKRequestMethodGET
                                                                          pathPattern:@"courses/:name/chapters"
                                                                              keyPath:nil
                                                                          statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
                                  
    [manager addResponseDescriptor:resp];
}

@end
