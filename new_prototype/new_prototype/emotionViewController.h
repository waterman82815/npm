//
//  emotionViewController.h
//  new_prototype
//
//  Created by 瀚陽 王 on 2014/8/9.
//  Copyright (c) 2014年 瀚陽 王. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Data.h"

@interface emotionViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *together_text;


@property (weak, nonatomic) IBOutlet UITextView *emotion_big;

@property (weak, nonatomic) IBOutlet UITextView *weather_big;


@property (weak, nonatomic) IBOutlet UIButton *sun_b;
@property (weak, nonatomic) IBOutlet UIButton *cloud_b;
@property (weak, nonatomic) IBOutlet UIButton *rain_b;


@property (weak, nonatomic) IBOutlet UIButton *happy_b;
@property (weak, nonatomic) IBOutlet UIButton *cry_b;
@property (weak, nonatomic) IBOutlet UIButton *love_b;

@property (weak, nonatomic) NSString *tmp_text;


@property (strong, nonatomic) Data *data;


@end
