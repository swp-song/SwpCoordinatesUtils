//
//  SwpCoordinatesUtils.h
//  swp_song
//
//  Created by swp_song on 2018/3/29.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import <Foundation/Foundation.h>



NS_ASSUME_NONNULL_BEGIN

/** 定义 定位 数据变量 */
typedef double  SwpCoordinatesDegrees;

/**
 - latitude
 - longitude
 */
struct SwpCoordinates {
    SwpCoordinatesDegrees latitude;
    SwpCoordinatesDegrees longitude;
};

typedef struct SwpCoordinates SwpCoordinates;

@interface SwpCoordinatesUtils : NSObject

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
SwpCoordinates SwpCoordinateMake(SwpCoordinatesDegrees latitude, SwpCoordinatesDegrees longitude);

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
+ (BOOL)swpCoordinateWhetherInInChina:(SwpCoordinatesDegrees)latitude longitude:(SwpCoordinatesDegrees)longitude;


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
BOOL SwpCoordinateWhetherInInChina(SwpCoordinatesDegrees latitude, SwpCoordinatesDegrees longitude);

#pragma mark - GCJ-02 <火星坐标系> <----> BD-09 <百度坐标系>

/**
 *  @author swp_song
 *
 *  @brief  swpCoordinateUtilsGCJ02ToBD09:longitude:    ( GCJ-02 <火星坐标系> -> BD-09 <百度坐标系> )
 *
 *  @param  latitude    latitude
 *
 *  @param  longitude   longitude
 *
 *  @return SwpCoordinates
 */
+ (SwpCoordinates)swpCoordinateUtilsGCJ02ToBD09:(SwpCoordinatesDegrees)latitude longitude:(SwpCoordinatesDegrees)longitude;

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
SwpCoordinates SwpCoordinateUtilsGCJ02ToBD09(SwpCoordinatesDegrees latitude, SwpCoordinatesDegrees longitude);

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
+ (SwpCoordinates)swpCoordinateUtilsBD09ToGCJ02:(SwpCoordinatesDegrees)latitude longitude:(SwpCoordinatesDegrees)longitude;

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
SwpCoordinates SwpCoordinateUtilsBD09ToGCJ02(SwpCoordinatesDegrees latitude, SwpCoordinatesDegrees longitude);

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
+ (SwpCoordinates)swpCoordinateUtilsWGS84ToGCJ02:(SwpCoordinatesDegrees)latitude longitude:(SwpCoordinatesDegrees)longitude;

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
SwpCoordinates SwpCoordinateUtilsWGS84ToGCJ02(SwpCoordinatesDegrees latitude, SwpCoordinatesDegrees longitude);


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
+ (SwpCoordinates)swpCoordinateUtilsGCJ02ToWGS84:(SwpCoordinatesDegrees)latitude longitude:(SwpCoordinatesDegrees)longitude;

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
SwpCoordinates SwpCoordinateUtilsGCJ02ToWGS84(SwpCoordinatesDegrees latitude, SwpCoordinatesDegrees longitude);


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
+ (SwpCoordinates)swpCoordinateUtilsBD09ToWGS84:(SwpCoordinatesDegrees)latitude longitude:(SwpCoordinatesDegrees)longitude;
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
SwpCoordinates SwpCoordinateUtilsBD09ToWGS84(SwpCoordinatesDegrees latitude, SwpCoordinatesDegrees longitude);

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
+ (SwpCoordinates)swpCoordinateUtilsWGS84ToBD09:(SwpCoordinatesDegrees)latitude longitude:(SwpCoordinatesDegrees)longitude;

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
SwpCoordinates SwpCoordinateUtilsWGS84ToBD09(SwpCoordinatesDegrees latitude, SwpCoordinatesDegrees longitude);



@end
NS_ASSUME_NONNULL_END
