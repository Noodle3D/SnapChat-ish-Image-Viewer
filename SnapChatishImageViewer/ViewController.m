//
//  ViewController.m
//  SnapChatishImageViewer
//
//  Created by yubo on H25/12/03.
//  Copyright (c) 平成25年 yubo. All rights reserved.
//

#import "ViewController.h"
#import "SnapChatishView.h"

@interface ViewController (){
    int currMinute;
    int currSeconds;
    
    int currentCount;
    float totalCount;
}

@property (strong, nonatomic) NSTimer *timer;

@property (weak, nonatomic) IBOutlet UILabel *countDownLabel;
@property (strong, nonatomic) IBOutlet SnapChatishView *snapChatishView;

@end

@implementation ViewController

-(SnapChatishView *)snapChatishView{
    if (_snapChatishView == nil) {
        _snapChatishView = [[SnapChatishView alloc] initWithFrame:CGRectMake(60, 184, 200, 200)];
        [_snapChatishView setImage:[UIImage imageNamed:@"sample.png"]
                    withPercentage:1.0];
    }
    
    return _snapChatishView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self.snapChatishView setImage:[UIImage imageNamed:@"sample.png"]
                    withPercentage:0.0001];
    
    [self.countDownLabel setText:@"Time : 5:00"];
    currMinute=5;
    currSeconds=00;
    totalCount = currMinute*60.0+currSeconds;
    [self start];
}

-(void)start
{
    self.timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerFired) userInfo:nil repeats:YES];
    
}

-(void)timerFired
{
    if((currMinute>0 || currSeconds>=0) && currMinute>=0)
    {
        if(currSeconds==0)
        {
            currMinute-=1;
            currSeconds=59;
        }
        else if(currSeconds>0)
        {
            currSeconds-=1;
        }
        if(currMinute>-1){
            currentCount++;
            float percent = currentCount/totalCount;
            NSLog(@"%f",percent);
            [self.countDownLabel setText:[NSString stringWithFormat:@"%@%d%@%02d",@"Time : ",currMinute,@":",currSeconds]];
            [self.snapChatishView setImage:[UIImage imageNamed:@"sample.png"]
                            withPercentage:percent];
        }
    }
    else
    {
        [self.timer invalidate];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
