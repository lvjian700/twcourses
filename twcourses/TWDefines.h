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
#define TWCoursesRootPath @"http://10.29.2.171:3000"
#define TWCoursesAPIURL [NSURL URLWithString: @"http://10.29.2.171:3000/api/"]
#define TWDateFormatTimeZone @"yyyy-MM-dd HH:mm:ss Z"


// Object
#define TWImage(x) [UIImage imageNamed:x]
#define TWClient [RKObjectManager sharedManager]

#endif
