//
//  LoadingTipsTextView.m
//  TestOne
//
//  Created by Apple on 2018/8/28.
//  Copyright © 2018年 ruanmeng. All rights reserved.
//

#import "LoadingTipsTextView.h"


static LoadingTipsTextView *loading = nil;

@implementation LoadingTipsTextView

+ (LoadingTipsTextView *)shareSingleton {
    if (!loading) {
        //以0，0，0，0的状态初始化
        //只有在展示的时候才能确定展示区域的大小
        loading = [[LoadingTipsTextView alloc] initWithFrame:CGRectZero];
        loading.backgroundColor = [UIColor clearColor];
        //loading.alpha=0.2;
    }
    return loading;
}

+ (void)showLoadingTipsTextText:(NSString *)labelText {
    if (!loading) {
        loading = [LoadingTipsTextView shareSingleton];
    }
    loading.autoresizesSubviews = YES;
    
    CGFloat width = [loading textHeightFromTextString:labelText width:ScreenWidth-20 fontSize:16];
    [loading setFrame:CGRectMake(0, 0, width+20 , 40)];
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    loading.center = window.center;
    
    [window addSubview:loading];
    [window bringSubviewToFront:loading];
    
    [loading showViewLableText:labelText];
    
    
    //__weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:1 animations:^{
        //NSLog(@"111");
        [loading setYOffset:loading.frame.origin.y+1];
        
    } completion:^(BOOL finished) {
        //NSLog(@"444");
        [loading removeFromSuperview];
    }];
}
+ (void)showLoadingTipsTextText:(NSString *)labelText UIview:(UIView*)view
{
    if (!loading) {
        loading = [LoadingTipsTextView shareSingleton];
    }
    loading.autoresizesSubviews = YES;
    
    CGFloat width = [loading textHeightFromTextString:labelText width:ScreenWidth-20 fontSize:16];
    [loading setFrame:CGRectMake(0, 0, width+20 , 40)];
    
    
    loading.center = view.center;
    
    [view addSubview:loading];
    [view bringSubviewToFront:loading];
    
    [loading showViewLableText:labelText];
    
    
    //__weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:1 animations:^{
        //NSLog(@"111");
        [loading setYOffset:loading.frame.origin.y+1];
        
    } completion:^(BOOL finished) {
        //NSLog(@"444");
        [loading removeFromSuperview];
    }];
}
- (void)showViewLableText:(NSString*)text
{
    _alertLabel.text=text;
    [_alertLabel setFrame:loading.frame];
    [_alertLabel setXOffset:0];
    [_alertLabel setYOffset:0];
    
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
    //创建提示语标签
    [self createLabel];
}

- (void)createLabel {
    
    _alertLabel = [[UILabel alloc] init];
    _alertLabel.backgroundColor = [UIColor blackColor];//RGBA(0, 0, 0, 0.5);
    _alertLabel.textAlignment = NSTextAlignmentCenter;
    _alertLabel.textColor = [UIColor whiteColor];
    _alertLabel.font = [UIFont systemFontOfSize:16];
    //_alertLabel.center = self.center;
    _alertLabel.layer.cornerRadius = 10.f;
    _alertLabel.layer.masksToBounds = YES;
    _alertLabel.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    
    
    [self addSubview:_alertLabel];
}





//根据字符串的实际内容的多少 在固定的宽度和字体的大小，动态的计算出实际的高度
- (CGFloat)textHeightFromTextString:(NSString *)text width:(CGFloat)textWidth fontSize:(CGFloat)size{
    
    //iOS7之后
    /*
     第一个参数: 预设空间 宽度固定  高度预设 一个最大值
     第二个参数: 行间距
     第三个参数: 属性字典 可以设置字体大小
     */
    //xxxxxxxxxxxxxxxxxx
    //ghjdgkfgsfgskdgfjk
    //sdhgfsdjkhgfjd
    
    NSDictionary *dict = @{NSFontAttributeName:[UIFont systemFontOfSize:size]};
    CGRect rect = [text boundingRectWithSize:CGSizeMake(textWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine attributes:dict context:nil];
    //
    return rect.size.width;
    
    
}

@end
