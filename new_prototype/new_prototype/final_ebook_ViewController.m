//
//  final_ebook_ViewController.m
//  new_prototype
//
//  Created by 瀚陽 王 on 2014/8/25.
//  Copyright (c) 2014年 瀚陽 王. All rights reserved.
//

#import "final_ebook_ViewController.h"
//#import "Data.h"

@interface final_ebook_ViewController ()<UIGestureRecognizerDelegate,UIWebViewDelegate,NSURLSessionDelegate,UIDocumentInteractionControllerDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *final_web;
@property (strong ,nonatomic) NSString *imageURL;

@end

@implementation final_ebook_ViewController

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
   
    
    NSString *url1 = @"http://npm-ebook.herokuapp.com/books/";
    NSString *add_number = [[NSString alloc] initWithFormat:@"%@",self.data.final_number];
    NSLog(@"test:%@",self.data.final_number);
    NSString *url3 = @"/show";
    
    NSString *fullURL = [NSString stringWithFormat:@"%@%@%@", url1,add_number,url3];
    
    NSString *test_ebook = @"http://npm-ebook.herokuapp.com/books/101/show";
    
    NSURL *url = [NSURL URLWithString:test_ebook];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [_final_web loadRequest:requestObj];
    self.final_web.delegate = self ;
    UITapGestureRecognizer *gs = [[UITapGestureRecognizer alloc] init];
    gs.numberOfTapsRequired = 1;
    gs.delegate = self;
    


}

- (BOOL)webView:(UIWebView*)webView shouldStartLoadWithRequest:(NSURLRequest*)request navigationType:(UIWebViewNavigationType)navigationType {
    //CAPTURE USER LINK-CLICK.
    NSURL *url = [request URL];
    self.imageURL = [url absoluteString];
    
    
    
    NSLog(@"%@",self.imageURL);
    /*if([self.imageURL rangeOfString:@"download"].location == NSNotFound){
        NSLog(@"not file");
    }
    else{
        NSLog(@"download file");
        [self downloadFinal];
        
    }*/
     [self downloadFinal];
    return YES;
}



-(void) downloadFinal
{
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
                                                      
                                                      NSURL *docsDirURL = [NSURL fileURLWithPath:[docsDir stringByAppendingPathComponent:@"final4.epub"]];
                                                      NSString *docPath =[docsDir stringByAppendingPathComponent:@"final4.epub"];
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
                                                          NSString *filePath = [NSString stringWithFormat:@"%@/final4.epub",docPath];
                                                          NSURL *fileurl = [NSURL fileURLWithPath:filePath];
                                                          UIDocumentInteractionController *docController = [UIDocumentInteractionController interactionControllerWithURL:fileurl];
                                                          docController.delegate = self;
                                                          
                                                        [docController presentOpenInMenuFromRect:[self.view frame] inView:self.view animated:YES];                                                          //UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:docsDirURL]];
                                                          //UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
                                                      }
                                                      else
                                                      {
                                                          NSLog(@"failed to move: %@",[err userInfo]);
                                                      }
                                                      
                                                  }
                                                  
                                              }];
    [downloadTask resume];
}

- (void)documentInteractionControllerDidDismissOpenInMenu:(UIDocumentInteractionController *)controller {
    NSLog(@"show doc");
}
@end
