//
//  TWSection.h
//  twcourses
//
//  Created by lvjian on 12/21/13.
//  Copyright (c) 2013 xi'an thoughtworks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TWCourses.h"
#import "TWChapter.h"
#import "TWRKModule.h"


@interface TWCourses : NSObject <TWRestKitModule>

+ (void) loadAll: (void (^) (NSArray *courses) ) success;
+ (void) findOneByName: (NSString *) name
            success: (void (^) (TWCourses *courses) ) success;

@property (copy, nonatomic) NSString *_id;
@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *author;
@property (copy, nonatomic) NSString *overview;
@property (copy, nonatomic) NSString *coverImagePath;
@property (copy, nonatomic) NSDate *created_at;

@property (strong, nonatomic) NSArray *chapters;

@end
