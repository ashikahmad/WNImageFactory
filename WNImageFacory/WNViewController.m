//
//  WNViewController.m
//  WNPatternFacoryTest
//
//  Created by Ashik Ahmad on 11/8/13.
//  Copyright (c) 2013 Ashik. All rights reserved.
//

#import "WNViewController.h"
#import "WNImageFactory.h"
#import "UIView+More.h"
#import "UIColor+More.h"

@interface WNViewController ()

@end

@implementation WNViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Basic example on view
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[WNImageFactory gradientWithSize:self.view.frame.size colorsInfo:@"#adadad 0%, #d6d6d6 100%" vertical:NO]]];
    
    // Add ScrollView
    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:self.view.frame];
    scroll.alwaysBounceVertical = YES;
    [self.view addSubview:scroll];
    
    // Defince example patterns
    NSArray *patterns = @[
                          @"#b7deed 0%, #71ceef 50%, #21b4e2 51%, #b7deed 100%",
                          @"#cb60b3 0%, #c146a1 50%, #a80077 51%, #db36a4 100%",
                          @"#feccb1 0%, #f17432 50%, #ea5507 51%, #fb955e 100%",
                          @"#f3e2c7 0%, #c19e67 50%, #b68d4c 51%, #e9d4b3 100%",
                          @" #fceabb 0%, #fccd4d 50%, #f8b500 51%, #fbdf93 100%",
                          @"#f2f6f8 0%, #d8e1e7 50%, #b5c6d0 51%, #e0eff9 100%",
                          @"#f3c5bd 0%, #e86c57 50%, #ea2803 51%, #ff6600 75%, #c72200 100%",
                          @"#aebcbf 0%, #6e7774 50%, #0a0e0a 51%, #0a0809 100%",
                          @"#f1e767 0%, #feb645 100%",
                          @"#a7cfdf 0%, #23538a 100%"
                          ];
    
    float offset = 10;
    float btnW = (scroll.frame.size.width-3*offset)/2;
    float firstY = 60;
    float btnH = 30;
    CGSize s = CGSizeMake(btnW, btnH);
    
    // Add Buttons with defined patterns
    for (int i=0; i<patterns.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(offset + (i%2)*(offset+btnW),
                               firstY + (int)(i/2)*(offset+btnH),
                               btnW, btnH);
        
        [btn setBackgroundImage:[WNImageFactory gradientWithSize:s colorsInfo:patterns[i] vertical:NO] forState:UIControlStateNormal];
        
        // Prettify Button
        [btn setTitle:[NSString stringWithFormat:@"Gradient %d", i+1] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor colorWithWhite:1.0 alpha:0.9]forState:UIControlStateNormal];
        [btn setTitleShadowColor:[UIColor colorWithWhite:0.0 alpha:0.5] forState:UIControlStateNormal];
        btn.titleLabel.shadowOffset = CGSizeMake(0, -1);
        btn.titleLabel.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:15];
        [btn roundCornersWithRadius:5];
        
        [scroll addSubview:btn];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
