//
//  CMEnvironmentInfo.h
//  CMEnvironmentInfo
//
//  Created by Aaron on 10/29/14.
//  Copyright (c) 2014 Aaron. All rights reserved.
//

#import "CMEnvironmentInfo.h"

NSString * const CM_APP_ID = @"000000000";

NSString * const CM_KEY_APP_VERSION_CACHE = @"CM_KEY_APP_VERSION_CACHE";
NSString * const CM_KEY_APP_VERSION_NOT_DISCTURB = @"CM_KEY_APP_VERSION_NOT_DISCTURB";
NSString * const CM_KEY_APP_VERSION_CACHE_TIMESTAMP = @"CM_KEY_APP_VERSION_CACHE_TIMESTAMP";

const double UPDATE_TIME_INTERVAL = 12*60*60; // 12 hours

@interface CMEnvironmentInfo()

@property (readwrite, nonatomic) CM_IOS_VERSION iOSVersion;
@property (readwrite, nonatomic) NSString *currentAppVersion;
@property (readwrite, nonatomic) NSString *currentAppBuildVersion;
@property (readwrite, nonatomic) NSString *currentAppName;
@property (readwrite, nonatomic) NSString *cryptKey;
@property (readwrite, nonatomic) CGFloat deviceWidth;
@property (readwrite, nonatomic) CGFloat deviceHeight;
@property (readwrite, nonatomic) CGRect deviceFrame;
@property (readwrite, nonatomic) BOOL isRetina;
@property (readwrite, nonatomic) UIDeviceOrientation deviceOrientation;
@property (readwrite, nonatomic) NSString *appVersionCache;
@property (readwrite, nonatomic) BOOL needUpdate;
@property (readwrite, nonatomic) CM_IPAD_OR_IPHONE iPadOriPhone;
@property (readwrite, nonatomic) CGFloat deviceStatusBarHeight;
@property (readwrite, nonatomic) CGFloat deviceNavigationBarHeight;
@property (readwrite, nonatomic) CGFloat deviceTabBarHeight;
@property (readwrite, nonatomic) CGFloat tableViewPadding;

@end

@implementation CMEnvironmentInfo

+ (CMEnvironmentInfo *)getInstance
{
    static CMEnvironmentInfo *cmEnvironmentInfo = nil;
    if (cmEnvironmentInfo == nil)
    {
        cmEnvironmentInfo = [[super allocWithZone:nil] init];
        cmEnvironmentInfo.iOSVersion = [CMEnvironmentInfo currentDeviceiOSVersion];
        
        cmEnvironmentInfo.currentAppVersion = [CMEnvironmentInfo currentAppVersion];
        cmEnvironmentInfo.currentAppBuildVersion = [CMEnvironmentInfo currentAppBuildVersion];
        cmEnvironmentInfo.currentAppName = [CMEnvironmentInfo currentAppName];
        
        cmEnvironmentInfo.cryptKey = [CMEnvironmentInfo currentAppCryptKey];
        
        cmEnvironmentInfo.deviceHeight = [CMEnvironmentInfo currentDeviceHeightWithiOSVersion:cmEnvironmentInfo.iOSVersion];
        cmEnvironmentInfo.deviceWidth = [CMEnvironmentInfo currentDeviceWidthWithiOSVersion:cmEnvironmentInfo.iOSVersion];
        cmEnvironmentInfo.deviceFrame = [CMEnvironmentInfo currentDeviceFrameWithiOSVersion:cmEnvironmentInfo.iOSVersion];
        cmEnvironmentInfo.deviceStatusBarHeight = [CMEnvironmentInfo currentDeviceStatusBarHeight];
        cmEnvironmentInfo.deviceNavigationBarHeight = [CMEnvironmentInfo currentDeviceNavigationBarHeight];
        cmEnvironmentInfo.deviceTabBarHeight = [CMEnvironmentInfo currentDeviceTabBarHeight];
        
        cmEnvironmentInfo.isRetina = [CMEnvironmentInfo currentDeviceIsRetina];
        
        cmEnvironmentInfo.deviceOrientation = [CMEnvironmentInfo currentDeviceOrientation];
        
        cmEnvironmentInfo.appVersionCache = [CMEnvironmentInfo currentAppVersionCache];
        cmEnvironmentInfo.needUpdate = [CMEnvironmentInfo isNeedUpdateWithCurrentAppVersion:cmEnvironmentInfo.currentAppVersion withAppVersionCache:cmEnvironmentInfo.appVersionCache];
        
        cmEnvironmentInfo.iPadOriPhone = [CMEnvironmentInfo currentAppUserInterfaceIdiom];
        
        cmEnvironmentInfo.tableViewPadding = [CMEnvironmentInfo currentDeviceTableViewPaddingWithiOSVersion:cmEnvironmentInfo.iOSVersion withiPadOriPhone:cmEnvironmentInfo.iPadOriPhone];
    }
    
    return cmEnvironmentInfo;
}

