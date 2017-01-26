//
//  ViewController.m
//  BSParallaxTableViewHeader
//
//  Created by mac on 1/26/17.
//  Copyright © 2017 Bigsun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    __weak IBOutlet NSLayoutConstraint *cstNaviTop;
    __weak IBOutlet NSLayoutConstraint *cstTableTop;
    __weak IBOutlet UITableView *tableV;
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"name %ld",indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
    
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    float yoffset = -tableV.contentOffset.y;
    
    if (yoffset < - 80) {
        cstNaviTop.constant = -80;
    }else {
        if (yoffset > 0) {
            cstNaviTop.constant = 0;
        }else {
            cstNaviTop.constant = yoffset;
        }
    }
    
    float yoffsetViewContent = 200 + yoffset;
    if (yoffsetViewContent < 64) {
        cstTableTop.constant = 64;
    }else if (yoffsetViewContent > 200) {
        cstTableTop.constant = 200;
    }else {
        cstTableTop.constant = yoffsetViewContent;
    }
    
    
}


@end
