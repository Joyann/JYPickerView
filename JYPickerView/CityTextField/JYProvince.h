//
//  JYProvince.h
//  JYPickerView
//
//  Created by joyann on 15/10/14.
//  Copyright © 2015年 Joyann. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JYProvince : NSObject

@property (nonatomic, strong) NSArray *cities;
@property (nonatomic, copy) NSString *name;

+ (instancetype)provinceWithDict: (NSDictionary *)dict;

@end
