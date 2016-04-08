//
//  MainViewController.m
//  SlideMenuControllerOC
//
//  Created by ChipSea on 16/2/27.
//  Copyright © 2016年 pluto-y. All rights reserved.
//

#import "MainViewController.h"
#import "DataTableViewCell.h"
#import "SubContentsViewController.h"

@interface MainViewController() {
    NSArray *mainContents;
}

@end

@implementation MainViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    mainContents = @[@"data1", @"data2", @"data3", @"data4", @"data5", @"data6", @"data7", @"data8", @"data9", @"data10", @"data11", @"data12", @"data13", @"data14", @"data15"];
    [_tableView registerCellNib:[DataTableViewCell class]];
}

-(void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self setNavigationBarItem];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [DataTableViewCell height];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return mainContents.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DataTableViewCell *cell = (DataTableViewCell *)[tableView dequeueReusableCellWithIdentifier:[DataTableViewCell identifier]];
    DataTableViewCellData *data = [DataTableViewCellData new];
    data.imageUrl = @"dummy";
    data.text = mainContents[indexPath.row];
    
    [cell setData:data];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"SubContentsViewController" bundle:nil];
    SubContentsViewController *subContentVC = (SubContentsViewController *)[storyboard instantiateViewControllerWithIdentifier:@"SubContentsViewController"];
    [self.navigationController pushViewController:subContentVC animated:YES];
}

#pragma makr - SlideMenuControllerDelegate
-(void)leftWillOpen {
    NSLog(@"SlideMenuControllerDelegate: leftWillOpen");
}

-(void)leftDidOpen {
    NSLog(@"SlideMenuControllerDelegate: leftDidOpen");
}

-(void)leftWillClose {
    NSLog(@"SlideMenuControllerDelegate: leftWillClose");
}

-(void)leftDidClose {
    NSLog(@"SlideMenuControllerDelegate: leftDidClose");
}

-(void)rightWillOpen {
    NSLog(@"SlideMenuControllerDelegate: rightWillOpen");
}

-(void)rightDidOpen {
    NSLog(@"SlideMenuControllerDelegate: rightDidOpen");
}

-(void)rightWillClose {
    NSLog(@"SlideMenuControllerDelegate: rightWillClose");
}

-(void)rightDidClose {
    NSLog(@"SlideMenuControllerDelegate: rightDidClose");
}

@end
