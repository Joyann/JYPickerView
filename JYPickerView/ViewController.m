//
//  ViewController.m
//  JYPickerView
//
//  Created by joyann on 15/10/13.
//  Copyright © 2015年 Joyann. All rights reserved.
//

#import "ViewController.h"
#import "JYCountryTextField.h"
#import "JYBirthdayTextField.h"
#import "JYCityTextField.h"

@interface ViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet JYCountryTextField *countryTextField;
@property (weak, nonatomic) IBOutlet JYBirthdayTextField *birthdayTextField;
@property (weak, nonatomic) IBOutlet JYCityTextField *cityTextField;


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

#pragma mark - UITextFieldDelegate

// 这个方法会弹出键盘但是不允许用户输入并且会出现光标
// 不同于shouldBeginEditing方法，后者不出现光标和键盘
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    return NO;
}

- (void)textFieldDidBeginEditing:(id)textField
{
    // 当textField开始编辑设置默认内容
    [textField setInitialText];
}


@end
