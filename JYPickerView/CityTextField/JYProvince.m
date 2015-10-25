//
//  JYProvince.m
//  JYPickerView
//
//  Created by joyann on 15/10/14.
//  Copyright © 2015年 Joyann. All rights reserved.
//

#import "JYProvince.h"

@implementation JYProvince

+ (instancetype)provinceWithDict:(NSDictionary *)dict
{
    JYProvince *province = [[JYProvince alloc] init];
    
    [province setValuesForKeysWithDictionary:dict];
    
    return province;
}

@end
