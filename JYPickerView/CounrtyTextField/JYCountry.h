//
//  JYCountry.h
//  JYPickerView
//
//  Created by joyann on 15/10/13.
//  Copyright © 2015年 Joyann. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface JYCountry : NSObject

/**
 *  Counrty类工厂方法，快速创建Country的对象
 *
 *  @param dict 字典类型的数据
 *
 *  @return 转换后的country模型数据
 */
+ (instancetype)countryWithDic: (NSDictionary *)dict;

/**
 *  name只读，只能通过初始化方法设置
 */
@property (nonatomic, copy, readonly) NSString *name;

/**
 *  icon只读，只能通过初始化方法设置
 */
@property (nonatomic, strong, readonly) UIImage *icon;

@end
