//
//  ColorBackButton.m
//  book
//
//  Created by chenxb on 17/1/19.
//  Copyright © 2017年 grace. All rights reserved.
//

#import "ColorBackButton.h"
#import "Commons.h"
#import "ColorUtil.h"
#import "UIView+PYExtension.h"

@implementation ColorBackButton

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

- (id)init {
    if( self = [super init] )
    {
        [self addNotification];
    }
    
    return self;
}

-(id)initWithFrame:(CGRect)frame{
    if( self = [super initWithFrame: frame] )
    {
        [self addNotification];
    }
    return self;
}

-(void)changeTheme:(UIColor*) color{
    [self setBackgroundImage:[ColorUtil createImageWithColor:color] forState:UIControlStateNormal];
}


@end
