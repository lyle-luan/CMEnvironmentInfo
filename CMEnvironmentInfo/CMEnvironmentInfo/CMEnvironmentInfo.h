//
//  CMEnvironmentInfo.h
//  CMEnvironmentInfo
//
//  Created by Aaron on 10/29/14.
//  Copyright (c) 2014 Aaron. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

typedef enum _CM_IOS_VERSION
{
    CM_IOS_VERSION_10 = 0,
    CM_IOS_VERSION_101,
    CM_IOS_VERSION_102,
    CM_IOS_VERSION_11,
    CM_IOS_VERSION_111,
    CM_IOS_VERSION_112,
    CM_IOS_VERSION_113,
    CM_IOS_VERSION_114,
    CM_IOS_VERSION_115,
    CM_IOS_VERSION_20,
    CM_IOS_VERSION_201,
    CM_IOS_VERSION_202,
    CM_IOS_VERSION_21,
    CM_IOS_VERSION_211,
    CM_IOS_VERSION_22,
    CM_IOS_VERSION_221,
    CM_IOS_VERSION_30,
    CM_IOS_VERSION_301,
    CM_IOS_VERSION_31,
    CM_IOS_VERSION_312,
    CM_IOS_VERSION_313,
    CM_IOS_VERSION_32,
    CM_IOS_VERSION_321,
    CM_IOS_VERSION_40,
    CM_IOS_VERSION_401,
    CM_IOS_VERSION_41,
    CM_IOS_VERSION_421,
    CM_IOS_VERSION_425,
    CM_IOS_VERSION_426,
    CM_IOS_VERSION_427,
    CM_IOS_VERSION_429,
    CM_IOS_VERSION_43,
    CM_IOS_VERSION_431,
    CM_IOS_VERSION_432,
    CM_IOS_VERSION_433,
    CM_IOS_VERSION_434,
    CM_IOS_VERSION_435,
    CM_IOS_VERSION_44,
    CM_IOS_VERSION_441,
    CM_IOS_VERSION_442,
    CM_IOS_VERSION_443,
    CM_IOS_VERSION_444,
    CM_IOS_VERSION_50,
    CM_IOS_VERSION_501,
    CM_IOS_VERSION_51,
    CM_IOS_VERSION_511,
    CM_IOS_VERSION_60,
    CM_IOS_VERSION_601,
    CM_IOS_VERSION_602,
    CM_IOS_VERSION_61,
    CM_IOS_VERSION_611,
    CM_IOS_VERSION_612,
    CM_IOS_VERSION_613,
    CM_IOS_VERSION_614,
    CM_IOS_VERSION_615,
    CM_IOS_VERSION_616,
    CM_IOS_VERSION_70,
    CM_IOS_VERSION_71,
    CM_IOS_VERSION_711,
    CM_IOS_VERSION_712,
    CM_IOS_VERSION_NEWER,
}CM_IOS_VERSION;

typedef enum _CM_IPAD_OR_IPHONE
{
    CM_IPAD = 0,
    CM_IPHONE,
    CM_UNKOWN,
}CM_IPAD_OR_IPHONE;

extern NSString * const CM_KEY_APP_VERSION_CACHE;
extern NSString * const CM_KEY_APP_VERSION_NOT_DISCTURB;
extern NSString * const CM_KEY_APP_VERSION_CACHE_TIMESTAMP;

@interface CMEnvironmentInfo : NSObject

@property (readonly, nonatomic) CM_IOS_VERSION iOSVersion;

@property (readonly, nonatomic) NSString *currentAppVersion;
@property (readonly, nonatomic) NSString *currentAppBuildVersion;
@property (readonly, nonatomic) NSString *currentAppName;

@property (readonly, nonatomic) BOOL needUpdate;

@property (readonly, nonatomic) NSString *cryptKey;

@property (readonly, nonatomic) CGFloat deviceWidth;
@property (readonly, nonatomic) CGFloat deviceHeight;
@property (readonly, nonatomic) CGRect  deviceFrame;
@property (readonly, nonatomic) CGFloat deviceStatusBarHeight;
@property (readonly, nonatomic) CGFloat deviceNavigationBarHeight;
@property (readonly, nonatomic) CGFloat deviceTabBarHeight;
@property (readonly, nonatomic) CGFloat tableViewPadding;

@property (readonly, nonatomic) BOOL isRetina;

@property (readonly, nonatomic) UIDeviceOrientation deviceOrientation;

@property (readonly, nonatomic) CM_IPAD_OR_IPHONE iPadOriPhone;

+ (CMEnvironmentInfo *)getInstance;

@end
