//
//  TNATabButton.m
//  TestVideo
//
//  Created by duxiangyu on 15/6/22.
//  Copyright (c) 2015年 duxiangyu. All rights reserved.
//

#import "TNATabButton.h"

@implementation TNATabButton
/*
 * @des 设置按钮属性
 */
- (void)commenInit
{
    [self setTitleColor:[UIColor colorWithRed:46.f/250 green:150.f/250 blue:61.f/250 alpha:1.0] forState:UIControlStateSelected];
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.titleLabel.font = [UIFont systemFontOfSize:10];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}
#pragma mark - event
/*
 * @des title的frame
 */
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(0, 28, CGRectGetWidth(self.frame), 22);
}
/*
 * @des 图片的frame
 */
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(CGRectGetWidth(self.frame) / 2 - 22 / 2, 6, 22, 22);
}

@end
