//
//  peopleViewController.m
//  new_prototype
//
//  Created by 瀚陽 王 on 2014/8/10.
//  Copyright (c) 2014年 瀚陽 王. All rights reserved.
//

#import "peopleViewController.h"
#import "allViewController.h"

@interface peopleViewController ()

@end

@implementation peopleViewController
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
    if([segue.identifier isEqualToString:@"EightToNine"]){
        self.data.Global_People_Word = self.people_big.text;
        self.data.Global_People_Image = self.imageField.image;
        allViewController *vc8_9 = segue.destinationViewController;
        vc8_9.data = self.data;
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
