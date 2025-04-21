//
//  ZHHAudioWaveView.m
//  TJAudioAnimation
//
//  Created by 桃色三岁 on 2025/4/18.
//  Copyright © 2025 桃色三岁. All rights reserved.
//

#import "ZHHLiveAnimatingView.h"

@interface ZHHLiveAnimatingView ()

@property (nonatomic, strong) CAReplicatorLayer *replicatorLayer; ///< 复制层，负责复制多个柱条
@property (nonatomic, strong) CALayer *barLayer; ///< 原始柱条图层（被复制）

@end

@implementation ZHHLiveAnimatingView

#pragma mark - 初始化

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // 设置默认参数
        _barWidth = 4.0;
        _barHeight = 30.0;
        _barSpacing = 8.0;
        _barCount = 5;
        _barColor = UIColor.whiteColor;
        _displayPosition = ZHHAudioWavePositionCenter;

        [self setupLayers];
    }
    return self;
}

#pragma mark - 布局

- (void)layoutSubviews {
    [super layoutSubviews];

    self.replicatorLayer.borderColor = UIColor.redColor.CGColor;
    self.replicatorLayer.borderWidth = 1;
    self.replicatorLayer.instanceCount = self.barCount;
    self.replicatorLayer.instanceTransform = CATransform3DMakeTranslation(self.barWidth + self.barSpacing, 0, 0);

    // 计算第一个柱条起始 X 坐标（居中对齐）
    CGFloat totalWidth = self.barWidth * self.barCount + self.barSpacing * (self.barCount - 1);
    CGFloat startX = (CGRectGetWidth(self.bounds) - totalWidth) / 2.0;

    switch (self.displayPosition) {
        case ZHHAudioWavePositionTop:
            self.barLayer.anchorPoint = CGPointMake(0, 0);
            break;
        case ZHHAudioWavePositionBottom:
            self.barLayer.anchorPoint = CGPointMake(0, 1);
            break;
        case ZHHAudioWavePositionCenter:
        default:
            self.barLayer.anchorPoint = CGPointMake(0, 0.5);
            break;
    }

    // 根据展示位置计算 Y 坐标
    CGFloat barY = (CGRectGetHeight(self.bounds) - self.barHeight) / 2.0; ;
    // 设置复制层的 frame
    self.replicatorLayer.frame = CGRectMake(0, barY, CGRectGetWidth(self.bounds), self.barHeight);

    // 设置柱条的 frame
    self.barLayer.frame = CGRectMake(startX, 0, self.barWidth, self.barHeight);

    // 设置柱条的圆角
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, self.barWidth, self.barHeight)
                                                cornerRadius:self.barWidth / 2.0].CGPath;
    self.barLayer.mask = maskLayer;

    self.barLayer.cornerCurve = kCACornerCurveContinuous;
    self.barLayer.backgroundColor = self.barColor.CGColor;
}

#pragma mark - 图层配置

/// 初始化复制层和柱条图层
- (void)setupLayers {
    // 复制层
    self.replicatorLayer = [CAReplicatorLayer layer];
    self.replicatorLayer.instanceDelay = 0.15; // 每条动画的时间延迟
    self.replicatorLayer.masksToBounds = YES;
    [self.layer addSublayer:self.replicatorLayer];

    // 原始柱条图层
    self.barLayer = [CALayer layer];
    [self.barLayer addAnimation:[self scaleYAnimation] forKey:@"scale"];
    [self.replicatorLayer addSublayer:self.barLayer];
}

#pragma mark - 动画配置

/// 缩放动画：柱条上下浮动
- (CABasicAnimation *)scaleYAnimation {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale.y"];
    animation.toValue = @0.2;
    animation.duration = 0.4;
    animation.autoreverses = YES;
    animation.repeatCount = HUGE_VALF;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    return animation;
}

#pragma mark - 控制方法

/// 开始动画
- (void)startAnimating {
    if (![self.barLayer animationForKey:@"scale"]) {
        [self.barLayer addAnimation:[self scaleYAnimation] forKey:@"scale"];
    }
}

/// 停止动画（不保留当前状态）
- (void)stopAnimating {
    [self.barLayer removeAnimationForKey:@"scale"];
}

#pragma mark - setter 重绘支持

/// 设置展示位置，触发重绘
- (void)setDisplayPosition:(ZHHAudioWavePosition)displayPosition {
    _displayPosition = displayPosition;
    [self setNeedsLayout];
}

/// 设置颜色，更新柱条颜色
- (void)setBarColor:(UIColor *)barColor {
    _barColor = barColor;
    self.barLayer.backgroundColor = barColor.CGColor;
}

@end
