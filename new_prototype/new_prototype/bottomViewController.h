//
//  bottomViewController.h
//  new_prototype
//
//  Created by 瀚陽 王 on 2014/8/12.
//  Copyright (c) 2014年 瀚陽 王. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Data.h"

@interface bottomViewController : UIViewController

<UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property (nonatomic, strong) UIImagePickerController *imagePicker;
@property (nonatomic, strong) IBOutlet UIImageView *imageField;

@property (weak, nonatomic) IBOutlet UITextField *bottom_text;
@property (weak, nonatomic) IBOutlet UITextField *year;
@property (weak, nonatomic) IBOutlet UITextField *month;
@property (weak, nonatomic) IBOutlet UITextField *day;

@property (weak, nonatomic) NSString *number;
@property (strong, nonatomic) Data *data;



@end
