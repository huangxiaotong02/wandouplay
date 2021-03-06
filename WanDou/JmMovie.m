//
//  JmMovie.m
//  WanDou
//
//  Created by xyooyy on 14/12/18.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import "JmMovie.h"
#define scrollview_hight 40
#define STEP 4
#define buttonwide ([UIScreen mainScreen].bounds.size.width)/STEP
#define buttonhight 40

@implementation JmMovie
@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatScrollview];

        // Initialization code
    }
    return self;
}
-(UIScrollView *)creatScrollview
{
    m_scrollViewButton = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, scrollview_hight)];
    m_scrollViewButton.contentOffset = CGPointMake(0, 0);
    m_scrollViewButton.contentSize = CGSizeMake(480, 0);
    m_scrollViewButton.backgroundColor = [UIColor whiteColor];
    [self addSubview:m_scrollViewButton];
    [self buttonarray];
    return m_scrollViewButton;
}
-(UIButton *)creatButton :(CGRect)buttonframe :(NSString *)buttontitle :(int)buttontag :(UIView *)view :(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = buttonframe;
    [button setTitle:buttontitle forState:UIControlStateNormal];
    button.tag = buttontag;
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [view addSubview:button];
    [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}
-(void)buttonarray
{
    _button1 = [self creatButton:CGRectMake(buttonwide * 0, 0, buttonwide, buttonhight) :@"分类" :2003 :m_scrollViewButton :@selector(buttonPress:)];
    _button2 = [self creatButton:CGRectMake(buttonwide * 1, 0, buttonwide, buttonhight) :@"精选" :2004 :m_scrollViewButton :@selector(buttonPress:)];
    _button3 = [self creatButton:CGRectMake(buttonwide * 2, 0, buttonwide, buttonhight) :@"动作" :2005 :m_scrollViewButton :@selector(buttonPress:)];
    _button4 = [self creatButton:CGRectMake(buttonwide * 3, 0, buttonwide, buttonhight) :@"喜剧" :2006 :m_scrollViewButton :@selector(buttonPress:)];
    _button5 = [self creatButton:CGRectMake(buttonwide * 4, 0, buttonwide, buttonhight) :@"香港电影" :2007 :m_scrollViewButton :@selector(buttonPress:)];
    _button5 = [self creatButton:CGRectMake(buttonwide * 5, 0, buttonwide, buttonhight) :@"经典" :2008 :m_scrollViewButton :@selector(buttonPress:)];
}
-(void)buttonPress:(UIButton *)buttonTag
{
    [delegate tablebarViewDelegate:buttonTag.tag];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
