//
//  TweetDetailVC.m
//  twitter
//
//  Created by Seema Kamath on 8/15/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import "TweetDetailVC.h"


@interface TweetDetailVC ()

- (IBAction)onReplyButton:(id)sender;
- (IBAction)onRetweetButton:(id)sender;
- (IBAction)onFavoriteButton:(id)sender;


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
    self.buttonGroupView.frame = CGRectMake(self.buttonGroupView.frame.origin.x, self.tweetText.frame.origin.y + self.tweetText.bounds.size.height + 10, self.buttonGroupView.bounds.size.width, self.buttonGroupView.bounds.size.height);
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Private methods


- (IBAction)onReplyButton:(id)sender
{
    ComposeVC *composeVC = [[ComposeVC alloc] init];
    //UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:composeVC];
    //nvc.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonSystemItemCancel target:self action:@selector(onCancel)];
    composeVC.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentViewController:composeVC animated:YES completion:nil];
    NSLog(@"Reply button clicked");
}

- (IBAction)onRetweetButton:(id)sender
{
    NSLog(@"Retweet button clicked");
}

- (IBAction)onFavoriteButton:(id)sender
{
    NSLog(@"Retweet button clicked");
}
@end
