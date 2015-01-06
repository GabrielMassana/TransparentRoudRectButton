//
//  ButtonsView.m
//  TransparentButton
//
//  Created by GabrielMassana on 05/01/2015.
//  Copyright (c) 2015 GabrielMassana. All rights reserved.
//

#import "ButtonsView.h"
#import <QuartzCore/QuartzCore.h>

@interface ButtonsView ()

@property (nonatomic, strong) UIButton *transparentButton;

@end

@implementation ButtonsView

#pragma mark - Init

- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];
        [self addSubview:self.transparentButton];
    }
    
    return self;
}

#pragma mark - DrawRect

- (void)drawRect:(CGRect)rect
{
    // View Background to White
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    UIColor *whiteBackgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1.0];
    CGContextSetFillColorWithColor(ctx, whiteBackgroundColor.CGColor);
    CGContextFillRect(ctx, rect);
    
    // Transparent Rect
    CGRect buttonRect = self.transparentButton.frame;
    buttonRect.size.height = buttonRect.size.height + 10.0;
    buttonRect.size.width = buttonRect.size.width + 10.0;
    buttonRect.origin.x = buttonRect.origin.x - (10.0 / 2);
    buttonRect.origin.y = buttonRect.origin.y - (10.0 / 2);
    
    // Transparent Round Rect Values
    CGFloat radius = 20.0;
    CGFloat minx = CGRectGetMinX(buttonRect);
    CGFloat midx = CGRectGetMidX(buttonRect);
    CGFloat maxx = CGRectGetMaxX(buttonRect);
    CGFloat miny = CGRectGetMinY(buttonRect);
    CGFloat midy = CGRectGetMidY(buttonRect);
    CGFloat maxy = CGRectGetMaxY(buttonRect);
    
    // Draw the rounded rect border.
    CGContextSetRGBStrokeColor(ctx, 0.6, 0.6, 0.6, 1.0);
    CGContextSetRGBFillColor(ctx, 1.0, 1.0, 1.0, 0.0);
    CGContextSetLineWidth(ctx, 1.0);
    CGContextMoveToPoint(ctx, minx, midy);
    CGContextAddArcToPoint(ctx, minx, miny, midx, miny, radius);
    CGContextAddArcToPoint(ctx, maxx, miny, maxx, midy, radius);
    CGContextAddArcToPoint(ctx, maxx, maxy, midx, maxy, radius);
    CGContextAddArcToPoint(ctx, minx, maxy, minx, midy, radius);
    CGContextClosePath(ctx);
    
    // Commit changes
    CGContextAddEllipseInRect(ctx, buttonRect);
    CGContextClip(ctx);
    CGContextClearRect(ctx, buttonRect);
}

#pragma mark - Getters

- (UIButton *)transparentButton
{
    if (!_transparentButton)
    {
        _transparentButton = [[UIButton alloc]initWithFrame:CGRectMake(20,
                                                                       50,
                                                                       [[UIScreen mainScreen] bounds].size.width - 40,
                                                                       80)];
        
        _transparentButton.backgroundColor = [UIColor whiteColor];
        
        _transparentButton.layer.borderWidth = 4.0f;
        _transparentButton.layer.borderColor = [UIColor whiteColor].CGColor;
        _transparentButton.layer.cornerRadius = 20.0f;
        _transparentButton.layer.masksToBounds = YES;
    }
    
    return _transparentButton;
}

@end
