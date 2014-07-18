//
//  RACMenuCell.m
//  Rivet&Cuff
//
//  Created by Chad D Colby on 7/17/14.
//  Copyright (c) 2014 Byte Meets World. All rights reserved.
//

#import "RACMenuCell.h"

@implementation RACMenuCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(60, 0, self.bounds.size.width - 70, self.bounds.size.height)];
        self.autoresizesSubviews = YES;
        self.label.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
        self.label.font = [UIFont boldSystemFontOfSize:24];
        self.label.textAlignment = NSTextAlignmentLeft;
        self.label.adjustsFontSizeToFitWidth = YES;
        self.label.textColor = [UIColor whiteColor];
        [self addSubview:self.label];
        
        self.iconImage = [[UIImageView alloc] initWithFrame:CGRectMake(self.bounds.origin.x, self.bounds.origin.y + 20, 50, 50)];
        [self addSubview:self.iconImage];
        self.backgroundColor = [UIColor clearColor];
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
