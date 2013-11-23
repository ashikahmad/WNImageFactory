//
//  WNGradientView.h
//  Coins
//
//  Created by Ashik Ahmad on 11/7/13.
//  Copyright (c) 2013 WNeeds. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WNImageFactory : NSObject

/**
 Creates a UIImage with gradient color
 @code
 [WNImageFactory gradientWithSize:CGSizeMake(200, 50)
 colorsInfo:@"#f1e767 0%, #feb645 100%"
 vertical:NO]
 @endcode
 
 @param size size of the produced image
 @param colorsInfo string with comma-separated info like @"color1 location1, color2 location2, ..." . Here @b color is represented as hexa-string and @b location in terms of percentage.
 @tparam colorsInfo \@"#f1e767 0%, #feb645 100%"
 @param vertical if gradient shoud go vertical; horizontal otherwise
 */
+(UIImage *) gradientWithSize:(CGSize) size colorsInfo:(NSString *) colorsInfo vertical:(BOOL) vertical;

/**
 Creates a UIImage with gradient color
 @code
 [WNImageFactory gradientWithSize:CGSizeMake(200, 50)
 colors:@[[UIColor blueColor], [UIColor whiteColor]]
 locations:@[@(0.0f), @(1.0f)]
 vertical:NO]
 @endcode
 @param size size of the produced image
 @param uiColors array of UIColor for the gradient
 @param locations array of NSNumber (float) ranged within 0.0-1.0
 @param vertical if gradient shoud go vertical; horizontal otherwise
 
 @warning both @c uiColors and @c locations need to have same number of elements. Bad things will happen otherwise :p
 */
+(UIImage *) gradientWithSize:(CGSize) size colors:(NSArray *) uiColors locations:(NSArray *) locations vertical:(BOOL) vertical;

@end
