//
//  ImageWeatherView.m
//  SolarWeatherDemo
//
//  Created by YoonBong Kim on 12. 7. 31..
//  Copyright (c) 2012년 YoonBong Kim. All rights reserved.
//

#import "ImageWeatherView.h"

@implementation ImageWeatherView

@synthesize weatherInfo = _weatherInfo;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _weekLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, frame.size.width, 20.0f)];
        _weekLabel.backgroundColor = [UIColor clearColor];
        _weekLabel.font = [UIFont boldSystemFontOfSize:15.0f];
        _weekLabel.textAlignment = UITextAlignmentLeft;
        _weekLabel.textColor = [UIColor whiteColor];
        _weekLabel.text = @"수";
        
        [self addSubview:_weekLabel];
        [_weekLabel release];
        
        
        _statusLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 20.0f, frame.size.width, 20.0f)];
        _statusLabel.backgroundColor = [UIColor clearColor];
        _statusLabel.font = [UIFont systemFontOfSize:15.0f];
        _statusLabel.textAlignment = UITextAlignmentLeft;
        _statusLabel.textColor = [UIColor whiteColor];
        _statusLabel.text = @"25 / 32";
        
        [self addSubview:_statusLabel];
        [_statusLabel release];
        
        
        _weatherImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5.0f, 45.0f, frame.size.width - 40.0f, frame.size.width - 40.0f)];
        _weatherImageView.backgroundColor = [UIColor blueColor];
        
        [self addSubview:_weatherImageView];
        [_weatherImageView release];
        
    }
    return self;
}


@end
