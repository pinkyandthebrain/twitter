//
//  ComposeVC.h
//  twitter
//
//  Created by Seema Kamath on 8/17/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ComposeVC : UIViewController <UITextViewDelegate>

@property (nonatomic, strong) IBOutlet UITextView *tweetTextView;

- (id)initWithString:(NSString *)replyTo;

@end
