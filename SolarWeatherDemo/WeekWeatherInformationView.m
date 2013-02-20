//
//  WeekWeatherInformationView.m
//  SolarWeatherDemo
//
//  Created by YoonBong Kim on 12. 7. 31..
//  Copyright (c) 2012년 YoonBong Kim. All rights reserved.
//

#import "WeekWeatherInformationView.h"

@implementation WeekWeatherInformationView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        NSInteger tag = 100;
        CGPoint point = CGPointMake(20.0f, frame.size.height - 100.0f);
        for (NSInteger idx = 0; idx < 3; idx++)     {
            
            ImageWeatherView *weatherView = [[ImageWeatherView alloc] initWithFrame:CGRectMake(point.x, point.y, 80.0f, 80.0f)];
            
            [self addSubview:weatherView];
            
            tag += 10;
            point.x += 100.0f;
        }
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
