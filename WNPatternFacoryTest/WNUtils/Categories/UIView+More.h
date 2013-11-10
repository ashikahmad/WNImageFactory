//
//  UIView+More.h
//  StPhillipsBakery
//
//  Created by Ashik Ahmad on 7/8/13.
//  Copyright (c) 2013 Ashik. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark - EasyFrame

@interface UIView (EasyFrame)
@property (nonatomic) float x, y, width, height;
@property (nonatomic) CGPoint origin;
@property (nonatomic) CGSize size;
@end

#pragma mark - FindFirstResponder

@interface UIView (FindFirstResponder)
-(UIView *) findFirstResponder;
@end

#pragma RoundedCorner

@interface UIView (RoundedCorner)
-(void) roundCornersWithRadius:(CGFloat) radius;
-(void) roundCornersWithRadius:(CGFloat) radius corners:(UIRectCorner) corners;
@end

#pragma mark - Border

@interface UIView (Border)
-(void) addBorderWithColor:(UIColor *) color size:(CGFloat) size;
@end

#pragma mark - Shadow

typedef enum {
    ShadowTypeDropShadow,
    ShadowTypeTrapeZoid,
    ShadowTypeTopDown,
    ShadowTypePaperCurl,
    ShadowTypeAllAround
} WNShadowType;

@interface UIView (Shadow)
-(void) addShadowWithType:(WNShadowType) shadowType;
@end


