//
//  TemplateViewController.m
//  JXWKnowledgeManager
//
//  Created by Creolophus on 1/14/15.
//  Copyright (c) 2015 Creolophus. All rights reserved.
//

#import "IMVTemplateViewController.h"

@implementation IMVTemplateViewController

- (void)initTheme
{
    self.view.backgroundColor = [UIColor colorForViewBackgroud];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorForViewBackgroud];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(initTheme) name:IMVNotificationThemeChanged object:nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
