//
//  UIColor+more.m
//  MomiLoop
//
//  Created by Ashik Ahmad on 1/2/13.
//  Copyright (c) 2013 WNeeds. All rights reserved.
//

#import "UIColor+more.h"

@implementation UIColor (more)

+(UIColor *)colorWithR:(int)r g:(int)g b:(int)b a:(int) a{
    return [UIColor colorWithRed:r/255.0
                           green:g/255.0
                            blue:b/255.0
                           alpha:a/100.0];
}

-(UIColor *)withAlpha:(CGFloat)alpha {
    return [self colorWithAlphaComponent:alpha];
}

+(UIColor *)colorWithHexString:(NSString *)hex {
    NSString *cString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // strip 0x or # if it appears
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    else if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    
    // String should be 3, 4, 6 or 8 characters
    int strLen = [cString length];
    if (! (   strLen == 3
           || strLen == 4
           || strLen == 6
           || strLen == 8 ))
        return [UIColor blackColor];
    
    BOOL singleChar = (strLen < 6);
    
    // Separate into r, g, b, a substrings
    NSRange range;
    range.location = 0;
    if (singleChar) range.length = 1;
    else            range.length = 2;
    
    NSString *rString = [cString substringWithRange:range];
    
    range.location += range.length;
    NSString *gString = [cString substringWithRange:range];
    
    range.location += range.length;
    NSString *bString = [cString substringWithRange:range];
    
    NSString *aString;
    if (strLen == 4 || strLen == 8){
        range.location += range.length;
        aString = [cString substringWithRange:range];
    }
    else aString = (singleChar)?@"F":@"FF";
    
    if (singleChar) {
        rString = [rString stringByAppendingString:rString];
        gString = [gString stringByAppendingString:gString];
        bString = [bString stringByAppendingString:bString];
        aString = [aString stringByAppendingString:aString];
    }
    
    // Scan values
    unsigned int r, g, b, a;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    [[NSScanner scannerWithString:aString] scanHexInt:&a];
    
    return [UIColor colorWithR: r g: g b: b a: a];
}

@end

#pragma mark - C-Type Utils

/**
 @example UIColorFromRGB(0x00FF00) for green
 */
UIColor *UIColorFromRGB(int32_t rgbValue) {
    return [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0];
}

UIColor *UIColorFromRGBA(int32_t rgbaValue) {
    return [UIColor colorWithRed:((float)((rgbaValue & 0xFF000000) >> 24))/255.0f green:((float)((rgbaValue & 0xFF0000) >> 16))/255.0 blue:((float)((rgbaValue & 0xFF00) >> 8))/255.0 alpha:((float)(rgbaValue & 0xFF))/255.0];
}
