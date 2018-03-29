//
//  SwpCoordinatesUtils.m
//  swp_song
//
//  Created by swp_song on 2018/3/29.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "SwpCoordinatesUtils.h"

#define swp_coordinate_utils_inline __inline__ __attribute__((always_inline))

@implementation SwpCoordinatesUtils

/**
 *  @author swp_song
 *
 *  @brief  SwpCoordinateMake   ( 快速初始化 )
 *
 *  @param  latitude    latitude
 *
 *  @param  longitude   longitude
 *
 *  @return SwpCoordinates
 */
SwpCoordinates SwpCoordinateMake(SwpCoordinatesDegrees latitude, SwpCoordinatesDegrees longitude) {
    SwpCoordinates swpCoordinates = {latitude, longitude};
    return swpCoordinates;
}

/**
 *  @author swp_song
 *
 *  @brief  swpCoordinateWhetherInInChina:longitude:    ( 验证坐标是否在中国 )
 *
 *  @param  latitude    latitude
 *
 *  @param  longitude   longitude
 *
 *  @return BOOL         YES = in In China, NO = Not In China
 */
+ (BOOL)swpCoordinateWhetherInInChina:(SwpCoordinatesDegrees)latitude longitude:(SwpCoordinatesDegrees)longitude {
    return SwpCoordinateWhetherInInChina(latitude, longitude);
}


/**
 *  @author swp_song
 *
 *  @brief  SwpCoordinateWhetherInInChina   ( 验证坐标是否在中国 )
 *
 *  @param  latitude    latitude
 *
 *  @param  longitude   longitude
 *
 *  @return BOOL        YES = in In China, NO = Not In China
 */
BOOL SwpCoordinateWhetherInInChina(SwpCoordinatesDegrees latitude, SwpCoordinatesDegrees longitude) {
    // not in China
    if (longitude < 72.004 || longitude > 137.8347 || latitude < 0.8293 || latitude > 55.8271) return NO;
    return YES;
}

#pragma mark - GCJ-02 <火星坐标系> <----> BD-09 <百度坐标系>

/**
 *  @author swp_song
 *
 *  @brief  swpCoordinateGCJ02TransformBD09:longitude:  ( GCJ-02 <火星坐标系> -> BD-09 <百度坐标系> )
 *
 *  @param  latitude    latitude
 *
 *  @param  longitude   longitude
 *
 *  @return SwpCoordinates
 */
+ (SwpCoordinates)swpCoordinateUtilsGCJ02ToBD09:(SwpCoordinatesDegrees)latitude longitude:(SwpCoordinatesDegrees)longitude {
    return SwpCoordinateUtilsGCJ02ToBD09(latitude, longitude);
}

/**
 *  @author swp_song
 *
 *  @brief  SwpCoordinateUtilsGCJ02ToBD09   ( GCJ-02 <火星坐标系> -> BD-09 <百度坐标系> )
 *
 *  @param  latitude    latitude
 *
 *  @param  longitude   longitude
 *
 *  @return SwpCoordinates
 */
SwpCoordinates SwpCoordinateUtilsGCJ02ToBD09(SwpCoordinatesDegrees latitude, SwpCoordinatesDegrees longitude) {
    SwpCoordinatesDegrees x     = longitude;
    SwpCoordinatesDegrees y     = latitude;
    SwpCoordinatesDegrees z     = sqrt(x * x + y * y) + 0.00002 * sin(y * M_PI);
    SwpCoordinatesDegrees theta = atan2(y, x) + 0.000003 * cos(x * M_PI);
    return SwpCoordinateMake(z * sin(theta) + 0.006, z * cos(theta) + 0.0065);
}


/**
 *  @author swp_song
 *
 *  @brief  swpCoordinateUtilsBD09ToGCJ02:longitude:    ( BD-09 <百度坐标系> -> GCJ-02 <火星坐标系> )
 *
 *  @param  latitude    latitude
 *
 *  @param  longitude   longitude
 *
 *  @return SwpCoordinates
 */
+ (SwpCoordinates)swpCoordinateUtilsBD09ToGCJ02:(SwpCoordinatesDegrees)latitude longitude:(SwpCoordinatesDegrees)longitude {
    return SwpCoordinateUtilsBD09ToGCJ02(latitude, longitude);
}

/**
 *  @author swp_song
 *
 *  @brief  SwpCoordinateUtilsBD09ToGCJ02   ( BD-09 <百度坐标系> -> GCJ-02 <火星坐标系> )
 *
 *  @param  latitude    latitude
 *
 *  @param  longitude   longitude
 *
 *  @return SwpCoordinates
 */
