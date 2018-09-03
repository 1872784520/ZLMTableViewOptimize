//
//  OneViewController.m
//  ZLMTableViewOptimize
//
//  Created by Apple on 2018/9/3.
//  Copyright © 2018年 ruanmeng. All rights reserved.
//

#import "OneViewController.h"
#import "VCCustomPersonViewController.h"
#import "MomentViewController.h"


@interface OneViewController ()

@end

@implementation OneViewController
- (IBAction)personUI:(id)sender {
    
    CGFloat hhhhh = ScreenHeight-SNavHeight;
    VCCustomPersonViewController *vc = [[VCCustomPersonViewController alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, hhhhh) style:UITableViewStyleGrouped];
    vc.title = @"个人中心";
    [self.navigationController pushViewController:vc animated:YES];
    
    
}


- (IBAction)tableViewImage:(id)sender {
    
    CGFloat hhhhh = ScreenHeight-SNavHeight;
    MomentViewController *vc = [[MomentViewController alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, hhhhh) style:UITableViewStylePlain];
    vc.title = @"朋友圈";
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

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
