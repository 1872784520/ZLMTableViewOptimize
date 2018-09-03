//
//  LoadingTipsTextView.h
//  TestOne
//
//  Created by Apple on 2018/8/28.
//  Copyright © 2018年 ruanmeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoadingTipsTextView : UIView
{
    //提示语
    UILabel *_alertLabel;
}

//初始化
+ (LoadingTipsTextView *)shareSingleton;
//召唤loading页
+ (void)showLoadingTipsTextText:(NSString *)labelText;

+ (void)showLoadingTipsTextText:(NSString *)labelText UIview:(UIView*)view;


@end