SwpCoordinates SwpCoordinateUtilsBD09ToGCJ02(SwpCoordinatesDegrees latitude, SwpCoordinatesDegrees longitude) {
    SwpCoordinatesDegrees x     = longitude - 0.0065;
    SwpCoordinatesDegrees y     = latitude  - 0.006;
    SwpCoordinatesDegrees z     = sqrt(x * x + y * y) - 0.00002 * sin(y * M_PI);
    SwpCoordinatesDegrees theta = atan2(y, x) - 0.000003 * cos(x * M_PI);
    return SwpCoordinateMake(z * sin(theta), z * cos(theta));
}

#pragma mark - WGS-84 <国际标准坐标>  <----> GCJ-02 <火星坐标系>

/**
 *  @author swp_song
 *
 *  @brief  swpCoordinateUtilsWGS84ToGCJ02:longitude:   ( WGS-84 <国际标准坐标> -> GCJ-02 <火星坐标系> )
 *
 *  @param  latitude    latitude
 *
 *  @param  longitude   longitude
 *
 *  @return SwpCoordinates
 */
+ (SwpCoordinates)swpCoordinateUtilsWGS84ToGCJ02:(SwpCoordinatesDegrees)latitude longitude:(SwpCoordinatesDegrees)longitude {
    return SwpCoordinateUtilsWGS84ToGCJ02(latitude, longitude);
}

/**
 *  @author swp_song
 *
 *  @brief  SwpCoordinateUtilsWGS84ToGCJ02  ( WGS-84 <国际标准坐标> -> GCJ-02 <火星坐标系> )
 *
 *  @param  latitude    latitude
 *
 *  @param  longitude   longitude
 *
 *  @return SwpCoordinates
 */
SwpCoordinates SwpCoordinateUtilsWGS84ToGCJ02(SwpCoordinatesDegrees latitude, SwpCoordinatesDegrees longitude) {
    
    if (!SwpCoordinateWhetherInInChina(latitude, longitude)) return SwpCoordinateMake(latitude, longitude);
    
    static const double SWP_AA = 6378245.0;
    static const double SWP_EE = 0.00669342162296594323;
    
    SwpCoordinatesDegrees wgLat    = latitude;
    SwpCoordinatesDegrees wgLon    = longitude;
    SwpCoordinatesDegrees dLat     = TransformLatitude(wgLon - 105.0, wgLat - 35.0);
    SwpCoordinatesDegrees dLon     = TransformLongitude(wgLon - 105.0, wgLat - 35.0);
    SwpCoordinatesDegrees radLat   = wgLat / 180.0 * M_PI;
    SwpCoordinatesDegrees magic    = sin(radLat);
    magic               = 1 - SWP_EE * magic * magic;
    double sqrtMagic    = sqrt(magic);
    dLat = (dLat * 180.0) / ((SWP_AA * (1 - SWP_EE)) / (magic * sqrtMagic) * M_PI);
    dLon = (dLon * 180.0) / (SWP_AA / sqrtMagic * cos(radLat) * M_PI);
    return SwpCoordinateMake(wgLat + dLat, wgLon + dLon);
}

/**
 *  @author swp_song
 *
 *  @brief  swpCoordinateUtilsGCJ02ToWGS84:longitude:   ( GCJ-02 <火星坐标系> -> WGS-84 <国际标准坐标> )
 *
 *  @param  latitude    latitude
 *
 *  @param  longitude   longitude
 *
 *  @return SwpCoordinates
 */
+ (SwpCoordinates)swpCoordinateUtilsGCJ02ToWGS84:(SwpCoordinatesDegrees)latitude longitude:(SwpCoordinatesDegrees)longitude {
    return SwpCoordinateUtilsGCJ02ToWGS84(latitude, longitude);
}


/**
 *  @author swp_song
 *
 *  @brief  SwpCoordinateUtilsGCJ02ToWGS84  ( GCJ-02 <火星坐标系> -> WGS-84 <国际标准坐标> )
 *
 *  @param  latitude    latitude
 *
 *  @param  longitude   longitude
 *
 *  @return SwpCoordinates
 */
SwpCoordinates SwpCoordinateUtilsGCJ02ToWGS84(SwpCoordinatesDegrees latitude, SwpCoordinatesDegrees longitude) {
    if (!SwpCoordinateWhetherInInChina(latitude, longitude)) return SwpCoordinateMake(latitude, longitude);
    SwpCoordinates GCJ02 = SwpCoordinateUtilsWGS84ToGCJ02(latitude, longitude);
    return SwpCoordinateMake(latitude * 2 - GCJ02.latitude,  longitude * 2 - GCJ02.longitude);
}

#pragma mark - WGS-84 <国际标准坐标> <----> BD-09 <百度坐标系>
/**
 *  @author swp_song
 *
 *  @brief  swpCoordinateUtilsBD09ToWGS84:longitude:    ( BD-09 <百度坐标系> -> WGS-84 <国际标准坐标> )
 *
 *  @param  latitude    latitude
 *
 *  @param  longitude   longitude
 *
 *  @return SwpCoordinates
 */
