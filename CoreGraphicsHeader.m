//
//  CoreGraphicsHeader.m
//  coreGraphics
//
//  Created by Mirosław Kucharzyk on 8/2/13.
//  Copyright (c) 2013 Mirosław Kucharzyk. All rights reserved.
//

#import "CoreGraphicsHeader.h"

@interface CoreGraphicsHeader ()
@property(nonatomic, assign) CGRect coloredBoxRect;
@property(nonatomic, assign) CGRect paperRect;
@end

@implementation CoreGraphicsHeader

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.opaque = NO;
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.opaque = NO;
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.font = [UIFont boldSystemFontOfSize:20.0];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.shadowColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        _titleLabel.shadowOffset = CGSizeMake(0, -1);
        [self addSubview:_titleLabel];
        _lightColor = [UIColor colorWithRed:105.0f/255.0f green:179.0f/255.0f blue:216.0f/255.0f alpha:1.0];
        _darkColor = [UIColor colorWithRed:21.0/255.0 green:92.0/255.0 blue:136.0/255.0 alpha:1.0];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();

    UIColor *shadowColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.5];

    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextFillRect(context, _paperRect);

    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, CGSizeMake(0,2), 3.0, shadowColor.CGColor);
    CGContextSetFillColorWithColor(context, self.lightColor.CGColor);
    CGContextFillRect(context, self.coloredBoxRect);

    CGContextRestoreGState(context);
}

-(void)layoutSubviews {
    CGFloat coloredBoxMargin = 2.0;
    CGFloat coloredBoxHeight = 40.0;
    self.coloredBoxRect = CGRectMake(coloredBoxMargin, coloredBoxMargin, self.bounds.size.width - coloredBoxMargin * 2, coloredBoxHeight);

    CGFloat paperMargin = 9.0;
    self.paperRect = CGRectMake(paperMargin, CGRectGetMaxY(self.coloredBoxRect), self.bounds.size.width - 2 * paperMargin, self.bounds.size.height - CGRectGetMaxY(self.coloredBoxRect));

    self.titleLabel.frame = self.coloredBoxRect;
}

@end