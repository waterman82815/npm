//
//  wViewController.m
//  new_prototype
//
//  Created by 瀚陽 王 on 2014/7/27.
//  Copyright (c) 2014年 瀚陽 王. All rights reserved.
//

#import "wViewController.h"

@interface wViewController () <UIGestureRecognizerDelegate,UIWebViewDelegate,NSURLSessionDelegate>
- (IBAction)back_b:(id)sender;
@property (weak, nonatomic) IBOutlet UIWebView *viewWeb;
@property (strong ,nonatomic) NSString *imageURL;
@end

@implementation wViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *fullURL = @"http://npm-ebook.herokuapp.com/image_library";
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [_viewWeb loadRequest:requestObj];
    self.viewWeb.delegate = self ;
    UITapGestureRecognizer *gs = [[UITapGestureRecognizer alloc] init];
    gs.numberOfTapsRequired = 1;
    gs.delegate = self;
    
    NSLog(@"download");
    //[self downloadFile];
    //[self.viewWeb addGestureRecognizer:gs];
    
}
/*
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    NSLog(@"TAPPED");
    //Touch gestures below top bar should not make the page turn.
    //EDITED Check for only Tap here instead.
    if ([gestureRecognizer isKindOfClass:[UITapGestureRecognizer class]]) {
        CGPoint touchPoint = [touch locationInView:self.viewWeb];
        
        NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
        bool pageFlag = [userDefaults boolForKey:@"pageDirectionRTLFlag"];
        NSLog(@"pageFlag tapbtnRight %d", pageFlag);
        
        if(self.interfaceOrientation==UIInterfaceOrientationPortrait||self.interfaceOrientation==UIInterfaceOrientationPortraitUpsideDown) {
            NSString *imgURL = [NSString stringWithFormat:@"document.elementFromPoint(%f, %f).src", touchPoint.x, touchPoint.y];
            NSString *urlToSave = [_viewWeb stringByEvaluatingJavaScriptFromString:imgURL];
            
            NSLog(@"urlToSave :%@",urlToSave);
            NSURL * imageURL = [NSURL URLWithString:urlToSave];
            NSData * imageData = [NSData dataWithContentsOfURL:imageURL];
            UIImage * image = [UIImage imageWithData:imageData];
            
            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
            //_my_img.image = image;
        }
    }
    return YES;
    
}
*/

- (BOOL)webView:(UIWebView*)webView shouldStartLoadWithRequest:(NSURLRequest*)request navigationType:(UIWebViewNavigationType)navigationType {
    //CAPTURE USER LINK-CLICK.
    NSURL *url = [request URL];
    self.imageURL = [url absoluteString];
    
    
    
    NSLog(@"%@",self.imageURL);
    if([self.imageURL rangeOfString:@"download"].location == NSNotFound){
        NSLog(@"not file");
    }
    else{
        NSLog(@"download file");
        [self downloadFile];

    }
    return YES;
}


-(void) downloadFile
{
    
   // NSURL *down_epub = @"http://npm-ebook.herokuapp.com/ebook";
    
    //電子書下載的url
    
    NSURL * url = [NSURL URLWithString:self.imageURL];
    
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate:self delegateQueue: [NSOperationQueue mainQueue]];
    
    NSURLSessionDownloadTask * downloadTask =[ defaultSession downloadTaskWithURL:url
                                                                completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error)
                                              {
                                                  if(error == nil)
                                                  {
                                                      NSLog(@"Temporary file =%@",location);
                                                      
                                                      NSError *err = nil;
                                                      NSFileManager *fileManager = [NSFileManager defaultManager];
                                                      NSString *docsDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
                                                      
                                                      NSURL *docsDirURL = [NSURL fileURLWithPath:[docsDir stringByAppendingPathComponent:@"out.jpg"]];
                                                      NSString *docPath =[docsDir stringByAppendingPathComponent:@"out.jpg"];
                                                      if ([fileManager fileExistsAtPath:docPath]) {
                                                          NSError *fileError;
                                                          [fileManager removeItemAtPath:docPath error:&fileError];
                                                          if (fileError)
                                                              NSLog(@"error");
                                                      }
                                                      if ([fileManager moveItemAtURL:location
                                                                               toURL:docsDirURL
                                                                               error: &err])
                                                      {
                                                          NSLog(@"File is saved to =%@",docsDir);
                                                          UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:docsDirURL]];
                                                          UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
                                                      }
                                                      else
                                                      {
                                                          NSLog(@"failed to move: %@",[err userInfo]);
                                                      }
                                                      
                                                  }
                                                  
                                              }];
    [downloadTask resume];
}
- (IBAction)back_b:(id)sender {
     //[_viewWeb goBack];
    NSString *bfullURL = @"http://npm-ebook.herokuapp.com/image_library";
    NSURL *burl = [NSURL URLWithString:bfullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:burl];
    [_viewWeb loadRequest:requestObj];
}
@end
