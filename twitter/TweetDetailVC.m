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
    
    
    CGFloat bodyHeight = [Tweet heightForLabelWithString:self.tweet.text andWidth:290];
    
    self.tweetText.frame = CGRectMake(self.tweetText.frame.origin.x, self.tweetText.frame.origin.y, self.tweetText.frame.size.width, bodyHeight);
    self.tweetText.numberOfLines = 0;
    self.tweetText.text = self.tweet.text;
    NSDictionary *userDetails = [self.tweet valueOrNilForKeyPath:@"user"];
    self.username.text = [userDetails objectForKey:@"name"];
    self.twitterHandle.text = [@"@" stringByAppendingString:[userDetails objectForKey:@"screen_name"]];
    self.profilePhoto.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[userDetails objectForKey:@"profile_image_url"]]]];
    

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Private methods

@end
