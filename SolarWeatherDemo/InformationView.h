//
//  InformationView.h
//  SolarWeatherDemo
//
//  Created by YoonBong Kim on 12. 7. 31..
//  Copyright (c) 2012년 YoonBong Kim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InformationView : UIView {
    
    UILabel *_dateLabel;
    UILabel *_degreeLabel;
    UILabel *_locationLabel;
    
    NSDictionary *_information;
}

@property (nonatomic, retain) NSDictionary *information;

- (void)showInformationLabel:(CGFloat)moveY;
- (void)showLocationLabel:(BOOL)show;

@end
