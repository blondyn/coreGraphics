#import "CoreGraphicsView.h"


@implementation CoreGraphicsView {

}
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {

    }

    return self;
}

- (void)drawRect:(CGRect)rect {
    CGContextRef viewContext = UIGraphicsGetCurrentContext();

    CGContextSetRGBFillColor(viewContext, 1, 0, 1, 1);
    CGContextFillRect(viewContext, CGRectMake(0,0,200,100));
    CGContextSetRGBFillColor(viewContext, 1, 0, 0, .3);
    CGContextFillRect(viewContext, CGRectMake(0,0,100,200));

}

@end