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
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSInteger result = [_courses_list count];
    NSLog(@"courses number : %i" , result);
    return result;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    TWCoursesCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    TWCourses *current_course = [_courses_list objectAtIndex:indexPath.row];
    
    NSString *imagePath = [NSString stringWithFormat:@"%@", current_course.coverImagePath];
    DLog(@"-image path: %@", imagePath);
    NSURL *imageURL = [NSURL URLWithString: imagePath];
    [cell.course_image setImageWithURL: imageURL placeholderImage:nil];
    cell.course_name.text = current_course.name;
    cell.course_author.text = [NSString stringWithFormat:@"作者:%@", current_course.author];
    // Configure the cell...
    
    return cell;
}


- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	TWCourses *selected = [_courses_list objectAtIndex:indexPath.row];
	NSString *name = selected.name;
	DLog(@"--selectedCourses: %@", name);
	
	[TWCourses findOneByName:name success:^(TWCourses *courses) {
		_coursesDetailsViewController.courses = courses;
		[self.navigationController pushViewController:_coursesDetailsViewController animated:YES];
	}];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
