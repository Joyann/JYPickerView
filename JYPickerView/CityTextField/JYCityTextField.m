//
//  JYCityTextField.m
//  JYPickerView
//
//  Created by joyann on 15/10/14.
//  Copyright © 2015年 Joyann. All rights reserved.
//

#import "JYCityTextField.h"
#import "JYProvince.h"

@interface JYCityTextField () <UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, strong) NSMutableArray *provinces;
@property (nonatomic, weak) UIPickerView *pickerView;
@property (nonatomic, assign) NSInteger selectedProvinceIndex;
@property (nonatomic, assign) BOOL hasInitialText;

@end

@implementation JYCityTextField

#pragma mark - Getter methods

- (NSMutableArray *)provinces
{
    if (!_provinces) {
        _provinces = [NSMutableArray array];
        NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"provinces" ofType:@"plist"];
        NSArray *results = [NSArray arrayWithContentsOfFile:plistPath];
        for (NSDictionary *dict in results) {
            JYProvince *province = [JYProvince provinceWithDict: dict];
            [_provinces addObject:province];
        }
    }
    return _provinces;
}

#pragma mark - View Life Cycle

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self p_setUp];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self p_setUp];
    }
    return self;
}

#pragma mark - Set up 

- (void)p_setUp
{
    UIPickerView *pickerView = [[UIPickerView alloc] init];
    pickerView.delegate = self;
    pickerView.dataSource = self;
    self.pickerView = pickerView;
    self.inputView = pickerView;
}

#pragma mark - UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0) { // 第0列provinces的行数
        return self.provinces.count;
    } else { // 第1列cities的行数
        self.selectedProvinceIndex = [self.pickerView selectedRowInComponent:0];
        return [[self.provinces[self.selectedProvinceIndex] cities] count];
    }
}

#pragma mark - UIPickerViewDelegate

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) { // 第0列显示province
        return [self.provinces[row] name];
    } else { // 第1列显示province对应的cities
        return [self.provinces[self.selectedProvinceIndex] cities][row];
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0) { // 滚动的是第0列的时候才刷新
        [pickerView reloadComponent:1];
        [pickerView selectRow:0 inComponent:1 animated:YES];
    }
    NSInteger selectedCityIndex = [pickerView selectedRowInComponent:1];
    self.text = [NSString stringWithFormat:@"%@ %@", [self.provinces[self.selectedProvinceIndex] name], [self.provinces[self.selectedProvinceIndex] cities][selectedCityIndex]];
}

#pragma mark - Set Initial Text

- (void)setInitialText
{
    if (!_hasInitialText) {
        [self pickerView:self.pickerView didSelectRow:0 inComponent:0];
        _hasInitialText = YES;
    }
}

@end
