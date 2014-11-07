//
//  Data.h
//  new_prototype
//
//  Created by 瀚陽 王 on 2014/9/16.
//  Copyright (c) 2014年 瀚陽 王. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Data : NSObject


//1
@property (nonatomic , strong) NSString *Global_Cover_Name ;
@property (nonatomic , strong) UIImage *Global_Cover_Image;

//2
@property (nonatomic , strong) NSString *Global_Weather ;
@property (nonatomic , strong) NSString *Global_Emotion ;
@property (nonatomic , strong) NSString *Global_Together;

//3
@property (nonatomic , strong) NSString *Global_Hole_Word;
@property (nonatomic , strong) UIImage *Global_Hole_Image;

//4
@property (nonatomic , strong) NSString *Global_Mountaion_Word;
@property (nonatomic , strong) UIImage *Global_Mountain_Image;

//5
@property (nonatomic , strong) NSString *Global_Festival_Word;
@property (nonatomic , strong) UIImage *Global_Festival_Image;

//6
@property (nonatomic , strong) NSString *Global_Uni_Word;
@property (nonatomic , strong) UIImage *Global_Uni_Image;

//7
@property (nonatomic , strong) NSString *Global_Ten_Word;
@property (nonatomic , strong) UIImage *Global_Ten_Image;

//8
@property (nonatomic , strong) NSString *Global_People_Word;
@property (nonatomic , strong) UIImage *Global_People_Image;

//9
@property (nonatomic , strong) UIImage *Global_Together_Image;

//10
@property (nonatomic , strong) NSString *Global_Creator_Word;
@property (nonatomic , strong) UIImage *Global_Back_Image;

//number
@property (nonatomic , weak) NSString *final_number;




@end
