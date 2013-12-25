//
//  TWSectionViewController.h
//  twcourses
//
//  Created by lvjian on 12/21/13.
//  Copyright (c) 2013 xi'an thoughtworks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TWCourses.h"

@interface TWCoursesDetailsViewController : UITableViewController

@property (strong, nonatomic) TWCourses *courses;
@property (strong, nonatomic) IBOutlet UITableView *chaptersTableView;
@property (strong, nonatomic) IBOutlet UIImageView *coverImageView;
@property (strong, nonatomic) IBOutlet UITextView *overviewTextView;

@end
