//
//  TWCoursesViewController.m
//  twcourses
//
//  Created by twer on 12/30/13.
//  Copyright (c) 2013 xi'an thoughtworks. All rights reserved.
//

#import "TWCoursesViewController.h"

@interface TWCoursesViewController ()
- (void) refresh: (id) control;
- (void) showFavourView: (id) sender;
@end

@implementation TWCoursesViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        NSLog(@"init with Style");
        //customise code here
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.title = @"warlock's course";
        // customise code
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	_coursesDetailsViewController = TWController(@"sections_Storyboard", @"coursesDetailsViewController");
    
    
    UIBarButtonItem *favourItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"item.favour", @"已收藏")
                                                                   style:UIBarButtonItemStyleBordered
                                                                  target:self
                                                                  action:@selector(showFavourView:)];
    self.navigationItem.rightBarButtonItem = favourItem;
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self
                            action:@selector(refresh:)
                  forControlEvents:UIControlEventValueChanged];
	
    [TWCourses loadAll:^(NSArray *courses) {
        _courses_list = courses;
        NSLog(@"load data successfully");
        [self.tableView reloadData];
    }];
    NSLog(@"view did load , courses number : %i" , [_courses_list count]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) refresh:(id)control {
    [TWCourses loadAll:^(NSArray *courses) {
        _courses_list = courses;
        [self.tableView reloadData];
        
        if ([control respondsToSelector:@selector(endRefreshing)]) {
            [control endRefreshing];
        }
    }];
}

- (void) showFavourView:(id)sender {
    //TODO: show favour view..
    DLog(@"show favour...");
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.searchDisplayController.searchResultsTableView)
    {
        tableView.rowHeight = self.tableView.rowHeight;
        return [self.searchResults count];
    }
    else
    {
        NSInteger result = [_courses_list count];
        return result;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    TWCoursesCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    TWCourses *current_course;
    if (tableView == self.searchDisplayController.searchResultsTableView)
    {
        current_course = [_searchResults objectAtIndex:indexPath.row];
    }
    else
    {
        current_course = [_courses_list objectAtIndex:indexPath.row];
    }
    
    NSString *imagePath = [NSString stringWithFormat:@"%@", current_course.coverImagePath];
    NSURL *imageURL = [NSURL URLWithString: imagePath];
    [cell.course_image setImageWithURL: imageURL placeholderImage:nil];
    cell.course_name.text = current_course.name;
    cell.course_author.text = [NSString stringWithFormat:@"作者:%@", current_course.author];
    // Configure the cell...
    
    return cell;
}


- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	TWCourses *selected;
    if (tableView == self.searchDisplayController.searchResultsTableView)
    {
        selected = [self.searchResults objectAtIndex:indexPath.row];
    }
    else
    {
        selected = [_courses_list objectAtIndex:indexPath.row];
    }

	NSString *name = selected.name;
	[TWCourses findOneByName:name success:^(TWCourses *courses) {
		_coursesDetailsViewController.courses = courses;
		[self.navigationController pushViewController:_coursesDetailsViewController animated:YES];
	}];
}


#pragma mark - Content Filtering

- (void)updateFilteredContentForCourseName:(NSString *)courseName
{
    if ((courseName == nil) || [courseName length] == 0)
    {
        self.searchResults = [self.courses_list mutableCopy];
    }
    else
    {
        self.searchResults = [[NSMutableArray alloc] init];
        for (TWCourses *course in self.courses_list)
        {
            NSUInteger searchOptions = NSCaseInsensitiveSearch;
            NSRange courseNameRange = NSMakeRange(0, course.name.length);
            NSRange foundRange = [course.name rangeOfString:courseName options:searchOptions range:courseNameRange];
            if (foundRange.length > 0)
            {
                [self.searchResults addObject:course];
            }
        }
    }
}

#pragma mark - UISearchDisplayController Delegate Methods

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self updateFilteredContentForCourseName:searchString];
    return YES;
}


@end
