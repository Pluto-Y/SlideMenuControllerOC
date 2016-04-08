//
//  LeftViewController.m
//  SlideMenuControllerOC
//
//  Created by ChipSea on 16/2/27.
//  Copyright © 2016年 pluto-y. All rights reserved.
//

#import "LeftViewController.h"
#import "SwiftViewController.h"
#import "GoViewController.h"
#import "JavaViewController.h"
#import "NonMenuController.h"
#import "BaseTableViewCell.h"

@implementation LeftViewController

-(void)viewDidLoad {
    _menus = @[@"Main", @"Swift", @"Java", @"Go", @"NonMenu"];
    self.tableView.separatorColor = [UIColor colorWithRed:224/255.0 green:224/255.0 blue:224/255.0 alpha:1];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SwiftViewController *swiftViewController = (SwiftViewController *)[storyboard  instantiateViewControllerWithIdentifier:@"SwiftViewController"];
    self.swiftViewController = [[UINavigationController alloc] initWithRootViewController: swiftViewController];
    
    JavaViewController *javaViewController = (JavaViewController *)[storyboard  instantiateViewControllerWithIdentifier:@"JavaViewController"];
    self.javaViewController = [[UINavigationController alloc] initWithRootViewController: javaViewController];
    
    GoViewController *goViewController = (GoViewController *)[storyboard  instantiateViewControllerWithIdentifier:@"GoViewController"];
    self.goViewController = [[UINavigationController alloc] initWithRootViewController: goViewController];
    
    NonMenuController *nonMenuViewController = (NonMenuController *)[storyboard  instantiateViewControllerWithIdentifier:@"NonMenuController"];
    nonMenuViewController.delegate = self;
    self.nonMenuViewController = [[UINavigationController alloc] initWithRootViewController: nonMenuViewController];
    
    [_tableView registerCellClass:[BaseTableViewCell class]];
    
    self.imageHeaderView = (ImageHeaderView *)[ImageHeaderView loadNib];
    [self.view addSubview:self.imageHeaderView];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.imageHeaderView.frame = CGRectMake(0, 0, self.view.frame.size.width, 160);
    [self.view layoutIfNeeded];
}

-(void)changeViewController:(LeftMenu) menu {
    switch (menu) {
        case LeftMenuMain:
            [self.slideMenuController changeMainViewController:self.mainViewControler close:YES];
            break;
        case LeftMenuSwift:
            [self.slideMenuController changeMainViewController:self.swiftViewController close:YES];
            break;
        case LeftMenuJava:
            [self.slideMenuController changeMainViewController:self.javaViewController close:YES];
            break;
        case LeftMenuGo:
            [self.slideMenuController changeMainViewController:self.goViewController close:YES];
            break;
        case LeftMenuNonMenu:
            [self.slideMenuController changeMainViewController:self.nonMenuViewController close:YES];
            break;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return  [BaseTableViewCell height];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _menus.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BaseTableViewCell *cell = [[BaseTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:[BaseTableViewCell identifier]];
    [cell setData:_menus[indexPath.row]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self changeViewController:indexPath.row];
}

@end
