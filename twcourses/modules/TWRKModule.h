//
//  TWRKModule.h
//  twcourses
//
//  Created by lvjian on 12/24/13.
//  Copyright (c) 2013 xi'an thoughtworks. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TWRKModule <NSObject>

+ (void) addToObjectManager: (RKObjectManager *) manager;
+ (RKObjectMapping *) objectMapping;

@end
