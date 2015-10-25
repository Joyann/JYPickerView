//
//  JYCountry.m
//  JYPickerView
//
//  Created by joyann on 15/10/13.
//  Copyright © 2015年 Joyann. All rights reserved.
//

#import "JYCountry.h"

@interface JYCountry ()

@property (nonatomic, copy, readwrite) NSString *name;

@property (nonatomic, strong, readwrite) UIImage *icon;

@end

@implementation JYCountry

+ (instancetype)countryWithDic:(NSDictionary *)dict
{
    JYCountry *country = [[JYCountry alloc] init];
    
    // KVC快速完成字典 -> 模型
    [country setValuesForKeysWithDictionary:dict];
    
    return country;
}

- (void)setIcon:(NSString *)icon
{
    _icon = [UIImage imageNamed:icon];
}

@end
