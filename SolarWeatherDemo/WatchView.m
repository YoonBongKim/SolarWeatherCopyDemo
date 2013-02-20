//
//  WatchView.m
//  SolarWeatherDemo
//
//  Created by YoonBong Kim on 12. 7. 31..
//  Copyright (c) 2012년 YoonBong Kim. All rights reserved.
//

#import "WatchView.h"

double RAD(double x)  { return x / 180.0f * M_PI; }

@implementation WatchView

@synthesize date = _date;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        
    }
    return self;
}


- (void)dealloc
{
    [_date release];
    _date = nil;
    
    [super dealloc];
}


- (void)setDate:(NSDate *)date
{
    if (_date) {
        [_date release];
        _date = nil;
    }
    
    _date = [date retain];
    
    [self setNeedsDisplay];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSInteger hour = [[calendar components:NSHourCalendarUnit fromDate:_date] hour];
    NSInteger minute = [[calendar components:NSMinuteCalendarUnit fromDate:_date] minute];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [[UIColor whiteColor] CGColor]);
    CGContextSetLineWidth(context, 4.0f);
    CGContextStrokeEllipseInRect(context, CGRectMake(2.0f, 2.0f, self.bounds.size.width - 4.0f, self.bounds.size.height - 4.0f));
    
    double h = RAD(((hour > 12)? hour - 12 : hour) * 30 + (30 * minute / 60) - 90);
    double m = RAD(minute * 6 - 90);
    
    NSLog(@"hour : %d, rad : %f, minute : %d", hour, h, minute);
    
    [self drawLineForContext:context Width:3.0f angle:h length:self.frame.size.width/2.0 - 15];
    [self drawLineForContext:context Width:3.0f angle:m length:self.frame.size.width/2.0 - 8];
    
}


- (void) drawLineForContext:(CGContextRef)context Width:(float)_width angle:(double)_angle length:(double)radius
{
    CGPoint c = CGPointMake(self.frame.size.width/2.0, self.frame.size.height/2.0);
    
    CGContextSetLineWidth(context, _width);
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextMoveToPoint(context, self.center.x, self.center.y);
    CGPoint addLines[] =
    {
        CGPointMake(self.frame.size.width/2.0, self.frame.size.height/2.0),
        CGPointMake(radius*cos(_angle) +c.x, radius*sin(_angle) +c.y),
    };
    
    CGContextAddLines(context, addLines, sizeof(addLines)/sizeof(addLines[0]));
    CGContextStrokePath(context);
}

@end
