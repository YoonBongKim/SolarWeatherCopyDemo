//
//  WatchView.h
//  SolarWeatherDemo
//
//  Created by YoonBong Kim on 12. 7. 31..
//  Copyright (c) 2012년 YoonBong Kim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface WatchView : UIView   {
    
    NSDate *_date;
}

@property (nonatomic, retain) NSDate *date;

- (void) drawLineForContext:(CGContextRef)context Width:(float)_width angle:(double)_angle length:(double)radius;

@end
