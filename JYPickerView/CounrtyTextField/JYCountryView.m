//
//  JYCounrtyView.m
//
//  Created by joyann on 15/10/13.
//  Copyright © 2015年 Joyann. All rights reserved.
//

#import "JYCountryView.h"
#import "JYCountry.h"
#import "Masonry.h"

@interface JYCountryView ()

@property (nonatomic, weak) UILabel *nameLabel;
@property (nonatomic, weak) UIImageView *iconImageName;

@end

@implementation JYCountryView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        // 创建nameLabel
        UILabel *nameLabel = [[UILabel alloc] init];
        [self addSubview:nameLabel];
        self.nameLabel = nameLabel;
        
        // 创建iconImageView
        UIImageView *iconImageView = [[UIImageView alloc] init];
        [self addSubview:iconImageView];
        self.iconImageName = iconImageView;
        
        // iconImageView添加约束
        [self.iconImageName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.trailing.equalTo(self.mas_trailing).offset(-8);
            make.top.equalTo(self.mas_top).offset(8);
            make.bottom.equalTo(self.mas_bottom).offset(-8);
            make.width.equalTo(@80);
        }];
        
        // nameLabel添加约束
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self.mas_leading).offset(8);
            make.top.equalTo(self.mas_top).offset(8);
            make.bottom.equalTo(self.mas_bottom).offset(-8);
            make.trailing.equalTo(self.iconImageName.mas_leading).offset(-8);
        }];
    }
    return self;
}

- (void)setCountry:(JYCountry *)country
{
    _country = country;

    self.nameLabel.text = country.name;
    self.iconImageName.image = country.icon;
}



@end
