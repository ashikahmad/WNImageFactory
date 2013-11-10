//
//  WNGradientView.h
//  Coins
//
//  Created by Ashik Ahmad on 11/7/13.
//  Copyright (c) 2013 WNeeds. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WNPatternFactory : NSObject

+(UIImage *) gradientWithSize:(CGSize) size colorsInfo:(NSString *) colorsInfo vertical:(BOOL) vertical;

+(UIImage *) gradientWithSize:(CGSize) size colors:(NSArray *) uiColors locations:(NSArray *) locations vertical:(BOOL) vertical;

@end
