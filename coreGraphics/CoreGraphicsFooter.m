//
// Created by Blondyn on 04/08/2013.
// Copyright (c) 2013 Mirosław Kucharzyk. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "CoreGraphicsFooter.h"


@implementation CoreGraphicsFooter {

}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
         self.backgroundColor = [UIColor clearColor];
    }

    return self;
}


- (void)drawRect:(CGRect)rect {
    CGContextRef *context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, CGSizeMake(0, 20), 3.0, [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.5].CGColor);
    CGContextSetFillColorWithColor(context, [UIColor clearColor].CGColor);
    CGContextFillRect(context, CGRectMake(10,0,self.bounds.size.width-20,10));
    CGContextRestoreGState(context);



}

@end