+ (id)allocWithZone:(struct _NSZone *)zone
{
    return [self getInstance];
}

+ (CM_IOS_VERSION)currentDeviceiOSVersion
{
    NSString *iOSVersionString = [[UIDevice currentDevice] systemVersion];
    NSDictionary *iOSVersionDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                          [NSNumber numberWithInt:CM_IOS_VERSION_10], @"1.0",
                                          [NSNumber numberWithInt:CM_IOS_VERSION_101],@"1.0.1",
                                          [NSNumber numberWithInt:CM_IOS_VERSION_102],@"1.0.2",
                                          [NSNumber numberWithInt:CM_IOS_VERSION_11], @"1.1",
                                          [NSNumber numberWithInt:CM_IOS_VERSION_111],@"1.1.1",
                                          [NSNumber numberWithInt:CM_IOS_VERSION_112],@"1.1.2",
                                          [NSNumber numberWithInt:CM_IOS_VERSION_113],@"1.1.3",
                                          [NSNumber numberWithInt:CM_IOS_VERSION_114],@"1.1.4",
                                          [NSNumber numberWithInt:CM_IOS_VERSION_115],@"1.1.5",
                                          [NSNumber numberWithInt:CM_IOS_VERSION_20], @"2.0",
                                          [NSNumber numberWithInt:CM_IOS_VERSION_201],@"2.0.1",
                                          [NSNumber numberWithInt:CM_IOS_VERSION_202],@"2.0.2",
                                          [NSNumber numberWithInt:CM_IOS_VERSION_21], @"2.1",
                                          [NSNumber numberWithInt:CM_IOS_VERSION_211],@"2.1.1",
                                          [NSNumber numberWithInt:CM_IOS_VERSION_22], @"2.2",
                                          [NSNumber numberWithInt:CM_IOS_VERSION_221],@"2.2.1",
                                          [NSNumber numberWithInt:CM_IOS_VERSION_30], @"3.0",
                                          [NSNumber numberWithInt:CM_IOS_VERSION_301],@"3.0.1",
                                          [NSNumber numberWithInt:CM_IOS_VERSION_31], @"3.1",
                                          [NSNumber numberWithInt:CM_IOS_VERSION_312],@"3.1.2",
                                          [NSNumber numberWithInt:CM_IOS_VERSION_313],@"3.1.3",
                                          [NSNumber numberWithInt:CM_IOS_VERSION_32], @"3.2",
                                          [NSNumber numberWithInt:CM_IOS_VERSION_321],@"3.2.1",
                                          [NSNumber numberWithInt:CM_IOS_VERSION_40], @"4.0",
                                          [NSNumber numberWithInt:CM_IOS_VERSION_401],@"4.0.1",
                                          [NSNumber numberWithInt:CM_IOS_VERSION_41], @"4.1",
                                          [NSNumber numberWithInt:CM_IOS_VERSION_421],@"4.2.1",
                                          [NSNumber numberWithInt:CM_IOS_VERSION_425],@"4.2.5",
                                          [NSNumber numberWithInt:CM_IOS_VERSION_426],@"4.2.6",
                                          [NSNumber numberWithInt:CM_IOS_VERSION_427],@"4.2.7",
                                          [NSNumber numberWithInt:CM_IOS_VERSION_429],@"4.2.9",
                                          [NSNumber numberWithInt:CM_IOS_VERSION_43], @"4.3",
                                          [NSNumber numberWithInt:CM_IOS_VERSION_431],@"4.3.1",
                                          [NSNumber numberWithInt:CM_IOS_VERSION_432],@"4.3.2",
                                          [NSNumber numberWithInt:CM_IOS_VERSION_433],@"4.3.3",
                                          [NSNumber numberWithInt:CM_IOS_VERSION_434],@"4.3.4",
                                          [NSNumber numberWithInt:CM_IOS_VERSION_435],@"4.3.5",
                                          [NSNumber numberWithInt:CM_IOS_VERSION_44], @"4.4",
                                          [NSNumber numberWithInt:CM_IOS_VERSION_441],@"4.4.1",
                                          [NSNumber numberWithInt:CM_IOS_VERSION_442],@"4.4.2",
                                          [NSNumber numberWithInt:CM_IOS_VERSION_443],@"4.4.3",
                                          [NSNumber numberWithInt:CM_IOS_VERSION_444],@"4.4.4",
                                          [NSNumber numberWithInt:CM_IOS_VERSION_50], @"5.0",
                                          [NSNumber numberWithInt:CM_IOS_VERSION_501],@"5.0.1",
                                          [NSNumber numberWithInt:CM_IOS_VERSION_51], @"5.1",
                                          [NSNumber numberWithInt:CM_IOS_VERSION_511],@"5.1.1",
                                          [NSNumber numberWithInt:CM_IOS_VERSION_60], @"6.0",
                                          [NSNumber numberWithInt:CM_IOS_VERSION_601],@"6.0.1",
                                          [NSNumber numberWithInt:CM_IOS_VERSION_602],@"6.0.2",
                                          [NSNumber numberWithInt:CM_IOS_VERSION_61], @"6.1",
                                          [NSNumber numberWithInt:CM_IOS_VERSION_611],@"6.1.1",
                                          [NSNumber numberWithInt:CM_IOS_VERSION_612],@"6.1.2",
                                          [NSNumber numberWithInt:CM_IOS_VERSION_613],@"6.1.3",
                                          [NSNumber numberWithInt:CM_IOS_VERSION_614],@"6.1.4",
                                          [NSNumber numberWithInt:CM_IOS_VERSION_615],@"6.1.5",
                                          [NSNumber numberWithInt:CM_IOS_VERSION_616],@"6.1.6",
                                          [NSNumber numberWithInt:CM_IOS_VERSION_70], @"7.0",
                                          [NSNumber numberWithInt:CM_IOS_VERSION_71], @"7.1",
                                          [NSNumber numberWithInt:CM_IOS_VERSION_711],@"7.1.1",
                                          [NSNumber numberWithInt:CM_IOS_VERSION_712],@"7.1.2",
                                          nil];
    NSNumber *iOSVersionNumber = [iOSVersionDictionary valueForKey:iOSVersionString];
    if (iOSVersionNumber != nil)
    {
        return (CM_IOS_VERSION)(iOSVersionNumber.integerValue);
    }
    else
    {
        return CM_IOS_VERSION_NEWER;
    }
}

