//
//  ImageWeatherView.h
//  SolarWeatherDemo
//
//  Created by YoonBong Kim on 12. 7. 31..
//  Copyright (c) 2012년 YoonBong Kim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageWeatherView : UIView    {
    
    UILabel *_weekLabel;
    UILabel *_statusLabel;
    UIImageView *_weatherImageView;
    
    NSDictionary *_weatherInfo;
}


@property (nonatomic, retain) NSDictionary *weatherInfo;

@end
