//
//  TemplateViewController.m
//  JXWKnowledgeManager
//
//  Created by Creolophus on 1/14/15.
//  Copyright (c) 2015 Creolophus. All rights reserved.
//

#import "IMVTemplateViewController.h"


@interface IMVTemplateViewController ()

@property (strong, nonatomic) UIView *networkErrorView;
@property (strong, nonatomic) UIView *emptyView;
@property (strong, nonatomic) UILabel *emptyLabel;

@end

@implementation IMVTemplateViewController

- (UIColor *)backgroudColor
{
    if (!_backgroudColor) {
        _backgroudColor = [UIColor whiteColor];
    }
    return _backgroudColor;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = self.backgroudColor;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIView *)networkErrorView
{
    if (!_networkErrorView) {

        _networkErrorView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
        _networkErrorView.backgroundColor = self.backgroudColor;
        [self.view addSubview:_networkErrorView];
        
        UIImageView *networkBrokenImgView = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenWidth/2.0-116.0/2, 90, 116, 82)];
        networkBrokenImgView.image = [UIImage imageNamed:@"network_broken"];
        [_networkErrorView addSubview:networkBrokenImgView];
        
        UILabel *networkErrorLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 200, ScreenWidth, 20)];
        networkErrorLabel.text = @"加载失败";
        networkErrorLabel.textColor = [UIColor colorWithWhite:50.0/255 alpha:1.0];
        networkErrorLabel.font = [UIFont systemFontOfSize:18.0f];
#if __IPHONE_OS_VERSION_MIN_REQUIRED < 60000
        networkErrorLabel.textAlignment = UITextAlignmentCenter;
#else
        networkErrorLabel.textAlignment = NSTextAlignmentCenter;
#endif
        networkErrorLabel.backgroundColor = [UIColor clearColor];
        [_networkErrorView addSubview:networkErrorLabel];
        
        UILabel *tryAgainLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 230, ScreenWidth, 20)];
        tryAgainLabel.textColor = [UIColor colorWithWhite:120.0/255 alpha:1.0];
        tryAgainLabel.text = @"请检查您的手机是否联网，点击按钮重新加载";
        tryAgainLabel.font = [UIFont systemFontOfSize:14.0];
#if __IPHONE_OS_VERSION_MIN_REQUIRED < 60000
        tryAgainLabel.textAlignment = UITextAlignmentCenter;
#else
        tryAgainLabel.textAlignment = NSTextAlignmentCenter;
#endif
        tryAgainLabel.backgroundColor = [UIColor clearColor];
        [_networkErrorView addSubview:tryAgainLabel];
        
        UIButton *tryAgainButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [tryAgainButton setFrame:CGRectMake(ScreenWidth/2-60, 300, 120, 40)];
        [tryAgainButton setTitle:@"重新加载" forState:UIControlStateNormal];
        [tryAgainButton setTitleColor:[UIColor colorWithWhite:120.0/255 alpha:1.0] forState:UIControlStateNormal];
        [tryAgainButton setBackgroundImage:[[UIImage imageNamed:@"input_holdon_normal"] stretchableImageWithLeftCapWidth:10 topCapHeight:10] forState:UIControlStateNormal];
        [tryAgainButton setBackgroundImage:[[UIImage imageNamed:@"input_holdon_press"] stretchableImageWithLeftCapWidth:10 topCapHeight:10] forState:UIControlStateHighlighted];
        [tryAgainButton addTarget:self action:@selector(loadDataAgain) forControlEvents:UIControlEventTouchUpInside];
        [_networkErrorView addSubview:tryAgainButton];
    }
    return _networkErrorView;
}

- (UIView *)emptyView
{
    if (!_emptyView) {
        

        _emptyView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
        _emptyView.backgroundColor = self.backgroudColor;
        [self.view addSubview:_emptyView];
        
        UIImageView *emptyImgView = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenWidth/2.0-45.0/2, 125, 45, 45)];
        emptyImgView.image = [UIImage imageNamed:@"empty_icon"];
        [_emptyView addSubview:emptyImgView];
        
        _emptyLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 200, ScreenWidth, 20)];
        _emptyLabel.textColor = [UIColor colorWithRed:191.0/255 green:191.0/255 blue:171.0/255 alpha:1.0];
        _emptyLabel.font = [UIFont systemFontOfSize:18.0f];
#if __IPHONE_OS_VERSION_MIN_REQUIRED < 60000
        _emptyLabel.textAlignment = UITextAlignmentCenter;
#else
        _emptyLabel.textAlignment = NSTextAlignmentCenter;
#endif
        _emptyLabel.backgroundColor = [UIColor clearColor];
        [_emptyView addSubview:_emptyLabel];
    }
    return _emptyView;
}

- (void)showEmptyViewWithFrame:(CGRect)frame status:(NSString *)status
{
    [self.emptyView setFrame:frame];
    self.emptyView.hidden = NO;
    self.networkErrorView.hidden = YES;
    self.emptyLabel.text = status;
    [self.view bringSubviewToFront:self.emptyView];
}

- (void)hideEmptyView
{
    self.emptyView.hidden = YES;
}


- (void)showNetworkErrorWithFrame:(CGRect)frame
{
    [self.networkErrorView setFrame:frame];
    self.networkErrorView.hidden = NO;
    [self.view bringSubviewToFront:self.networkErrorView];
}

- (void)hideNetworkErrorView
{
    self.networkErrorView.hidden = YES;
}

- (void)loadDataAgain
{
    
}


#pragma mark - AutorotateInterfaceOrientation
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return NO;
}

- (BOOL)shouldAutorotate
{
    return NO;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
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
