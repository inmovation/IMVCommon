//
//  SFTabBarController.m
//  TCA
//
//  Created by shaohua.chen on 14-4-4.
//  Copyright (c) 2014年 shaohua.chen. All rights reserved.
//

#import "IMVTabBarController.h"
#import "IMVTabBarItem.h"

@interface IMVTabBarController ()

@end

@implementation IMVTabBarController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _barTintColor = [UIColor whiteColor];
        _tintColor = [UIColor colorWithRed:238.0/255 green:238.0/255 blue:244.0/255 alpha:1.0];
        _itemNormalTitleColor = [UIColor colorWithRed:238.0/255 green:238.0/255 blue:244.0/255 alpha:1.0];
        _itemSelectedTitleColor = [UIColor colorWithRed:0.0/255 green:133.0/255 blue:85.0/255 alpha:1.0];
        _translucent = YES;
        
        if ([UIDevice currentDevice].systemVersion.floatValue>=7.0) {
            [self.tabBar setBarTintColor:self.barTintColor];
            [self.tabBar setTintColor:self.tintColor];
            self.tabBar.translucent = self.translucent;
        }else {
            [self.tabBar setTintColor:self.barTintColor];
        }
        
        [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:self.itemSelectedTitleColor, NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
        [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:self.itemNormalTitleColor, NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    }
    return self;
}

- (void)setBarBackgroundImage:(UIImage *)barBackgroundImage
{
    [self.tabBar setBackgroundImage:barBackgroundImage];
}

- (void)setBarTintColor:(UIColor *)barTintColor
{
    _barTintColor = barTintColor;
    if ([UIDevice currentDevice].systemVersion.floatValue>=7.0) {
        [self.tabBar setTintColor:self.tintColor];
    }else {
        [self.tabBar setTintColor:self.barTintColor];
    }
}

- (void)setTintColor:(UIColor *)tintColor
{
    _tintColor = tintColor;
    if ([UIDevice currentDevice].systemVersion.floatValue>=7.0) {
        [self.tabBar setTintColor:self.tintColor];
    }
}

- (void)setItemNormalTitleColor:(UIColor *)itemNormalTitleColor
{
    _itemNormalTitleColor = itemNormalTitleColor;
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:self.itemNormalTitleColor, NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
}

- (void)setItemSelectedTitleColor:(UIColor *)itemSelectedTitleColor
{
    _itemSelectedTitleColor = itemSelectedTitleColor;
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:self.itemSelectedTitleColor, NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
}

- (void)setTranslucent:(BOOL)translucent
{
    _translucent = translucent;
    if ([UIDevice currentDevice].systemVersion.floatValue>=7.0) {
        self.tabBar.translucent = _translucent;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setViewControllers:(NSArray *)viewControllers itemTitles:(NSArray *)itemTitles itemNormalImages:(NSArray *)normalImages itemSelectedImages:(NSArray *)selectedImages
{
    self.viewControllers = viewControllers;
    for (int i = 0; i < self.viewControllers.count; i++) {
        UIViewController *vc = [self.viewControllers objectAtIndex:i];
        IMVTabBarItem *tabBarItem = [[IMVTabBarItem alloc] init];
        tabBarItem.title = [itemTitles objectAtIndex:i];
        tabBarItem.normalImage = [UIImage imageNamed:[normalImages objectAtIndex:i]];
        tabBarItem.highlightedImage = [UIImage imageNamed:[selectedImages objectAtIndex:i]];
        vc.tabBarItem = tabBarItem;
    }
}


#pragma mark orientation
- (BOOL)shouldAutorotate
{
    return self.selectedViewController.shouldAutorotate;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return self.selectedViewController.supportedInterfaceOrientations;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return self.selectedViewController.shouldAutorotate;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
