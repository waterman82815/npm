//
//  tenViewController.m
//  new_prototype
//
//  Created by 瀚陽 王 on 2014/8/10.
//  Copyright (c) 2014年 瀚陽 王. All rights reserved.
//

#import "tenViewController.h"
#import "peopleViewController.h"

@interface tenViewController ()

@end

@implementation tenViewController
@synthesize imagePicker,imageField;


- (IBAction)imageFromAlbum:(id)sender
{
    imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    imagePicker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    [self presentViewController:imagePicker animated:YES completion:nil];
    
}

- (IBAction)imageFromCamera:(id)sender
{
    imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    imagePicker.cameraDevice = UIImagePickerControllerCameraDeviceRear;
    [self presentViewController:imagePicker animated:YES completion:nil];
}


- (IBAction)doEditFieldDone:(id)sender {
    
    //（鍵盤消失）
    [sender resignFirstResponder];
}


-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo
{
    [imagePicker dismissModalViewControllerAnimated:YES];
    [imageField setImage:image];
    
}


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
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"SevenToEight"]){
        self.data.Global_Ten_Word = self.ten_big.text;
        self.data.Global_Ten_Image = self.imageField.image;
        peopleViewController *vc7_8 = segue.destinationViewController;
        vc7_8.data = self.data;
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
