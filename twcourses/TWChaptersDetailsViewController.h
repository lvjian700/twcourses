//
// Created by jianing on 1/1/14.
// Copyright (c) 2014 xi'an thoughtworks. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "TWChapter.h"

@interface TWChaptersDetailsViewController : UITableViewController

@property (strong, nonatomic) TWChapter *chapter;
@property (strong, nonatomic) IBOutlet UITableView *chapterDetailsTableView;

@end