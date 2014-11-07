//
//  emotionViewController.m
//  new_prototype
//
//  Created by 瀚陽 王 on 2014/8/9.
//  Copyright (c) 2014年 瀚陽 王. All rights reserved.
//

#import "emotionViewController.h"
#import "holeViewController.h"

int count =0;
int button_number=0;
int emotion_number=0;

@interface emotionViewController ()

@end

@implementation emotionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}


- (IBAction)doEditFieldDone:(id)sender {
    
    //（鍵盤消失）
    [sender resignFirstResponder];
}




- (IBAction)happy_control:(id)sender {
    emotion_number =1;
    [self change];

}

- (IBAction)cry_control:(id)sender {
    emotion_number =2;
    [self change];
}

- (IBAction)love_control:(id)sender {
    emotion_number =3;
    [self change];
}

-(void)change
{
    if(emotion_number == 1){
        self.happy_b.backgroundColor=[UIColor brownColor];
        self.emotion_big.text= @"happy";
    }
    else{
        self.happy_b.backgroundColor=[UIColor clearColor];
    }
    if(emotion_number == 2){
        self.cry_b.backgroundColor=[UIColor brownColor];
        self.emotion_big.text= @"cry";
    }
    else{
        self.cry_b.backgroundColor=[UIColor clearColor];
    }
    if(emotion_number==3){
        self.love_b.backgroundColor=[UIColor brownColor];
        self.emotion_big.text= @"love";
        
    }
    else{
        self.love_b.backgroundColor=[UIColor clearColor];
    }
 
}





- (IBAction)sun_control:(id)sender {
    button_number =1;
    [self changeButtonState];
}

- (IBAction)cloud_control:(id)sender {
    button_number =2;
    [self changeButtonState];
}

- (IBAction)rain_control:(id)sender {
    button_number =3;
    [self changeButtonState];
}
-(void)changeButtonState{
    if(button_number == 1){
        self.sun_b.backgroundColor=[UIColor brownColor];
        self.weather_big.text= @"sunny";
    }
    else{
        self.sun_b.backgroundColor=[UIColor clearColor];
    }
    if(button_number == 2){
        self.cloud_b.backgroundColor=[UIColor brownColor];
        self.weather_big.text= @"cloud";
    }
    else{
        self.cloud_b.backgroundColor=[UIColor clearColor];
    }
    if(button_number==3){
        self.rain_b.backgroundColor=[UIColor brownColor];
        self.weather_big.text= @"rainny";

    }
    else{
        self.rain_b.backgroundColor=[UIColor clearColor];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"TwoToThree"]){
        self.data.Global_Together = self.together_text.text;
        self.data.Global_Emotion = self.emotion_big.text;
        self.data.Global_Weather = self.weather_big.text;
        holeViewController *vc2_3 = segue.destinationViewController;
        vc2_3.data = self.data;
    }
}

-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    if([self isViewLoaded] && self.view.window == nil)
    {
        NSLog(@"remove view");
        self.view = nil;
    }
    
}

@end
