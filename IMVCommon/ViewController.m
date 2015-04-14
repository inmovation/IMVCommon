//
//  ViewController.m
//  IMVCommon
//
//  Created by 陈少华 on 15/4/8.
//  Copyright (c) 2015年 inmovation. All rights reserved.
//

#import "ViewController.h"
#import "IMVTemplateViewController+Hints.h"
#import "IMVCommon.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *table;
@property (strong, nonatomic) NSArray *icons;
@property (strong, nonatomic) NSArray *titles;
@property (strong, nonatomic) NSArray *values;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationItem.title = @"设置";
    
    _icons = @[@[@"default_user"], @[@"me_icon_about"]];
    _titles = @[@[@"张三"], @[@"设置"]];
    _values = @[@[@"0000003"], @[@""]];
    
    _table = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _table.delegate = self;
    _table.dataSource = self;
    [self.view addSubview:_table];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _titles.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[_titles objectAtIndex:section] count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 80.0;
    }
    else
    {
        return 44.0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"cellId";
    static NSString *logoutCellId = @"logoutCellId";
    static NSString *userCellId = @"userCellId";
    
    NSString *icon = [[_icons objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    NSString *title = [[_titles objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    NSString *value = [[_values objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    
    UITableViewCell *cell = nil;
    if (indexPath.section == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:userCellId];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:userCellId];
            cell.textLabel.textColor = [UIColor colorForTextTitle];
            cell.textLabel.font = [UIFont fontForTextTitle];
            cell.detailTextLabel.textColor = [UIColor colorForTextDetail];
            cell.detailTextLabel.font = [UIFont fontForTextDetail];
        }
        
        cell.imageView.image = [UIImage imageForName:icon];
        cell.textLabel.text = title;
        cell.detailTextLabel.text = value;
    }
    else if (indexPath.section == 2)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:logoutCellId];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:logoutCellId];
            cell.textLabel.textColor = [UIColor colorForTextTitle];
            cell.textLabel.font = [UIFont fontForTextTitle];
            cell.textLabel.textAlignment = UITextAlignmentCenter;
        }
        
        cell.textLabel.text = title;
    }
    else
    {
        cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
            cell.textLabel.textColor = [UIColor colorForTextTitle];
            cell.textLabel.font = [UIFont fontForTextTitle];
            cell.detailTextLabel.textColor = [UIColor colorForTextDetail];
            cell.detailTextLabel.font = [UIFont fontForTextDetail];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        
        cell.imageView.image = [UIImage imageForName:icon];
        cell.textLabel.text = title;
    }
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 1)
    {
        if (indexPath.row == 0) {
            [self hideEmptyView];
        }
    }
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            [self showEmptyViewWithFrame:self.view.bounds status:@"点击设置取消"];
        }
    }
}

@end
