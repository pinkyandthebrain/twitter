//
//  TimelineVC.m
//  twitter
//
//  Created by Timothy Lee on 8/4/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import "TimelineVC.h"
#import "TweetDetailVC.h"
#import "TweetCell.h"
#import "ComposeVC.h"
#import "UIImageView+AFNetworking.h"
#import <SystemConfiguration/SystemConfiguration.h>
#import "AFHTTPClient.h"

@interface TimelineVC ()


@property (nonatomic, strong) NSMutableArray *tweets;

- (void)refresh:(UIRefreshControl *)refreshControl;
- (void)onSignOutButton;
- (void)reload;
- (void)onCompose;

@end

@implementation TimelineVC

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.title = @"Twitter";
        
        [self reload];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //  AFHTTPClient *client = [[AFHTTPClient alloc] init];
    
    
    
#ifdef _SYSTEMCONFIGURATION_H
    NSLog(@"SYSTEM CONFIG DEFINED");
#endif
    
    UIRefreshControl *pullToRefreshControl = [[UIRefreshControl alloc] init];
    [pullToRefreshControl addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:pullToRefreshControl];
    
    //TIM: Adding this line is causing issues in TweetDetailVC where the profile photo does not show up.
    [self.navigationController.navigationBar setTranslucent:NO];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Sign Out" style:UIBarButtonItemStylePlain target:self action:@selector(onSignOutButton)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"compose.png"] style:UIBarButtonItemStylePlain target:self action:@selector(onCompose)];
     
    //Register custom Nib
    UINib *customNib = [UINib nibWithNibName:@"TweetCell" bundle:nil];
    [self.tableView registerNib:customNib forCellReuseIdentifier:@"TweetCell"];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tweets.count;
}

- (TweetCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"TweetCell";
    
    TweetCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    Tweet *tweet = self.tweets[indexPath.row];
    
    CGFloat bodyHeight = [Tweet heightForLabelWithString:tweet.text andWidth:cell.tweetText.bounds.size.width font:cell.tweetText.font];
    
    cell.tweetText.frame = CGRectMake(cell.tweetText.frame.origin.x, cell.tweetText.frame.origin.y, cell.tweetText.frame.size.width, bodyHeight);
    cell.tweetText.numberOfLines = 0;
    cell.tweetText.text = tweet.text;
    NSDictionary *userDetails = [tweet valueOrNilForKeyPath:@"user"];
    NSString *username = [[NSString alloc] initWithString:[userDetails objectForKey:@"name"]];
    CGFloat bodyWidth = [Tweet widthForLabelWithString:username andHeigth:cell.username.bounds.size.height];
    cell.username.frame = CGRectMake(cell.username.frame.origin.x, cell.username.frame.origin.y, bodyWidth+50, cell.username.bounds.size.height);
    cell.username.text = username;
    cell.twitterHandle.frame = CGRectMake(cell.username.frame.origin.x+bodyWidth+5,cell.twitterHandle.frame.origin.y, cell.twitterHandle.bounds.size.width, cell.twitterHandle.bounds.size.height);
    cell.twitterHandle.text = [@"@" stringByAppendingString:[userDetails objectForKey:@"screen_name"]];
    [cell.profilePhoto setImageWithURL:[NSURL URLWithString:[userDetails objectForKey:@"profile_image_url"]]];
    
    return cell;
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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    TweetDetailVC *tweetDetailVC = [[TweetDetailVC alloc] initWithNibName:@"TweetDetailVC" bundle:nil];
    Tweet *tweet = self.tweets[indexPath.row];
    tweetDetailVC.tweet = tweet;
    //[tweetDetailVC.profilePhoto setImageWithURL:[NSURL URLWithString:[tweet objectForKey:@"profile_image_url"]]];
    
    [self.navigationController pushViewController:tweetDetailVC animated:YES];
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Tweet *tweet = self.tweets[indexPath.row];
    CGFloat bodyHeight = [Tweet heightForLabelWithString:tweet.text andWidth:290 font:[UIFont fontWithName:@"HelveticaNeue" size:14.5f]];
    
    return bodyHeight+50.0;
    
}



/*
 #pragma mark - Navigation
 
 // In a story board-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 
 */



#pragma mark - Private methods

- (void)onSignOutButton {
    [User setCurrentUser:nil];
}

- (void)reload {
    [[TwitterClient instance] homeTimelineWithCount:20 sinceId:0 maxId:0 success:^(AFHTTPRequestOperation *operation, id response) {
        NSLog(@"%@", response);
        self.tweets = [Tweet tweetsWithArray:response];
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        // Do nothing
    }];
}

- (void)refresh:(UIRefreshControl *)refreshControl {
    [self reload];
    [refreshControl endRefreshing];
}

- (void) onCompose
{
    ComposeVC *composeVC = [[ComposeVC alloc] init];
    composeVC.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    
    [self presentViewController:composeVC animated:YES completion:nil];
    
}

@end
