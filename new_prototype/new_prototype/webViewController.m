//
//  webViewController.m
//  new_prototype
//
//  Created by 瀚陽 王 on 2014/7/27.
//  Copyright (c) 2014年 瀚陽 王. All rights reserved.
//

#import "webViewController.h"

@interface webViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *viewWeb;

@end

@implementation webViewController

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
    // Do any additional setup after loading the view.
    NSString *fullURL = @"http://www.nccu.edu.tw";
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [_viewWeb loadRequest:requestObj];
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
