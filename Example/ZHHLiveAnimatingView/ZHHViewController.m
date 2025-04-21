//
//  ZHHViewController.m
//  ZHHLiveAnimatingView
//
//  Created by 桃色三岁 on 04/21/2025.
//  Copyright (c) 2025 桃色三岁. All rights reserved.
//

#import "ZHHViewController.h"
#import "ZHHLiveAnimatingView.h"

@interface ZHHViewController ()

@end

@implementation ZHHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    ZHHLiveAnimatingView *waveView = [[ZHHLiveAnimatingView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
    waveView.layer.borderWidth = 3;
    waveView.layer.borderColor = UIColor.redColor.CGColor;
    waveView.backgroundColor = UIColor.orangeColor;
    waveView.layer.cornerRadius = 10;
    waveView.center = self.view.center;
    
    waveView.barColor = UIColor.redColor;
    waveView.displayPosition = ZHHAudioWavePositionBottom;
    /// 单条柱宽度（默认 4）
    waveView.barWidth = 4;
    /// 单条柱高度（默认 30）
    waveView.barHeight = 20;
    /// 柱条之间的间距（默认 8）
    waveView.barSpacing = 2;
    /// 柱条数量（默认 5）
    waveView.barCount = 3;
    /// 柱条颜色（默认白色）
    waveView.barColor = UIColor.cyanColor;
    [self.view addSubview:waveView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