+ (NSString *)currentAppVersion
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

+ (NSString *)currentAppBuildVersion
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
}

+ (NSString *)currentAppName
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"];
}

+ (NSString *)currentAppCryptKey
{
    return [NSString stringWithFormat:@"%@SOME_KEY", [UIDevice currentDevice].identifierForVendor.UUIDString];
}

+ (CGFloat)currentDeviceHeightWithiOSVersion:(CM_IOS_VERSION)iOSVersion
{
    if (iOSVersion >= CM_IOS_VERSION_70)
    {
        return [UIScreen mainScreen].bounds.size.height;
    }
    else
    {
        return [UIScreen mainScreen].applicationFrame.size.height;
    }
}

+ (CGFloat)currentDeviceWidthWithiOSVersion:(CM_IOS_VERSION)iOSVersion
{
    if (iOSVersion >= CM_IOS_VERSION_70)
    {
        return [UIScreen mainScreen].bounds.size.width;
    }
    else
    {
        return [UIScreen mainScreen].applicationFrame.size.width;
    }
}

+ (CGRect)currentDeviceFrameWithiOSVersion:(CM_IOS_VERSION)iOSVersion
{
    if (iOSVersion >= CM_IOS_VERSION_70)
    {
        return [UIScreen mainScreen].bounds;
    }
    else
    {
        CGRect frame = [UIScreen mainScreen].applicationFrame;
        frame.origin.y = 0.0f;
        return frame;
    }
}

