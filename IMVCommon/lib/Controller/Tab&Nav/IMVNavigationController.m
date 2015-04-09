//
//  SFNavigationController.m
//  TCA
//
//  Created by shaohua.chen on 14-4-4.
//  Copyright (c) 2014年 shaohua.chen. All rights reserved.
//

#import "IMVNavigationController.h"

@interface IMVNavigationController ()

@end

@implementation IMVNavigationController
@synthesize barTintColor = _barTintColor;
@synthesize tintColor = _tintColor;
@synthesize titleColor = _titleColor;
@synthesize titleFont = _titleFont;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        _barTintColor = [UIColor colorWithRed:0.0/255 green:133.0/255 blue:85.0/255 alpha:1.0];
        _tintColor = [UIColor whiteColor];
        _titleColor = [UIColor colorWithWhite:255.0/255 alpha:1.0];
        _titleFont = [UIFont systemFontOfSize:20.0];
        _translucent = YES;
        self.navigationBar.translucent = self.translucent;
        
        if ([UIDevice currentDevice].systemVersion.floatValue>=7.0) {
            [self.navigationBar setBarTintColor:self.barTintColor];
            [self.navigationBar setTintColor:self.tintColor];
        }else {
            [self.navigationBar setTintColor:self.barTintColor];
        }
        
        NSDictionary *textAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                        self.titleColor, UITextAttributeTextColor,
                                        self.titleFont, UITextAttributeFont,
                                        nil];
        self.navigationBar.titleTextAttributes = textAttributes;
    }
    return self;
}

- (void)setTranslucent:(BOOL)translucent
{
    _translucent = translucent;
    self.navigationBar.translucent = self.translucent;
}

- (void)setTintColor:(UIColor *)tintColor
{
    _tintColor = tintColor;
    if ([UIDevice currentDevice].systemVersion.floatValue>=7.0) {
        [self.navigationBar setTintColor:self.tintColor];
    }else {
        [self.navigationBar setTintColor:self.barTintColor];
    }
}

- (void)setBarTintColor:(UIColor *)barTintColor
{
    _barTintColor = barTintColor;
    if ([UIDevice currentDevice].systemVersion.floatValue>=7.0) {
        [self.navigationBar setBarTintColor:self.barTintColor];
    }
}

- (void)setTitleColor:(UIColor *)titleColor
{
    _titleColor = titleColor;
    NSDictionary *textAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                    self.titleColor, UITextAttributeTextColor,
                                    self.titleFont, UITextAttributeFont,
                                    nil];
    [self.navigationBar setTitleTextAttributes:textAttributes];
}

- (void)setTitleFont:(UIFont *)titleFont
{
    _titleFont = titleFont;
    NSDictionary *textAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                    self.titleColor, UITextAttributeTextColor,
                                    self.titleFont, UITextAttributeFont,
                                    nil];
    [self.navigationBar setTitleTextAttributes:textAttributes];
}

- (void)setBarBackgroundImage:(UIImage *)barBackgroundImage
{
    [self.navigationBar setBackgroundImage:barBackgroundImage forBarMetrics:UIBarMetricsDefault];
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

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return [self.topViewController shouldAutorotateToInterfaceOrientation:toInterfaceOrientation];
}

- (BOOL)shouldAutorotate
{
    return self.topViewController.shouldAutorotate;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return self.topViewController.supportedInterfaceOrientations;
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
