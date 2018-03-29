//
//  ViewController.m
//  SwpCoordinatesUtilsDemo
//
//  Created by swp_song on 2018/3/29.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "ViewController.h"

#import <SwpCoordinatesUtils/SwpCoordinatesUtils.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    
    // http://lbs.amap.com/console/show/picker              高德
    // http://api.map.baidu.com/lbsapi/getpoint/index.html  百度
    {
        SwpCoordinates GCJ02_0  = SwpCoordinateUtilsBD09ToGCJ02(39.91512, 116.403967);
        NSLog(@"%f,%f", GCJ02_0.longitude, GCJ02_0.latitude);
        SwpCoordinates BD09_0   = SwpCoordinateUtilsGCJ02ToBD09(GCJ02_0.latitude, GCJ02_0.longitude);
        NSLog(@"%f,%f", BD09_0.longitude, BD09_0.latitude);
    }
    
    {
        //  定位地点是北京天安门，定位转换会出现误差
        SwpCoordinates   GCJ020Meta = SwpCoordinateMake(39.908725, 116.397516);
        NSLog(@"GCJ020Meta  : %lf,%lf", GCJ020Meta.longitude, GCJ020Meta.latitude);
        SwpCoordinates  WGS84_1     = SwpCoordinateUtilsGCJ02ToWGS84(GCJ020Meta.latitude, GCJ020Meta.longitude);
        NSLog(@"WGS840_1    : %f,%f", WGS84_1.longitude, WGS84_1.latitude);
        SwpCoordinates  GCJ020_1    = SwpCoordinateUtilsWGS84ToGCJ02(WGS84_1.latitude, WGS84_1.longitude);
        NSLog(@"GCJ020_1    : %f,%f", GCJ020_1.longitude, GCJ020_1.latitude);
        SwpCoordinates  BD090_1     = SwpCoordinateUtilsGCJ02ToBD09(GCJ020_1.latitude, GCJ020_1.longitude);
        NSLog(@"BD090_1     : %f,%f", BD090_1.longitude, BD090_1.latitude);
        SwpCoordinates  WGS84_2     = SwpCoordinateUtilsBD09ToWGS84(BD090_1.latitude, BD090_1.longitude);
        NSLog(@"WGS84_2     : %f,%f", WGS84_2.longitude, WGS84_2.latitude);
        SwpCoordinates  BD09_2      = SwpCoordinateUtilsWGS84ToBD09(WGS84_2.latitude, WGS84_2.longitude);
        NSLog(@"BD09_2      : %f,%f", BD09_2.longitude, BD09_2.latitude);
    }
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
