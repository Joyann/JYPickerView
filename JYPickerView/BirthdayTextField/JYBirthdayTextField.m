//
//  JYBirthdayTextField.m
//  JYPickerView
//
//  Created by joyann on 15/10/14.
//  Copyright © 2015年 Joyann. All rights reserved.
//

#import "JYBirthdayTextField.h"

@interface JYBirthdayTextField ()

@property (nonatomic, weak) UIDatePicker *datePicker;
@property (nonatomic, assign) BOOL hasInitialText;

@end

@implementation JYBirthdayTextField

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

#pragma mark - Set Up

- (void)p_setUp
{
    UIDatePicker *datePicker = [[UIDatePicker alloc] init];
    datePicker.datePickerMode = UIDatePickerModeDate;
    [datePicker addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged];
    self.datePicker = datePicker;
    self.inputView = datePicker;
}

#pragma mark - Action

- (void)dateChanged: (UIDatePicker *)datePicker
{
    NSDate *date = datePicker.date;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy/MM/dd";
    NSString *dateString = [dateFormatter stringFromDate:date];
    self.text = dateString;
}

#pragma mark - Set Initial Text

- (void)setInitialText
{
    if (!_hasInitialText) {
        [self dateChanged:self.datePicker];
        _hasInitialText = YES;
    }
}


@end
