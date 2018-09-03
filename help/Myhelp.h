//
//  Myhelp.h
//  TestOne
//
//  Created by Apple on 2018/8/28.
//  Copyright © 2018年 ruanmeng. All rights reserved.
//

#ifndef Myhelp_h
#define Myhelp_h

#define CODE(__code) [__code isEqualToString:@"1"]

//44是一个特殊的常量，默认行高和NavigationBar的高度为44
#define Default 44
//距离左边边距为10
#define LeftDistance 10
//控件间的距离
#define ControlDistance 20

//状态栏度
#define SstatusHeight [[UIApplication sharedApplication] statusBarFrame].size.height
#define SNavHeight (SstatusHeight+Default)

//屏幕宽度
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
//屏幕高度
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

#define UISreenWidthScale   ScreenWidth/320.0  //以iphone5 屏幕为基准
#define UIScale(x)   x*UISreenWidthScale
#define Scale ([[UIScreen mainScreen] bounds].size.height > 480)?[[UIScreen mainScreen] bounds].size.height / 568.0:1.0

//安全释放宏
#define Release_Safe(_control) [_control release], _control = nil;
//传入RGBA四个参数，得到颜色
//美工和设计通过PS给出的色值是0~255
//苹果的RGB参数给出的是0~1
//那我们就让美工给出的 参数/255 得到一个0-1之间的数
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
//传入RGB三个参数，得到颜色
#define RGB(r,g,b) RGBA(r,g,b,1.f)
//取得随机颜色
#define RandomColor RGB(arc4random()%256,arc4random()%256,arc4random()%256)

#pragma mark - SystemColor
#define BlackColor [UIColor blackColor]
#define WhiteColor [UIColor whiteColor]
#define RedColor [UIColor redColor]
#define BlueColor [UIColor blueColor]
#define OrangeColor [UIColor orangeColor]
#define LightGrayColor [UIColor lightGrayColor]
#define LightTextColor [UIColor lightTextColor]
#define ClearColor [UIColor clearColor]

#define LightBackGroundColor RGB(244, 244, 244)
#define LightBackGroundColorLine RGB(240, 239, 243)
#define MainColor RGB(162, 144, 255)

//判断机型是否为iphonex
#define KIsiPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
#define KIPhoneXStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
#define KStatusBarHeightNo [[UIApplication sharedApplication] statusBarFrame].size.height + 44

#ifdef DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr, "%s:%zd\t%s\n", [[[NSString stringWithUTF8String: __FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat: FORMAT, ## __VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif

//字体适配
#define DefaultFont(__scale) [UIFont systemFontOfSize:13*__scale]
#define SmallFont(__scale) [UIFont systemFontOfSize:12*__scale]
#define BoldSmallFont(__scale) [UIFont fontWithName:@"Helvetica-Bold" size:12*__scale]
#define BoldSmall11Font(__scale) [UIFont fontWithName:@"Helvetica-Bold" size:11*__scale]
#define Small10Font(__scale) [UIFont systemFontOfSize:10*__scale];
#define BigFont(__scale) [UIFont fontWithName:@"Helvetica-Bold" size:14*__scale]

#define Big15Font(__scale) [UIFont systemFontOfSize:15*__scale]

#define Big16Font(__scale) [UIFont systemFontOfSize:16*__scale]

#define Big17Font(__scale) [UIFont systemFontOfSize:17*__scale]
#define Big17BoldFont(__scale) [UIFont fontWithName:@"Helvetica-Bold" size:17*__scale]

#define SBigFont(__scale) [UIFont systemFontOfSize:18*__scale];







#endif /* Myhelp_h */
