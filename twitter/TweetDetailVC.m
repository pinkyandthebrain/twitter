//
//  TweetDetailVC.m
//  twitter
//
//  Created by Seema Kamath on 8/15/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import "TweetDetailVC.h"


@interface TweetDetailVC ()

@end

@implementation TweetDetailVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //[self.tweetText setNumberOfLines:ceil(([self.tweet.text sizeWithFont:[UIFont systemFontOfSize:17.0f] ].width)/self.tweetText.bounds.size.width-300)];
    self.tweetText.text = self.tweet.text;
    
    CGFloat bodyHeight = 200.0;// calculate this based on text
    self.tweetText.frame = CGRectMake(self.tweetText.frame.origin.x, self.tweetText.frame.origin.y, self.tweetText.frame.size.width, bodyHeight);
    self.tweetText.numberOfLines = 0;
    self.tweetText.text = self.tweet.text;

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
