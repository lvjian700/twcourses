//
//  TWDefines.h
//  twcourses
//
//  Created by lvjian on 12/22/13.
//  Copyright (c) 2013 xi'an thoughtworks. All rights reserved.
//

#ifndef twcourses_TWDefines_h
#define twcourses_TWDefines_h


// Paths

// Configration
#define TWCoursesRootPath @"http://warlock-course.ap01.aws.af.cm/"
#define TWCoursesAPIURL [NSURL URLWithString: @"http://warlock-course.ap01.aws.af.cm/api/"]
#define TWDateFormatTimeZone @"yyyy-MM-dd HH:mm:ss Z"


// Object
#define TWImage(x) [UIImage imageNamed:x]
#define TWClient [RKObjectManager sharedManager]
#define TWStoryboard(name) [UIStoryboard storyboardWithName:name bundle:nil]
#define TWController(storyboard, controllerID) [[UIStoryboard storyboardWithName:storyboard bundle:nil] instantiateViewControllerWithIdentifier: controllerID]

#endif
