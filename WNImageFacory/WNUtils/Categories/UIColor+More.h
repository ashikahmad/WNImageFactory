//
//  UIColor+More.h
//  ViewDecor
//
//  Created by Ashik Ahmad on 2/4/13.
//  Copyright (c) 2013 Ashik Ahmad. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (More)

/**
 @param r : red value   (0-255)
 @param g : green value (0-255)
 @param b : blue value  (0-255)
 @param a : alpha value (0-100)
 @return generated UIColor
 */
+(UIColor *) colorWithR:(int) r g:(int) g b:(int) b a:(int) a;

/**
 @note just a shortcut for colorWithAlphaComponent:
 */
-(UIColor *) withAlpha:(CGFloat) alpha;

/**
 @param hex : hexadecimal representation of color.
 @note Supported formats: case-insensitive formats with any of this patterns with or without 0x or # prefix - rrggbb, rrggbbaa, rgb, rgba
 @return generated UIColor
 */
+(UIColor *) colorWithHexString:(NSString *) hex;

@end

#pragma C-Type Utils

/**
 @param rgbValue : use hexadecimal in a pattern like @c 0xRRGGBB
 @note Example: for green, use @c UIColorFromRGB(0x00FF00)
 */
UIColor *UIColorFromRGB(int32_t rgbValue);

/**
 @param rgbaValue : use hexadecimal in a pattern like @c 0xRRGGBBAA.
 
 @note Example: for green, use @c UIColorFromRGB(0x00FF0FF)
 */
UIColor *UIColorFromRGBA(int32_t rgbaValue);
