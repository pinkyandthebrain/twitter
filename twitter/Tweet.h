//
//  Tweet.h
//  twitter
//
//  Created by Timothy Lee on 8/5/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tweet : RestObject

@property (nonatomic, strong, readonly) NSString *text;
@property (nonatomic, strong, readonly) NSString *name;

+ (NSMutableArray *)tweetsWithArray:(NSArray *)array;
+ (CGFloat)heightForLabelWithString:(NSString *)pString andWidth:(CGFloat)pWidth font:(UIFont *)font;
+ (CGFloat)widthForLabelWithString:(NSString *)pString andHeigth:(CGFloat)pHeight;

@end
