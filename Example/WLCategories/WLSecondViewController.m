//
//  WLSecondViewController.m
//  WLCategories_Example
//
//  Created by Fallrainy on 2018/9/25.
//  Copyright © 2018年 nomeqc@gmail.com. All rights reserved.
//

#import "WLSecondViewController.h"
#import "NSObject+WLNotificationObserve.h"

@interface WLSecondViewController ()

@end

@implementation WLSecondViewController

- (void)dealloc {
    NSLog(@"%s",__func__);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"键盘收" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    button.frame = CGRectMake(100, 200, 120, 40);
    [button addTarget:self action:@selector(didTapButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(100, 100, 120, 40)];
    textField.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:textField];
    
    [self wl_observeNotificationWithName:UIKeyboardWillShowNotification object:nil handler:^(NSNotification *notification) {
        NSLog(@"Keyboard Will Show");
    }];
   
    [self wl_observeNotificationWithName:UIKeyboardWillHideNotification object:nil handler:^(NSNotification *notification) {
        NSLog(@"Keyboard Will Hide");
    }];
}

- (void)didTapButton {
    [self.view endEditing:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.view endEditing:YES];
}



@end
