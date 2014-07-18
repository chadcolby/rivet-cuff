//
//  RACRoundedButton.m
//  Rivet&Cuff
//
//  Created by Chad D Colby on 7/18/14.
//  Copyright (c) 2014 Byte Meets World. All rights reserved.
//

#import "RACRoundedButton.h"

@implementation RACRoundedButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.clipsToBounds = YES;
        self.layer.cornerRadius = self.bounds.size.width / 2;
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"close"]];
        self.alpha = 0.0f;
        self.isVisible = NO;
    }
    return self;
}

@end
