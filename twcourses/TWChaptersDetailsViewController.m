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
//    NSString *path = @"ftp://dygod1:dygod1@d135.dygod.org:7031/%E6%B0%B8%E6%97%A0%E6%AD%A2%E5%A2%83.[%E4%B8%AD%E8%8B%B1%E5%8F%8C%E5%AD%97.1024%E5%88%86%E8%BE%A8%E7%8E%87]/[%E7%94%B5%E5%BD%B1%E5%A4%A9%E5%A0%82www.dy2018.net]%E6%B0%B8%E6%97%A0%E6%AD%A2%E5%A2%83BD%E4%B8%AD%E8%8B%B1%E5%8F%8C%E5%AD%97.rmvb";
    
//    NSBundle *bundle = [NSBundle mainBundle];
//    NSString *path = [bundle pathForResource:@"Roar" ofType:@"m4v"];

    NSString *path = @"http://10.29.2.82:8000/Roar.m4v";
    
    movieController = [[MPMoviePlayerController alloc] initWithContentURL:[NSURL URLWithString:path]];
    NSMutableArray * allThumbnails = [NSMutableArray  arrayWithObjects:[NSNumber numberWithDouble:5.0],nil];
    [movieController requestThumbnailImagesAtTimes:allThumbnails timeOption:MPMovieTimeOptionExact];
}

-(void)movieThumbnailLoadComplete:(NSNotification*)notification
{
    NSLog(@"**************************");
    
    NSDictionary *userInfo = [notification userInfo];
    NSNumber *timecode =[userInfo objectForKey: @"MPMoviePlayerThumbnailTimeKey"];
    UIImage *image =[userInfo objectForKey: @"MPMoviePlayerThumbnailImageKey"];
    NSError *error =[userInfo objectForKey: @"MPMoviePlayerThumbnailErrorKey"];
	_videoImageView.image = image;
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