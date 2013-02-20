//
//  InformationView.m
//  SolarWeatherDemo
//
//  Created by YoonBong Kim on 12. 7. 31..
//  Copyright (c) 2012년 YoonBong Kim. All rights reserved.
//

#import "InformationView.h"

@implementation InformationView

@synthesize information = _information;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        CAGradientLayer *gradientLayer = [CAGradientLayer layer];
        gradientLayer.frame = self.bounds;
       
        [gradientLayer setColors:[NSArray arrayWithObjects:(id)[[UIColor colorWithRed:10.0f/255.0f green:10.0f/255.0f blue:10.0f/255.0f alpha:1.0f] CGColor], (id)[[UIColor colorWithRed:152.0f/255.0f green:145.0f/255.0f blue:41.0f/255.0f alpha:1.0f] CGColor], nil]];
        
        
        [[self layer] addSublayer:gradientLayer];
            
        
        _dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(20.0f, 20.0f, 280.0f, 80.0f)];
        _dateLabel.backgroundColor = [UIColor clearColor];
        _dateLabel.textColor = [UIColor whiteColor];
        _dateLabel.font = [UIFont systemFontOfSize:18.0f];
        _dateLabel.numberOfLines = 0;
        _dateLabel.textAlignment = UITextAlignmentLeft;
        
        [self addSubview:_dateLabel];
        [_dateLabel release];
        
        
        _degreeLabel = [[UILabel alloc] initWithFrame:CGRectMake(20.0f, 100.0f, 150.0f, 60.0f)];
        _degreeLabel.backgroundColor = [UIColor clearColor];
        _degreeLabel.textColor = [UIColor whiteColor];
        _degreeLabel.font = [UIFont systemFontOfSize:56.0f];
        _degreeLabel.textAlignment = UITextAlignmentLeft;
        _degreeLabel.shadowColor = [UIColor darkGrayColor];
        _degreeLabel.shadowOffset = CGSizeMake(0.5f, 0.5f);
        
        [self addSubview:_degreeLabel];
        [_degreeLabel release];
        
        
        _locationLabel = [[UILabel alloc] initWithFrame:CGRectMake(20.0f, 430.0f, 280.0f, 40.0f)];
        _locationLabel.backgroundColor = [UIColor clearColor];
        _locationLabel.textColor = [UIColor whiteColor];
        _locationLabel.font = [UIFont systemFontOfSize:16.0f];
        _locationLabel.textAlignment = UITextAlignmentCenter;
        _locationLabel.numberOfLines = 2;
        
        [self addSubview:_locationLabel];
        [_locationLabel release];
        
    }
    return self;
}


- (void)setInformation:(NSDictionary *)information
{
    if (_information) {
        [_information release];
        _information = nil;
    }
    
    _information = [information retain];
    
    [self layoutSubviews];
}


- (void)showInformationLabel:(CGFloat)moveY     {
    
    NSLog(@"move y : %f", moveY);
    
    if (moveY < -0.0f) {
        
        [UIView animateWithDuration:0.3f animations:^{
            
            _dateLabel.transform = CGAffineTransformMakeTranslation(0.0f, 30.0f);
            _dateLabel.alpha = 0.0f;
            
            _degreeLabel.transform = CGAffineTransformMakeTranslation(0.0f, 30.0f);
            _degreeLabel.alpha = 0.0f;
            
        }];
        
    }
    else if (moveY >= 0.0f) {
        
        [UIView animateWithDuration:0.3f animations:^{
            _dateLabel.transform = CGAffineTransformMakeTranslation(0.0f, 0.0f);
            _dateLabel.alpha = 1.0f;
            
            _degreeLabel.transform = CGAffineTransformMakeTranslation(0.0f, 0.0f);
            _degreeLabel.alpha = 1.0f;
        }];
    }
}


- (void)showLocationLabel:(BOOL)show    {
    
    [UIView animateWithDuration:0.2f animations:^{
        
        _locationLabel.alpha = (show)? YES : NO;
    }];
    
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (_information) {
        
        _dateLabel.text = [NSString stringWithFormat:@"%@\n%@\n%@", [_information objectForKey:@"time"], [_information objectForKey:@"date"], [_information objectForKey:@"status"]];
        

        _degreeLabel.text = [_information objectForKey:@"degree"];
        
        _locationLabel.text = [_information objectForKey:@"location"];
        
    }
}

@end
