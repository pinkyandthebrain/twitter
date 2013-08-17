//
//  TweetCell.h
//  twitter
//
//  Created by Timothy Lee on 8/6/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TweetCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel *username;
@property (nonatomic, strong) IBOutlet UILabel *twitterHandle;
@property (nonatomic, strong) IBOutlet UILabel *tweetText;
@property (nonatomic, strong) IBOutlet UIImageView *profilePhoto;

@end
