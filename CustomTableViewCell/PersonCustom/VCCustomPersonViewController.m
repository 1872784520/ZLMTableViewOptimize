//
//  VCCustomPersonViewController.m
//  TestOne
//
//  Created by Apple on 2018/8/30.
//  Copyright © 2018年 ruanmeng. All rights reserved.
//

#import "VCCustomPersonViewController.h"
#import "TestTableViewCell.h"

@interface VCCustomPersonViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    UIImageView *_headImage;
}
@end

@implementation VCCustomPersonViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView.backgroundColor = RedColor;
    
}
- (void)initData
{
    self.dataArr = @[@[@"",@"",@""],@[@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@""],@[@"",@"",@"",]];
}




#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //NSLog(@"%ld",self.dataArr.count);
    
    
    return self.dataArr.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.dataArr[section] count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    
    return [self newRecommedSchoolTableViewCell:indexPath];
    
}
#pragma mark - UITableView头部
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *viewHead = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 10)];
    viewHead.backgroundColor = RGB(244, 244, 244);
    
    return viewHead;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}
#pragma mark - UITableView底部
-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *viewHead = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 0.1)];
    viewHead.backgroundColor = RGB(244, 244, 244);

    return viewHead;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}
#pragma mark - UITableView返回cell
//学校
-(UITableViewCell*)newRecommedSchoolTableViewCell:(NSIndexPath*)indexPath
{
    
    static NSString * const kCellIdentifier = @"TestTableViewCell";
    TestTableViewCell *cell=[self.tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    if (!cell) {
        
        cell=[[[NSBundle mainBundle] loadNibNamed:@"TestTableViewCell" owner:self options:nil] lastObject];
        
    }
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    if (indexPath.section == 0 && indexPath.row == 0) {
        cell.isHead = YES;
        _headImage = cell.headImage;
    }
    
    [cell createTestTableViewCell];
    
    return cell;
}

#pragma mark - UITableView返回cell行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row == 0) {
        return 70;
    }
    return 50;
}

#pragma mark - UITableView选中
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row == 0) {
        
        [self selectHeaderImage];
        
    }
}











#pragma mark - 选择头像
-(void)selectHeaderImage
{
    //@"选取照片"
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    //取消
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        //NSLog(@"取消");
    }]];
    //调用相机
    __weak typeof(self) weakSelf = self;
    //@"从摄像头选择"
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [weakSelf openCamera];
    }]];
    //调用相册
    //@"从照片库选择"
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [weakSelf openLibary];
    }]];
    //模态跳转
    [self presentViewController:actionSheet animated:YES completion:nil];
    
}
- (void)openCamera{
    //打开系统相机
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:picker animated:YES completion:nil];
    }
}
- (void)openLibary{
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]){
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        
        picker.navigationBar.tintColor = [UIColor whiteColor];
        picker.navigationBar.barTintColor = RGB(162, 144, 255);
        
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:picker animated:YES completion:nil];
    }
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    /*
     UIImagePickerControllerEditedImage 取景框
     UIImagePickerControllerOriginalImage 原始图片
     */
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    
    
    if ([info objectForKey:UIImagePickerControllerReferenceURL]) {
        
        //NSLog(@"我是相册");
        
    }else{
        //NSLog(@"我是照相机");
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
    }
    [self dismissViewControllerAnimated:YES completion:nil];
    
    _headImage.image = image;
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
















