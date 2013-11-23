//
//  NSString+Trim.m
//  WNImageFacoryTest
//
//  Created by Ashik Ahmad on 11/22/13.
//  Copyright (c) 2013 Ashik. All rights reserved.
//

#import "NSString+More.h"

@implementation NSString (More)

-(NSString *)trim {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

@end
