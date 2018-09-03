//
//  LoadingAlertView.m
//  MaiJiangDianzi
//
//  Created by 123 on 16/4/27.
//  Copyright © 2016年 maijiang. All rights reserved.
//

#import "LoadingAlertView.h"

#import "UIView+Addition.h"
#import "Factory.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

static LoadingAlertView *loading = nil;

@implementation LoadingAlertView

+ (LoadingAlertView *)shareSingleton {
    if (!loading) {
        //以0，0，0，0的状态初始化
        //只有在展示的时候才能确定展示区域的大小
        loading = [[LoadingAlertView alloc] initWithFrame:CGRectZero];
        loading.backgroundColor = [UIColor clearColor];
        //loading.alpha=0.2;
    }
    return loading;
}

+ (void)showLoadingAlertView {
    if (!loading) {
        loading = [LoadingAlertView shareSingleton];
    }
    loading.autoresizesSubviews = YES;
    //NSLog(@"%f",superView.frame.size.height);
    //loading.frame = superView.frame;
    [loading setFrame:CGRectMake(0, 0,ScreenWidth , ScreenHeight)];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    loading.center = window.center;
    [window addSubview:loading];
    [window bringSubviewToFront:loading];
    
    [loading showView];
    
}

+ (void)showLoadingAlertView:(UIView *)superView {
    if (!loading) {
        loading = [LoadingAlertView shareSingleton];
    }
    loading.autoresizesSubviews = YES;
    //NSLog(@"%f",superView.frame.size.height);
    //loading.frame = superView.frame;
    [loading setFrame:CGRectMake(0, 0,ScreenWidth , ScreenHeight)];
    
    [superView addSubview:loading];
    [superView bringSubviewToFront:loading];
    [loading showView];
    
}
+ (void)showLoadingAlertViewTwo:(UIView *)superView {
    if (!loading) {
        loading = [LoadingAlertView shareSingleton];
    }
    loading.autoresizesSubviews = YES;
    //NSLog(@"%f",superView.frame.size.height);
    //loading.frame = superView.frame;
    [loading setFrame:CGRectMake(0, 64,ScreenWidth , ScreenHeight-64)];
    
    [superView addSubview:loading];
    [superView bringSubviewToFront:loading];
    [loading showView];
    
}

+ (void)showLoadingAlertViewNoScreen {
    if (!loading) {
        loading = [LoadingAlertView shareSingleton];
    }
    loading.autoresizesSubviews = YES;
    //NSLog(@"%f",superView.frame.size.height);
    //loading.frame = superView.frame;
    [loading setFrame:CGRectMake(0, 0, 50 , 50)];
    
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    loading.center = window.center;
    [window addSubview:loading];
    [window bringSubviewToFront:loading];
    
    [loading showView];
    
}








+ (void)hideLoadingAlertView {
    [loading hideView];
    [loading removeFromSuperview];
//    [UIView animateWithDuration:0.01 animations:^{
//        [loading setYOffset:loading.superview.height];
//    } completion:^(BOOL finished) {
//        [loading removeFromSuperview];
//    }];
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
    }
    return self;
}

//构建loadingView的视图内容
- (void)createView {
    //创建背景的黑色视图
    [self createBackView];
    //创建菊花
    [self createActivityView];
    //创建提示语标签
    //[self createLabel];
}

- (void)createLabel {
    _alertLabel = [Factory createLabelWithTitle:@"玩命加载中" frame:CGRectMake(0, _activity.bottom, _backView.width, _backView.height - _activity.bottom)];
    _alertLabel.textAlignment = NSTextAlignmentCenter;
    _alertLabel.textColor = [UIColor whiteColor];
    [_backView addSubview:_alertLabel];
}

- (void)createActivityView {
    _activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    //_activity.frame = CGRectMake((_backView.width - _activity.width)/2, (_backView.height - _activity.height)/2 - LeftDistance, _activity.width, _activity.height);
    _activity.frame = CGRectMake(0, 0, 50, 50);

    //_activity.center=_backView.center;
    //当菊花停止时候不隐藏😄
    _activity.hidesWhenStopped = NO;
    [_activity startAnimating];
    [_backView addSubview:_activity];
}

- (void)createBackView {
    _backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    _backView.center = self.center;
    _backView.backgroundColor = RGBA(0, 0, 0, 0.5);
    //加圆角看着好看😄
    _backView.layer.cornerRadius = 3.f;
    _backView.layer.masksToBounds = YES;
    _backView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    [self addSubview:_backView];
}

- (void)hideView {
    [_activity stopAnimating];
    //_alertLabel.text = @"加载完成";
    
}
- (void)showView {
    [_activity startAnimating];
    //_alertLabel.text = @"加载完成";
    
}

@end
