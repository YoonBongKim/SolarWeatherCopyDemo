//
//  MainViewController.m
//  SolarWeatherDemo
//
//  Created by YoonBong Kim on 12. 7. 31..
//  Copyright (c) 2012년 YoonBong Kim. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

- (NSString *)convertStringFromDate:(NSDate *)date;

@end

@implementation MainViewController

- (id)init
{
    self = [super init];
    if (self) {

    }
    return self;
}


- (void)loadView
{
    [super loadView];
    
    _backScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 480.0f)];
    _backScrollView.delegate = self;
    _backScrollView.scrollEnabled = YES;
    _backScrollView.alwaysBounceVertical = YES;
    _backScrollView.showsVerticalScrollIndicator = NO;
    _backScrollView.showsHorizontalScrollIndicator = NO;
    
    [self.view addSubview:_backScrollView];
    [_backScrollView release];
    
    
    _screenView = [[InformationView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 480.0f)];
    _screenView.backgroundColor = [UIColor orangeColor];
    _screenView.userInteractionEnabled = NO;
    
    [self.view addSubview:_screenView];
    [_screenView release];
    
    
    _weekInformationView = [[WeekWeatherInformationView alloc] initWithFrame:CGRectMake(0.0f, -400.0f, 320.0f, 398.0f)];
    _weekInformationView.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:_weekInformationView];
    [_weekInformationView release];
    
    
    _watchView = [[WatchView alloc] initWithFrame:CGRectMake(310.0f - 50.0f, 10.0f, 50.0f, 50.0f)];
    _watchView.alpha = 0.0f;
    
    [self.view addSubview:_watchView];
    [_watchView release];
    
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSDate *nowDate = [NSDate date];
    
    NSArray *timeDateArray = [[self convertStringFromDate:nowDate] componentsSeparatedByString:@"/"];
    
    _watchView.date = nowDate;
    _screenView.information = [NSDictionary dictionaryWithObjectsAndKeys:[timeDateArray objectAtIndex:0], @"time", [timeDateArray objectAtIndex:1], @"date", @"맑음", @"status", @"29°", @"degree", @"현재 위치 - 대한민국", @"location", nil];
    
}


- (NSString *)convertStringFromDate:(NSDate *)date  {
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.locale = [NSLocale currentLocale];
    df.dateFormat = @"a h:mm'/'MMM dd일 (EEE)";
    
    NSString *string = [df stringFromDate:date];
    
    [df release];
    
    return string;
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


#pragma mark - UIScrollView delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{

    [_screenView showInformationLabel:scrollView.contentOffset.y];
    [_screenView showLocationLabel:(scrollView.contentOffset.y > 0.0f)? NO : YES];
    
    [UIView animateWithDuration:0.3f animations:^{
        
        _watchView.alpha = (scrollView.contentOffset.y > 0.0f)? 1.0f : 0.0f;
    }];
    
    if (scrollView.contentOffset.y < 0.0f) {
        
        [UIView animateWithDuration:0.3f animations:^{
            
            _weekInformationView.transform = CGAffineTransformMakeTranslation(0.0f, 120.0f);
        }];
        
        
        
    }
    else if (scrollView.contentOffset.y > 0.0f) {
        
        NSDate *date = [NSDate date];
        NSCalendar *calendar = [NSCalendar currentCalendar];
        calendar.locale = [NSLocale systemLocale];
        
        NSDateComponents *comp = [calendar components:NSUIntegerMax fromDate:date];
        
        NSNumber *mNum = [NSNumber numberWithFloat:scrollView.contentOffset.y];
        
        comp.hour += (comp.minute + [mNum intValue]) / 60;
        comp.minute = (comp.minute + [mNum intValue]) % 60;
        
        NSDate *nextDate = [calendar dateFromComponents:comp];
        
        _watchView.date = nextDate;
        
        
        NSArray *timeDateArray = [[self convertStringFromDate:nextDate] componentsSeparatedByString:@"/"];
        _screenView.information = [NSDictionary dictionaryWithObjectsAndKeys:[timeDateArray objectAtIndex:0], @"time", [timeDateArray objectAtIndex:1], @"date", @"맑음", @"status", @"29°", @"degree", @"현재 위치 - 대한민국", @"location", nil];
    }
    else    {
        
        [UIView animateWithDuration:0.4f animations:^{
            
            _weekInformationView.transform = CGAffineTransformMakeTranslation(0.0f, 0.0f);
        }];
    }
}


@end
