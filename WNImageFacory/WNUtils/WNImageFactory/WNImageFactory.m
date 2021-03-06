//
//  WNGradientView.m
//  Coins
//
//  Created by Ashik Ahmad on 11/7/13.
//  Copyright (c) 2013 WNeeds. All rights reserved.
//

#import "WNImageFactory.h"
#import "UIColor+More.h"
#import "NSString+More.h"


@implementation WNImageFactory

+(UIImage *)gradientWithSize:(CGSize)size colorsInfo:(NSString *)colorsInfo vertical:(BOOL)vertical {
    NSArray *infoArray = [colorsInfo componentsSeparatedByString:@","];
    if (infoArray.count) {
        NSMutableArray *colors = [NSMutableArray array];
        NSMutableArray *locations = [NSMutableArray array];
        for (int i=0; i<infoArray.count; i++) {
            NSArray *info = [[infoArray[i] trim] componentsSeparatedByString:@" "];
            if (info.count == 2) {
                NSString *colorStr = [info[0] trim];
                UIColor *c = [UIColor colorWithHexString:colorStr];
                [colors addObject:c];
                
                NSString *locStr = [info[1] trim];
                float loc = [locStr floatValue]/100.0f;
                [locations addObject:@(loc)];
            }
        }
        return [self gradientWithSize:size colors:colors locations:locations vertical:vertical];
    }
    return nil;
}

+(UIImage *)gradientWithSize:(CGSize)size colors:(NSArray *)uiColors locations:(NSArray *)locations vertical:(BOOL)vertical {
    // 1. Create Image Context
    UIGraphicsBeginImageContextWithOptions(size, YES, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // 2. Create Color-space
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    // 3. Prepare color components and locations
    int noOfColors = [uiColors count];
    CGFloat locs[noOfColors];
    CGFloat cols[noOfColors*4];
    BOOL needCalcLocs = !(locations && locations.count==uiColors.count);
    
    for (int i=0; i<noOfColors; i++) {
        CGColorRef c = [uiColors[i] CGColor];
        const CGFloat *comps = CGColorGetComponents(c);
        cols[i*4] = comps[0];
        cols[i*4+1] = comps[1];
        cols[i*4+2] = comps[2];
        cols[i*4+3] = comps[3];
        
        if(needCalcLocs)
            locs[i] = ((float)i)/(noOfColors-1);
        else
            locs[i] = [locations[i] floatValue];
    }
    
    CGPoint startPoint = CGPointZero, endPoint;
    if (vertical) endPoint = CGPointMake(size.width, 0);
    else endPoint = CGPointMake(0, size.height);
    
    // 4. Create gradient & draw
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace, cols, locs, noOfColors);
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    
    // 5. Get Image!
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    
    // 6. Clean Up, clean Up, clean Up!!
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
    UIGraphicsEndImageContext();
    
    // Good to go..
    return img;
}

@end
