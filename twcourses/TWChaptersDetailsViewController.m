//
// Created by jianing on 1/1/14.
// Copyright (c) 2014 xi'an thoughtworks. All rights reserved.
//


#import "TWChaptersDetailsViewController.h"

@implementation TWChaptersDetailsViewController
{
    MPMoviePlayerController *movieController;
}

- (id) initWithStyle:(UITableViewStyle) style {
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) viewWillAppear:(BOOL) animated
{
    [self refreshView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter]
        addObserver:self
        selector:@selector(movieThumbnailLoadComplete:)
        name:MPMoviePlayerThumbnailImageRequestDidFinishNotification
        object:movieController];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void) refreshView {
    self.navigationItem.title = _chapter.name;
	[self loadVideoImage];
    [self.chapterDetailsTableView reloadData];
}

-(void) loadVideoImage {
//    NSString *path = @"http://localhost/~twsupport/test.mp4";
    NSString *path = _chapter.videoPath;
    
    movieController = [[MPMoviePlayerController alloc] initWithContentURL:[NSURL URLWithString:path]];
    NSMutableArray * allThumbnails = [NSMutableArray  arrayWithObjects:[NSNumber numberWithDouble:5.0],nil];
    [movieController requestThumbnailImagesAtTimes:allThumbnails timeOption:MPMovieTimeOptionExact];
}

-(void)movieThumbnailLoadComplete:(NSNotification*)notification
{
    NSDictionary *userInfo = [notification userInfo];
    UIImage *image =[userInfo objectForKey: @"MPMoviePlayerThumbnailImageKey"];
    NSError *error =[userInfo objectForKey: @"MPMoviePlayerThumbnailErrorKey"];
    if (error == nil) {
        [_videoImageView setImage:image];
        [_videoImageView addPlayButtonSubView];
    } else {
        DLog(@"--- fetching image fails.");
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *SectionCellIdentifier = @"ChapterTableCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SectionCellIdentifier forIndexPath:indexPath];

    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"代码地址";
            cell.detailTextLabel.text = _chapter.codePath;
            break;
        case 1:
            cell.textLabel.text = @"作业地址";
            cell.detailTextLabel.text = _chapter.assignmentPath;
            break;
        default:
            break;
    }
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *urlString;
    switch (indexPath.row) {
        case 0:
            urlString = _chapter.codePath;
            break;
        case 1:
            urlString = _chapter.assignmentPath;
            break;
        default:
            break;
    }
    NSURL *url = [NSURL URLWithString:urlString];
    [[UIApplication sharedApplication] openURL:url];
}

@end