//
//  TWVedioImageView.m
//  twcourses
//
//  Created by jianing on 1/6/14.
//  Copyright (c) 2014 xi'an thoughtworks. All rights reserved.
//

#import "TWVedioImageView.h"

@implementation TWVedioImageView

-(void)addPlayButtonSubView
{
    CGRect backgroundRect = [self bounds];
    UIImage *playButton = [UIImage imageNamed:@"play_button.png"];
    NSInteger leftPosition = backgroundRect.size.width/2 - playButton.size.width/2;
    NSInteger rightPosition = backgroundRect.size.height/2 - playButton.size.height/2;
    
    UIImageView *playButtonImageView = [[UIImageView alloc] initWithFrame:CGRectMake(leftPosition, rightPosition, playButton.size.width, playButton.size.height)];
    [playButtonImageView setImage:playButton];
    
    [self addSubview:playButtonImageView];
}

@end