+ (CGFloat)currentDeviceStatusBarHeight
{
    return [UIScreen mainScreen].applicationFrame.origin.y;
}

+ (CGFloat)currentDeviceNavigationBarHeight
{
    return 44.0f;
}

+ (CGFloat)currentDeviceTabBarHeight
{
    return 49.0f;
}

+ (BOOL)currentDeviceIsRetina
{
    return [UIScreen mainScreen].scale == 2 ? (YES):(NO);
}

+ (UIDeviceOrientation)currentDeviceOrientation
{
    return [UIDevice currentDevice].orientation;
}

+ (NSString *)currentAppVersionCache
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:CM_KEY_APP_VERSION_CACHE];
}

+ (BOOL)isNeedUpdateWithCurrentAppVersion:(NSString *)currentAppVersion withAppVersionCache:(NSString *)appVersionCache
{
    if ([currentAppVersion compare:appVersionCache] == NSOrderedAscending)
    {
        if ([appVersionCache compare:[[NSUserDefaults standardUserDefaults] objectForKey:CM_KEY_APP_VERSION_NOT_DISCTURB]] != NSOrderedSame)
        {
            return YES;
        }
    }
    
    if (([[NSDate date] timeIntervalSince1970] - [[[NSUserDefaults standardUserDefaults] objectForKey:CM_KEY_APP_VERSION_CACHE_TIMESTAMP] doubleValue]) > UPDATE_TIME_INTERVAL)
    {
        [CMEnvironmentInfo checkUpdateWithCurrentAppVersion:currentAppVersion];
    }
    return NO;
}

- (BOOL)needUpdate
{
    NSString *currentAppVersion = [CMEnvironmentInfo getInstance].currentAppVersion;
    NSString *appVersionCache = [CMEnvironmentInfo getInstance].appVersionCache;
    
    if ([currentAppVersion compare:appVersionCache] == NSOrderedAscending)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

+ (void)checkUpdateWithCurrentAppVersion: (NSString *)currentAppVersion
{
    NSString *urlStr = [NSString stringWithFormat:@"http://itunes.apple.com/lookup?id=%@", CM_APP_ID];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:urlStr]];
    [request setHTTPMethod:@"POST"];
    
    [NSURLConnection sendAsynchronousRequest:(NSURLRequest *)request queue:[NSOperationQueue currentQueue] completionHandler:^(NSURLResponse* r, NSData *recervedData, NSError *error){
        NSString *results = [[NSString alloc] initWithBytes:[recervedData bytes] length:[recervedData length] encoding:NSUTF8StringEncoding];
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:[results dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:&error];
        NSArray *resultInfo = [dic objectForKey:@"results"];
        NSDictionary *releaseInfo = resultInfo.firstObject;
        NSString *lastestVersion = [releaseInfo objectForKey:@"version"];
        
        
        [[NSUserDefaults standardUserDefaults] setObject:lastestVersion forKey:CM_KEY_APP_VERSION_CACHE];
        [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%f" ,[[NSDate date] timeIntervalSince1970]] forKey: CM_KEY_APP_VERSION_CACHE_TIMESTAMP];
    }];
}

+ (CM_IPAD_OR_IPHONE)currentAppUserInterfaceIdiom
{
    if([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone)
    {
        return CM_IPHONE;
    }
    else if([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad)
    {
        return CM_IPAD;
    }
    else
    {
        return CM_UNKOWN;
    }
}

+ (CGFloat)currentDeviceTableViewPaddingWithiOSVersion: (CM_IOS_VERSION)iOSVersion withiPadOriPhone: (CM_IPAD_OR_IPHONE)iPadOriPhone
{
    if ((iOSVersion >= CM_IOS_VERSION_60) &&
        (iOSVersion < CM_IOS_VERSION_70))
    {
        if (iPadOriPhone == CM_IPAD)
        {
            return 45.0f;
        }
    }
    return 0.0f;
}

@end
