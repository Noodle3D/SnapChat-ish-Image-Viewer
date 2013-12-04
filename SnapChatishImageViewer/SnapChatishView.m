//
//  SnapChatishView.m
//  SnapChatishImageViewer
//
//  Created by yubo on H25/12/03.
//  Copyright (c) 平成25年 yubo. All rights reserved.
//

#import "SnapChatishView.h"



@interface SnapChatishView()

@property float percent;
@property (nonatomic, strong) UIImage *image;

@end

@implementation SnapChatishView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void) setImage:(UIImage *)image withPercentage:(float)per
{
    self.image = image;
    self.percent = per;
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    float pi = 3.1415926;
    float startAngle = pi*3/2;//270
    float endAngle = 2*pi*self.percent;
    endAngle = startAngle+endAngle<2*pi?startAngle+endAngle:startAngle+endAngle-2*pi;
    CGPoint center = CGPointMake((rect.size.width/2.0), (rect.size.height/2.0));
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:self.frame.size.width/2-4 startAngle:startAngle endAngle:endAngle clockwise:NO];
    [path addLineToPoint:center];
    [path closePath];
    [path stroke];
    [path addClip];
    
    if (self.image != NULL){
        CGRect bounds = [self bounds];
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextScaleCTM(context, bounds.size.width/self.image.size.width, bounds.size.height/self.image.size.height);
        [self.image drawAtPoint:CGPointZero];

    }
}

@end
