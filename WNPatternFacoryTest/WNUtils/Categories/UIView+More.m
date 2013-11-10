//
//  UIView+More.m
//  StPhillipsBakery
//
//  Created by Ashik Ahmad on 7/8/13.
//  Copyright (c) 2013 Ashik. All rights reserved.
//

#import "UIView+More.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIView (EasyFrame)

-(float)x { return self.frame.origin.x; }
-(float)y { return self.frame.origin.y; }
-(float)width { return self.frame.size.width; }
-(float)height { return self.frame.size.height; }

-(CGPoint)origin { return self.frame.origin; }
-(CGSize)size { return self.frame.size; }

-(void)setX:(float)x {
    CGRect rect = self.frame;
    rect.origin.x = x;
    self.frame = rect;
}

-(void)setY:(float)y {
    CGRect rect = self.frame;
    rect.origin.y = y;
    self.frame = rect;
}

-(void)setWidth:(float)width {
    CGRect rect = self.frame;
    rect.size.width = width;
    self.frame = rect;
}

-(void)setHeight:(float)height {
    CGRect rect = self.frame;
    rect.size.height = height;
    self.frame = rect;
}

-(void)setOrigin:(CGPoint)origin {
    CGRect rect = self.frame;
    rect.origin = origin;
    self.frame = rect;
}

-(void)setSize:(CGSize)size {
    CGRect rect = self.frame;
    rect.size = size;
    self.frame = rect;
}

@end

#pragma mark -

@implementation UIView (FindFirstResponder)

-(UIView *) findFirstResponder
{
    // check self
    if (self.isFirstResponder) {
        return self;
    }
    // check subviews recursively
    for (UIView *subView in self.subviews) {
        UIView *firstResponder = [subView findFirstResponder];
        if (firstResponder)
            return firstResponder;
    }
    // if found nowhere
    return nil;
}
@end

#pragma mark -

@implementation UIView (RoundedCorner)

-(void)roundCornersWithRadius:(CGFloat)radius {
    [self roundCornersWithRadius:radius corners:UIRectCornerAllCorners];
}

-(void)roundCornersWithRadius:(CGFloat)radius corners:(UIRectCorner)corners {
    CALayer *layer = self.layer;
    [layer setCornerRadius:radius];
    [layer setMasksToBounds:YES];
    if (corners == UIRectCornerAllCorners) {
        layer.mask = nil;
        
        layer.cornerRadius = radius;
        layer.masksToBounds = YES;
    } else {
        layer.cornerRadius = 0;
        
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:CGSizeMake(radius, radius)];
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.path = [path CGPath];
        layer.mask = shapeLayer;
        layer.masksToBounds = YES;
    }
}

@end

#pragma mark -

@implementation UIView (Border)

-(void)addBorderWithColor:(UIColor *)color size:(CGFloat)size {
    CALayer *layer = self.layer;
    layer.borderWidth = size;
    layer.borderColor = [color CGColor];
}

@end

#pragma mark -

@implementation UIView (Shadow)

- (CGPathRef)renderRectAllAround {
    CGRect rect = self.bounds;
    rect = CGRectInset(rect, -5, -5);
	UIBezierPath *path = [UIBezierPath bezierPathWithRect:rect];
	return path.CGPath;
}

- (CGPathRef)renderRect {
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:self.bounds];
	return path.CGPath;
}

- (CGPathRef)renderTrapezoid {
	CGSize size = self.bounds.size;
	
	UIBezierPath *path = [UIBezierPath bezierPath];
	[path moveToPoint:CGPointMake(size.width * 0.33f, size.height * 0.66f)];
	[path addLineToPoint:CGPointMake(size.width * 0.66f, size.height * 0.66f)];
	[path addLineToPoint:CGPointMake(size.width * 1.15f, size.height * 1.15f)];
	[path addLineToPoint:CGPointMake(size.width * -0.15f, size.height * 1.15f)];
    
	return path.CGPath;
}

- (CGPathRef)renderEllipse {
	CGSize size = self.bounds.size;
	
	CGRect ovalRect = CGRectMake(0.0f, size.height + 5, size.width-10, 15);
	UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:ovalRect];
	
	return path.CGPath;
}

- (CGPathRef)renderPaperCurl {
	CGSize size = self.bounds.size;
	CGFloat curlFactor = 15.0f;
	CGFloat shadowDepth = 5.0f;
    
	UIBezierPath *path = [UIBezierPath bezierPath];
	[path moveToPoint:CGPointMake(0.0f, 0.0f)];
	[path addLineToPoint:CGPointMake(size.width, 0.0f)];
	[path addLineToPoint:CGPointMake(size.width, size.height + shadowDepth)];
	[path addCurveToPoint:CGPointMake(0.0f, size.height + shadowDepth)
			controlPoint1:CGPointMake(size.width - curlFactor, size.height + shadowDepth - curlFactor)
			controlPoint2:CGPointMake(curlFactor, size.height + shadowDepth - curlFactor)];
    
	return path.CGPath;
}

-(void)addShadowWithType:(WNShadowType)shadowType {
    self.layer.shadowColor = [UIColor blackColor].CGColor;
	self.layer.shadowOpacity = 0.5f;
	self.layer.shadowOffset = CGSizeMake(10.0f, 10.0f);
	self.layer.shadowRadius = 3.0f;
	self.layer.masksToBounds = NO;
    
    switch (shadowType) {
        case ShadowTypeDropShadow:
            self.layer.shadowPath = [self renderRect];
            break;
        case ShadowTypeTrapeZoid:
            self.layer.shadowPath = [self renderTrapezoid];
            break;
        case ShadowTypeTopDown:
            self.layer.shadowPath = [self renderEllipse];
            break;
        case ShadowTypePaperCurl:
            self.layer.shadowPath = [self renderPaperCurl];
            break;
        case ShadowTypeAllAround:
            self.layer.shadowOffset = CGSizeZero;
            self.layer.shadowPath = [self renderRectAllAround];
            break;
            
        default:
            self.layer.shadowPath = nil;
            break;
    }
}

@end