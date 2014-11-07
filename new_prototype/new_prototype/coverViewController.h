//
//  coverViewController.h
//  new_prototype
//
//  Created by 瀚陽 王 on 2014/8/8.
//  Copyright (c) 2014年 瀚陽 王. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Data.h"
@interface coverViewController : UIViewController
<UINavigationControllerDelegate,UIImagePickerControllerDelegate>




//imagepicker
@property (nonatomic, strong) UIImagePickerController *imagePicker;
@property (nonatomic, strong) IBOutlet UIImageView *imageField;
@property (weak, nonatomic) IBOutlet UITextField *cover_name;

@property (strong, nonatomic) Data *data;





@end
