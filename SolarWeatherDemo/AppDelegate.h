//
//  AppDelegate.h
//  SolarWeatherDemo
//
//  Created by YoonBong Kim on 12. 7. 31..
//  Copyright (c) 2012년 YoonBong Kim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, CLLocationManagerDelegate> {
    
    CLLocationManager *_locationManager;
    
    CLLocationCoordinate2D _coordinate;
    NSTimer *_locationTimer;
}

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;

@end