+ (SwpCoordinates)swpCoordinateUtilsBD09ToWGS84:(SwpCoordinatesDegrees)latitude longitude:(SwpCoordinatesDegrees)longitude {
    return SwpCoordinateUtilsBD09ToWGS84(latitude, longitude);
}


/**
 *  @author swp_song
 *
 *  @brief  SwpCoordinateUtilsBD09ToWGS84   ( BD-09 <百度坐标系> -> WGS-84 <国际标准坐标> )
 *
 *  @param  latitude    latitude
 *
 *  @param  longitude   longitude
 *
 *  @return SwpCoordinates
 */
SwpCoordinates SwpCoordinateUtilsBD09ToWGS84(SwpCoordinatesDegrees latitude, SwpCoordinatesDegrees longitude) {
    //  1.Transform GCJ02
    SwpCoordinates GCJ02 = SwpCoordinateUtilsBD09ToGCJ02(latitude, longitude);
    //  2.GCJ02 Transform WGS84
    return SwpCoordinateUtilsGCJ02ToWGS84(GCJ02.latitude, GCJ02.longitude);
}


/**
 *  @author swp_song
 *
 *  @brief  swpCoordinateUtilsWGS84ToBD09:longitude:    ( BD-09 <百度坐标系> -> WGS-84 <国际标准坐标> )
 *
 *  @param  latitude    latitude
 *
 *  @param  longitude   longitude
 *
 *  @return SwpCoordinates
 */
+ (SwpCoordinates)swpCoordinateUtilsWGS84ToBD09:(SwpCoordinatesDegrees)latitude longitude:(SwpCoordinatesDegrees)longitude {
    return SwpCoordinateUtilsWGS84ToBD09(latitude, longitude);
}


/**
 *  @author swp_song
 *
 *  @brief  SwpCoordinateUtilsWGS84ToBD09   ( BD-09 <百度坐标系> -> WGS-84 <国际标准坐标> )
 *
 *  @param  latitude    latitude
 *
 *  @param  longitude   longitude
 *
 *  @return SwpCoordinates
 */
SwpCoordinates SwpCoordinateUtilsWGS84ToBD09(SwpCoordinatesDegrees latitude, SwpCoordinatesDegrees longitude) {
    //  1.Transform GCJ02
    SwpCoordinates GCJ02 = SwpCoordinateUtilsWGS84ToGCJ02(latitude, longitude);
    //  2.GCJ02 Transform BD09
    return SwpCoordinateUtilsGCJ02ToBD09(GCJ02.latitude, GCJ02.longitude);
}




#pragma mark - Private Methods
/**
 *  @author swp_song
 *
 *  @brief  TransformLatitude:  ( 坐标转换 )
 *
 *  @param  x   x
 *
 *  @param  y   y
 *
 *  @return SwpLocationDegrees2D
 */
static swp_coordinate_utils_inline double TransformLatitude(double x, double y) {
    
    static const double SWP_M_PI = M_PI * 3000.00 / 180.00;
    double ret = -100.0 + 2.0 * x + 3.0 * y + 0.2 * y * y + 0.1 * x * y + 0.2 * sqrt(fabs(x));
    ret += (20.0 * sin(6.0 * x * SWP_M_PI) + 20.0 * sin(2.0 * x * SWP_M_PI)) * 2.0 / 3.0;
    ret += (20.0 * sin(y * SWP_M_PI) + 40.0 * sin(y / 3.0 * SWP_M_PI)) * 2.0 / 3.0;
    ret += (160.0 * sin(y / 12.0 * SWP_M_PI) + 320 * sin(y * SWP_M_PI / 30.0)) * 2.0 / 3.0;
    return ret;
}

/**
 *  @author swp_song
 *
 *  @brief  TransformLongitude: ( 坐标转换 )
 *
 *  @param  x   x
 *
 *  @param  y   y
 *
 *  @return SwpLocationDegrees2D
 */
static swp_coordinate_utils_inline double TransformLongitude(double x, double y) {
    
    static const double SWP_M_PI = M_PI * 3000.00 / 180.00;
    double ret = 300.0 + x + 2.0 * y + 0.1 * x * x + 0.1 * x * y + 0.1 * sqrt(fabs(x));
    ret += (20.0 * sin(6.0 * x * SWP_M_PI) + 20.0 * sin(2.0 * x * SWP_M_PI)) * 2.0 / 3.0;
    ret += (20.0 * sin(x * SWP_M_PI) + 40.0 * sin(x / 3.0 * SWP_M_PI)) * 2.0 / 3.0;
    ret += (150.0 * sin(x / 12.0 * SWP_M_PI) + 300.0 * sin(x / 30.0 * SWP_M_PI)) * 2.0 / 3.0;
    return ret;
}




@end
