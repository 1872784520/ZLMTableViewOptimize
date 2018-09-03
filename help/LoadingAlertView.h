//
//  LoadingAlertView.h
//  MaiJiangDianzi
//
//  Created by 123 on 16/4/27.
//  Copyright © 2016年 maijiang. All rights reserved.
//
//中心显示
#import <UIKit/UIKit.h>

@interface LoadingAlertView : UIView
{
    
    //黑色的背景
    UIView *_backView;
    //提示语
    UILabel *_alertLabel;
}

//你懂的
@property (nonatomic,strong) UIActivityIndicatorView *activity;


//初始化
+ (LoadingAlertView *)shareSingleton;
//召唤loading页
+ (void)showLoadingAlertView;
+ (void)showLoadingAlertView:(UIView*)superView;
+ (void)showLoadingAlertViewTwo:(UIView *)superView;
+ (void)showLoadingAlertViewNoScreen;


//隐藏
+ (void)hideLoadingAlertView;


@end
