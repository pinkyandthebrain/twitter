//
//  TweetDetailVC.h
//  twitter
//
//  Created by Seema Kamath on 8/15/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"

@interface TweetDetailVC : UIViewController

@property (nonatomic, strong) IBOutlet UIImageView *profilePhoto;
@property (nonatomic, strong) IBOutlet UILabel *username;
@property (nonatomic, strong) IBOutlet UILabel *twitterHandle;
@property (nonatomic, strong) IBOutlet UILabel *tweetText;

@property (nonatomic, strong) IBOutlet UIView *buttonGroupView;

@property (nonatomic, strong) Tweet *tweet;


@end
