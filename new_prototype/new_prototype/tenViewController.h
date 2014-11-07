//
//  tenViewController.h
//  new_prototype
//
//  Created by 瀚陽 王 on 2014/8/10.
//  Copyright (c) 2014年 瀚陽 王. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Data.h"

@interface tenViewController : UIViewController
<UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property (nonatomic, strong) UIImagePickerController *imagePicker;
@property (nonatomic, strong) IBOutlet UIImageView *imageField;

@property (weak, nonatomic) IBOutlet UITextView *ten_big;

@property (strong, nonatomic) Data *data;

@end
