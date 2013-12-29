//
//  TWCoursesCell.h
//  twcourses
//
//  Created by twer on 12/30/13.
//  Copyright (c) 2013 xi'an thoughtworks. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TWCoursesCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *course_image;
@property (weak, nonatomic) IBOutlet UILabel *course_name;
@property (weak, nonatomic) IBOutlet UILabel *course_author;

@end
