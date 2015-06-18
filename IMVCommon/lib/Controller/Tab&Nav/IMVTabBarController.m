//
//  IMVTabBarController.m
//  IMVCommon
//
//  Created by shaohua.chen on 14-4-4.
//  Copyright (c) 2014年 shaohua.chen. All rights reserved.
//

#import "IMVThemeManager.h"
#import "UIColor+IMVCommon.h"
#import "UIFont+IMVCommon.h"
#import "UIImage+IMVCommon.h"

#import "IMVTabBarController.h"
#import "IMVTabBarItem.h"
#import "IMVNavigationController.h"
#import "IMVInjectionContext.h"

@interface IMVTabBarController ()

@end

@implementation IMVTabBarController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}



- (void)initTheme
{
    if ([UIDevice currentDevice].systemVersion.floatValue>=7.0) {
        self.tabBar.barTintColor = [UIColor colorForTabBarBarTint];
        self.tabBar.tintColor = [UIColor colorForTabBarTint];
    }else {
        self.tabBar.tintColor = [UIColor colorForTabBarBarTint];
    }
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED < 60000
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorForTabBarItemTitleSelected], UITextAttributeTextColor, nil] forState:UIControlStateSelected];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorForTabBarItemTitleNormal], UITextAttributeTextColor, nil] forState:UIControlStateNormal];
#else
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorForTabBarItemTitleSelected], NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorForTabBarItemTitleNormal], NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
#endif
    
    UIImage *bgImage = [UIImage imageForTabBarBackground];
    if (bgImage) {
        self.tabBar.backgroundImage = bgImage;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initTheme];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(initTheme) name:IMVNotificationThemeChanged object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)setViewControllers:(NSArray *)viewControllers itemTitles:(NSArray *)itemTitles itemNormalImages:(NSArray *)normalImages itemSelectedImages:(NSArray *)selectedImages
{
    self.viewControllers = viewControllers;
    for (int i = 0; i < self.viewControllers.count; i++) {
        UIViewController *vc = [self.viewControllers objectAtIndex:i];
        IMVTabBarItem *tabBarItem = [[IMVTabBarItem alloc] init];
        tabBarItem.title = [itemTitles objectAtIndex:i];
        tabBarItem.normalImage = [UIImage imageForName:[normalImages objectAtIndex:i]];
        tabBarItem.highlightedImage = [UIImage imageForName:[selectedImages objectAtIndex:i]];
        vc.tabBarItem = tabBarItem;
    }
}


#pragma mark - IMVInjection
- (void)inject
{
    NSArray *tabInjectors = [[IMVInjectionContext sharedInstence] getInjectorsWithInjection:@protocol(IMVTabBarInjection)];
    NSMutableArray *vcs = [NSMutableArray arrayWithCapacity:tabInjectors.count];
    NSMutableArray *titles = [NSMutableArray arrayWithCapacity:tabInjectors.count];
    NSMutableArray *normalImages = [NSMutableArray arrayWithCapacity:tabInjectors.count];
    NSMutableArray *selectedImages = [NSMutableArray arrayWithCapacity:tabInjectors.count];

    [tabInjectors enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:[UIViewController class]]) {
            
            UIViewController *vc = obj;
            NSString *title = [obj respondsToSelector:@selector(tabTitle)]?[obj tabTitle]:@"";
            NSString *normalImage = [obj respondsToSelector:@selector(tabNormalImage)]?[obj tabNormalImage]:@"";
            NSString *selectedImage = [obj respondsToSelector:@selector(tabSelectedImage)]?[obj tabSelectedImage]:@"";
            NSInteger index = [obj respondsToSelector:@selector(tabIndex)]?[obj tabIndex]:0;

            if ([obj conformsToProtocol:@protocol(IMVNavigationInjection)]) {
                IMVNavigationController *navi = [[IMVNavigationController alloc] initWithRootViewController:vc];
                vc = navi;

            }
            if (idx == 0) {
                [vcs addObject:vc];
                [titles addObject:title];
                [normalImages addObject:normalImage];
                [selectedImages addObject:selectedImage];
            }
            else
            {
                for (int i=0; i<vcs.count; i++) { //根据tabIndex将ViewController排序
                    id vcTemp = [vcs objectAtIndex:i];
                    if ([vcTemp isKindOfClass:[UINavigationController class]]) {
                        vcTemp = [[vcTemp viewControllers] firstObject];
                    }
                    if ([vcTemp tabIndex]>index) {
                        [vcs insertObject:vc atIndex:i];
                        [titles insertObject:title atIndex:i];
                        [normalImages insertObject:normalImage atIndex:i];
                        [selectedImages insertObject:selectedImage atIndex:i];
                        break;
                    }
                    if (i==vcs.count-1) {
                        [vcs addObject:vc];
                        [titles addObject:title];
                        [normalImages addObject:normalImage];
                        [selectedImages addObject:selectedImage];
                        break;
                    }
                }
            }
        }
        else
        {
            NSLog(@"%@ can't inject %@, only support UIViewController", obj, @protocol(IMVTabBarInjection));
        }
    }];
    
    [self setViewControllers:vcs itemTitles:titles itemNormalImages:normalImages itemSelectedImages:selectedImages];
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
