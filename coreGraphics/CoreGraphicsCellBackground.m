//
// Created by Mirosław Kucharzyk on 8/1/13.
// Copyright (c) 2013 Mirosław Kucharzyk. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "CoreGraphicsCellBackground.h"


@implementation CoreGraphicsCellBackground {

}
-(void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();

    UIColor *white = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    UIColor *grey =[UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1.0];
    UIColor *red =[UIColor colorWithRed:1.0 green:0 blue:0 alpha:1.0];
    UIColor *separatorColor = [UIColor colorWithRed:208.0/255.0 green:208.0/255.0 blue:208.0/255.0 alpha:1.0];
    CGRect paperRect = self.bounds;



    CGFloat separatorPositionY = paperRect.origin.y + paperRect.size.height - 1;
    CGPoint startPoint = CGPointMake(paperRect.origin.x, separatorPositionY);
    CGPoint endPoint = CGPointMake(paperRect.origin.x + paperRect.size.width - 1, separatorPositionY);
    drawLinearGradient(context, paperRect, white.CGColor, grey.CGColor);

    CGRect strokeRect = rectFor1PxStroke(CGRectInset(paperRect, 5.0, 5.0));
    CGContextSetStrokeColorWithColor(context, white.CGColor);
    CGContextSetLineWidth(context, 1.0);
    CGContextStrokeRect(context, strokeRect);

    draw1PxStroke(context, startPoint, endPoint, separatorColor.CGColor);
}

CGRect rectFor1PxStroke(CGRect rect) {
    return CGRectMake(rect.origin.x+0.5, rect.origin.y+ 0.5, rect.size.width -1, rect.size.height -1);
}

void draw1PxStroke(CGContextRef context, CGPoint startPoint, CGPoint endPoint, CGColorRef color) {
    CGContextSaveGState(context);
    CGContextSetLineCap(context, kCGLineCapSquare);
    CGContextSetStrokeColorWithColor(context, color);
    CGContextSetLineWidth(context, 1.0);
    CGContextMoveToPoint(context, startPoint.x + 0.5, startPoint.y + 0.5);
    CGContextAddLineToPoint(context, endPoint.x + 0.5, endPoint.y + 0.5);
    CGContextStrokePath(context);
    CGContextRestoreGState(context);
}

void drawLinearGradient(CGContextRef context, CGRect rect, CGColorRef startColor, CGColorRef endColor) {
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGFloat locations[] = {0.0, 1.0};

    NSArray *colors = @[(__bridge id)startColor, (__bridge id)endColor];
    CGGradientRef gradientRef = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef) colors, locations);

    CGPoint startPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMinY(rect));
    CGPoint endPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMaxY(rect));

    CGContextSaveGState(context);
    CGContextAddRect(context, rect);
    CGContextClip(context);
    CGContextDrawLinearGradient(context, gradientRef, startPoint, endPoint, 0);
    CGContextRestoreGState(context);

    CGGradientRelease(gradientRef);
    CGColorSpaceRelease(colorSpace);
}
@end