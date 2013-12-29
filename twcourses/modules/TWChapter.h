//
//  TWSectionItem.h
//  twcourses
//
//  Created by lvjian on 12/21/13.
//  Copyright (c) 2013 xi'an thoughtworks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TWRKModule.h"

@interface TWChapter : NSObject<TWRestKitModule>

@property(copy, nonatomic) NSString *_id;
@property(copy, nonatomic) NSString *name;
@property(copy, nonatomic) NSString *videoPath;
@property(copy, nonatomic) NSString *assignmentPath;
@property(copy, nonatomic) NSString *codePath;
@property(copy, nonatomic) NSDate *created_at;

@property(nonatomic) NSInteger chapterNumber;
@property(copy, nonatomic) NSNumber *videoLength;

@end
