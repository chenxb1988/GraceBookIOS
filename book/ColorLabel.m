//
//  ColorLabel.m
//  book
//
//  Created by chenxb on 17/1/20.
//  Copyright © 2017年 grace. All rights reserved.
//

#import "ColorLabel.h"
#import "Commons.h"
#import "ColorUtil.h"
#import "UIView+PYExtension.h"

@implementation ColorLabel

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addNotification];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addNotification];
    }
    return self;
}

-(void)changeTheme:(UIColor*) color{
    self.textColor = color;
}


@end
