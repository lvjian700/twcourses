//
//  TWCoursesViewController.h
//  twcourses
//
//  Created by twer on 12/30/13.
//  Copyright (c) 2013 xi'an thoughtworks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TWCourses.h"
#import "TWCoursesCell.h"
#import "TWCoursesDetailsViewController.h"

@interface TWCoursesViewController : UITableViewController {
		
	TWCoursesDetailsViewController *_coursesDetailsViewController;
}
@property (strong, nonatomic) TWCourses *courses;
@property (strong, nonatomic) NSArray *courses_list;
@property (nonatomic, retain) NSMutableArray *searchResults;

@end
