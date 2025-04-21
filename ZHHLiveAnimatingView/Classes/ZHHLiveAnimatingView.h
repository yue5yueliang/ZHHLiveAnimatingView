//
//  ZHHLiveAnimatingView.h
//  TJAudioAnimation
//
//  Created by 桃色三岁 on 2025/4/18.
//  Copyright © 2025 桃色三岁. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, ZHHAudioWavePosition) {
    ZHHAudioWavePositionCenter, // 从中间缩放
    ZHHAudioWavePositionTop,    // 从顶部缩放
    ZHHAudioWavePositionBottom  // 从底部缩放
};

@interface ZHHLiveAnimatingView : UIView

/// 单条柱宽度（默认 4）
@property (nonatomic, assign) CGFloat barWidth;

/// 单条柱高度（默认 30）
@property (nonatomic, assign) CGFloat barHeight;

/// 柱条之间的间距（默认 8）
@property (nonatomic, assign) CGFloat barSpacing;

/// 柱条数量（默认 5）
@property (nonatomic, assign) NSInteger barCount;

/// 柱条颜色（默认白色）
@property (nonatomic, strong) UIColor *barColor;

@property (nonatomic, assign) ZHHAudioWavePosition displayPosition;
@end

NS_ASSUME_NONNULL_END
