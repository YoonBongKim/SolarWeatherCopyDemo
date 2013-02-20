//
//  MainViewController.h
//  SolarWeatherDemo
//
//  Created by YoonBong Kim on 12. 7. 31..
//  Copyright (c) 2012년 YoonBong Kim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InformationView.h"
#import "WeekWeatherInformationView.h"
#import "WatchView.h"

@interface MainViewController : UIViewController  <UIScrollViewDelegate>  {
    
    InformationView *_screenView;
    WeekWeatherInformationView *_weekInformationView;
    WatchView *_watchView;
    
    UIScrollView *_backScrollView;
}

@end
