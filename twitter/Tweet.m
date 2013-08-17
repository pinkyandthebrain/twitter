//
//  Tweet.m
//  twitter
//
//  Created by Timothy Lee on 8/5/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import "Tweet.h"

@implementation Tweet

- (NSString *)text {
    return [self.data valueOrNilForKeyPath:@"text"];
}

- (NSString *)name {
    return [self.data valueOrNilForKeyPath:@"name"];
}

+ (NSMutableArray *)tweetsWithArray:(NSArray *)array {
    NSMutableArray *tweets = [[NSMutableArray alloc] initWithCapacity:array.count];
    for (NSDictionary *params in array) {
        [tweets addObject:[[Tweet alloc] initWithDictionary:params]];
    }
    return tweets;
}

+ (CGFloat)heightForLabelWithString:(NSString *)pString andWidth:(CGFloat)pWidth
{
    CGSize labelSize = [pString sizeWithFont:[UIFont fontWithName:@"HelveticaNeue" size:14.5f] constrainedToSize:CGSizeMake(pWidth, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
    return labelSize.height;
}

+ (CGFloat)widthForLabelWithString:(NSString *)pString andHeigth:(CGFloat)pHeight
{
    CGSize labelSize = [pString sizeWithFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:14.5f] constrainedToSize:CGSizeMake(MAXFLOAT        , pHeight) lineBreakMode:NSLineBreakByWordWrapping];
    return labelSize.width;
}

@end
