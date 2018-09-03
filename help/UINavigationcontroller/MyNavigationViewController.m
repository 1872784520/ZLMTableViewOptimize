//
//  MyNavigationViewController.m
//  MaiJiangDianzi
//
//  Created by 123 on 15/11/4.
//  Copyright © 2015年 maijiang. All rights reserved.
//

#import "MyNavigationViewController.h"


@interface MyNavigationViewController ()

@end

@implementation MyNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationBar setBarTintColor:[UIColor colorWithRed:162/255.0 green:144/255.0 blue:255/255.0 alpha:1]];
    //[self.navigationBar setBackgroundColor:[UIColor redColor]];
    
    
    //父视图设置有效
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    //导航背景2@2x.png
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"导航背景2@2x.png"] forBarMetrics:UIBarMetricsDefault];
    
    
    
    //[self customUINavigationBar];
    
    
    
    // Do any additional setup after loading the view.
}



//- (UIStatusBarStyle)preferredStatusBarStyle
//{
//    return UIStatusBarStyleLightContent;
//}
//- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation
//{
//    return UIStatusBarAnimationSlide;
//}



////遵循协议拦截导航返回事件 <UINavigationBarDelegate>
//- (BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPopItem:(UINavigationItem *)item
//{
//    NSLog(@"拦截了s");
//
//    [self popViewControllerAnimated:true];
//
//    return YES;
//}









#pragma mark - 自定义的UINavigationBar
-(void)customUINavigationBar
{
    
    self.navigationBarHidden = YES;
//    self.nav = [[UINavigationBar alloc]initWithFrame:CGRectMake(0,0,self.view.frame.size.width,77)];
//
//    //self.nav.hidden = YES;
//    [self.nav setBarTintColor:[UIColor colorWithRed:162/255.0 green:144/255.0 blue:255/255.0 alpha:1]];
//    [self.view addSubview:self.nav];
//
    
    
}




//-(BOOL)shouldAutorotate
//{
//    
//    if ([self.topViewController respondsToSelector:@selector(shouldAutorotate)]) {
//        return [self.topViewController shouldAutorotate];
//    }
//    return NO;
//}
//
//
//
//-(UIInterfaceOrientationMask)supportedInterfaceOrientations
//{
//    if ([self.topViewController respondsToSelector:@selector(supportedInterfaceOrientations)]) {
//        return [self.topViewController supportedInterfaceOrientations];
//    }
//    
//    return [super supportedInterfaceOrientations];
//}
//
//- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
//    if ([self.topViewController respondsToSelector:@selector(preferredInterfaceOrientationForPresentation)]) {
//        return [self.topViewController preferredInterfaceOrientationForPresentation];
//    }
//    return [super preferredInterfaceOrientationForPresentation];
//}








- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
