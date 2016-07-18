//
//  LDRoomInfoViewController.m
//  PLLivingDemo
//
//  Created by TaoZeyu on 16/7/18.
//  Copyright © 2016年 com.pili-engineering. All rights reserved.
//

#import "LDRoomInfoViewController.h"

@interface LDRoomInfoViewController ()
@property (nonatomic, assign) CGFloat presetKeyboardHeight;
@property (nonatomic, strong) UIView *container;
@property (nonatomic, strong) UITextField *editor;
@property (nonatomic, strong) UIButton *beginButton;
@property (nonatomic, strong) UIButton *closeButton;
@end

@implementation LDRoomInfoViewController

- (instancetype)init
{
    if (self = [super init]) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _container = ({
        UIView *container = [[UIView alloc] init];
        [self.view addSubview:container];
        container;
    });
    _editor = ({
        UITextField *editor = [[UITextField alloc] init];
        [_container addSubview:editor];
        [editor mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.left.and.right.equalTo(_container);
        }];
        [editor becomeFirstResponder];
        editor;
    });
    _beginButton = ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [_container addSubview:button];
        [button setTitle:@"Begin Broadcasting" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setBackgroundColor:[UIColor redColor]];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_container);
            make.bottom.equalTo(_container).with.offset(kBeginBroadingButtonFloatHeight);
        }];
        button;
    });
    _closeButton = ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [_container addSubview:button];
        [button setTitle:@"Close" forState:UIControlStateNormal];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_container).with.offset(25);
            make.right.equalTo(_container).with.offset(-25);
        }];
        button;
    });
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    CGSize size = self.view.bounds.size;
    self.container.frame = CGRectMake(0, 0, size.width, size.height - self.presetKeyboardHeight);
}

- (void)addNotifications
{
    NSNotificationCenter *notificationCenger = [NSNotificationCenter defaultCenter];
    [notificationCenger addObserver:self selector:@selector(_onFoundKeyboardWasShown:)
                               name:UIKeyboardWillShowNotification object:nil];
    [notificationCenger addObserver:self selector:@selector(_onFoundKeyboardWillBeHidden:)
                               name:UIKeyboardWillHideNotification object:nil];
}

- (void)clearNotifications
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)_onFoundKeyboardWasShown:(NSNotification *)notification
{
}

- (void)_onFoundKeyboardWillBeHidden:(NSNotification *)notification
{
}

@end
