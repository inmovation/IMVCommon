//
//  ViewController2.m
//  IMVCommon
//
//  Created by 陈少华 on 15/6/17.
//  Copyright (c) 2015年 inmovation. All rights reserved.
//

#import "ViewController2.h"
#import "IMVCommon.h"

@interface ViewController2 () <IMVTabBarInjection, IMVNavigationInjection>

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark IMVTabBarControllerInjection
- (void)inject
{
    self.navigationItem.title = @"消息";
}
- (NSString *)tabTitle
{
    return @"消息";
}
- (NSString *)tabNormalImage
{
    return @"settingNormal";
}
- (NSString *)tabSelectedImage
{
    return @"settingSelected";
}

- (NSInteger)tabIndex
{
    return 1;
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
