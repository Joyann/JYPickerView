//
//  JYCountryTextField.m
//  JYPickerView
//
//  Created by joyann on 15/10/13.
//  Copyright © 2015年 Joyann. All rights reserved.
//

#import "JYCountryTextField.h"
#import "JYCountryView.h"
#import "JYCountry.h"

static NSString * const kCounrtyPlistName  = @"flags.plist";
static const NSInteger kNumberOfComponents = 1;
static const CGFloat kPickerViewRowHeight  = 80.0;
static const CGFloat kCountryViewHeight    = 80.0;

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

@interface JYCountryTextField () <UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, strong) NSMutableArray *countries;

@property (nonatomic, assign) BOOL hasInitialText;

@end

@implementation JYCountryTextField

#pragma mark - view life cycle

// 通过xib/storyboard加载
- (void)awakeFromNib
{
    [super awakeFromNib];
    [self p_setUp];
}

// 通过代码加载
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self p_setUp];
    }
    return self;
}

#pragma mark - getter methods

- (NSMutableArray *)countries
{
    if (!_countries) {
        _countries = [NSMutableArray array];
        NSString *counrtyPlist =  [[NSBundle mainBundle] pathForResource:kCounrtyPlistName ofType:nil];
        NSArray *results = [[NSArray alloc] initWithContentsOfFile:counrtyPlist];
        for (NSDictionary *countryDic in results) {
            JYCountry *country = [JYCountry countryWithDic: countryDic];
            [_countries addObject:country];
        }
        
    }
    return _countries;
}

#pragma mark - helper methods

// 无论通过xib/storyboard还是代码创建，都会调用这个方法来进行一些初始化操作.
- (void)p_setUp
{
    // 创建UIPickerView，大小默认，通过这个对象的代理方法返回自定义的view;
    UIPickerView *pickerView = [[UIPickerView alloc] init];
    pickerView.delegate = self;
    pickerView.dataSource = self;
    self.inputView = pickerView;
}

#pragma mark - UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return kNumberOfComponents;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.countries.count;
}

#pragma mark - UIPickerViewDelegate

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return kPickerViewRowHeight;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    JYCountry *country = self.countries[row];
    JYCountryView *countryView = [[JYCountryView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, kCountryViewHeight)];
    countryView.country = country;
    return countryView;
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSString *title = [self.countries[row] name];
    self.text = title;
}

#pragma mark - Set Initial Text

- (void)setInitialText
{
    if (!_hasInitialText) {
        [self pickerView:nil didSelectRow:0 inComponent:0];
        _hasInitialText = YES;
    }
}

@end
