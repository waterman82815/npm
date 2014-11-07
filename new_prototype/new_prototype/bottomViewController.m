//
//  bottomViewController.m
//  new_prototype
//
//  Created by 瀚陽 王 on 2014/8/12.
//  Copyright (c) 2014年 瀚陽 王. All rights reserved.
//

#import "bottomViewController.h"
#import "final_ebook_ViewController.h"



@interface bottomViewController ()

@end

@implementation bottomViewController
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
        }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

-(void) uploadData{
    //NSLog(@"into upload");
    
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    [request setHTTPShouldHandleCookies:NO];
    [request setTimeoutInterval:30];
    [request setHTTPMethod:@"POST"];
    // RP: Empaquetando datos
    NSMutableDictionary* _params = [[NSMutableDictionary alloc] init];
    
    
    // waterman test
    
    [_params setObject:[NSString stringWithFormat:@"%@", self.data.Global_Cover_Name] forKey:@"book[index_word]"];
    [_params setObject:[NSString stringWithFormat:@"%@", self.data.Global_Weather] forKey:@"book[second_weather]"];
    [_params setObject:[NSString stringWithFormat:@"%@", self.data.Global_Emotion] forKey:@"book[second_mood]"];
    
    [_params setObject:[NSString stringWithFormat:@"%@", self.data.Global_Hole_Word] forKey:@"book[pages_attributes][1411060112880][word]"];
    [_params setObject:[NSString stringWithFormat:@"%@", self.data.Global_Mountaion_Word] forKey:@"book[pages_attributes][1411060113747][word]"];
    [_params setObject:[NSString stringWithFormat:@"%@", self.data.Global_Festival_Word] forKey:@"book[pages_attributes][1411060115055][word]"];
    [_params setObject:[NSString stringWithFormat:@"%@", self.data.Global_Uni_Word] forKey:@"book[pages_attributes][1411060117432][word]"];
    [_params setObject:[NSString stringWithFormat:@"%@", self.data.Global_Ten_Word] forKey:@"book[pages_attributes][1411060118480][word]"];
    [_params setObject:[NSString stringWithFormat:@"%@", self.data.Global_People_Word] forKey:@"book[pages_attributes][1411060121197][word]"];
    
    
    [_params setObject:[NSString stringWithFormat:@"%@", self.data.Global_Hole_Word] forKey:@"book[pages_attributes][1411060112880][title]"];
    [_params setObject:[NSString stringWithFormat:@"%@", self.data.Global_Mountaion_Word] forKey:@"book[pages_attributes][1411060113747][title]"];
    [_params setObject:[NSString stringWithFormat:@"%@", self.data.Global_Festival_Word] forKey:@"book[pages_attributes][1411060115055][title]"];
    [_params setObject:[NSString stringWithFormat:@"%@", self.data.Global_Uni_Word] forKey:@"book[pages_attributes][1411060117432][title]"];
    [_params setObject:[NSString stringWithFormat:@"%@", self.data.Global_Ten_Word] forKey:@"book[pages_attributes][1411060118480][title]"];
    [_params setObject:[NSString stringWithFormat:@"%@", self.data.Global_People_Word] forKey:@"book[pages_attributes][1411060121197][title]"];
    
    
    
    
    [_params setObject:[NSString stringWithFormat:@"%@", self.data.Global_Together] forKey:@"book[second_friend]"];
    [_params setObject:[NSString stringWithFormat:@"%@", self.data.Global_Creator_Word] forKey:@"book[creator]"];
    
    
    
    // the boundary string : a random string, that will not repeat in post data, to separate post data fields.
    NSString *BoundaryConstant = @"V2ymHFg03ehbqgZCaKO6jy";
    
    // string constant for the post parameter 'file'
    
    //image param
    NSString *FileParamConstant = @"book[index_image]";
    NSString *FileParamConstant2 = @"book[together_photo]";
    NSString *FileParamConstant3 = @"book[last_image]";
    NSString *FileParamConstant4 = @"book[pages_attributes][1411060112880][image]";
    NSString *FileParamConstant5 = @"book[pages_attributes][1411060113747][image]";
    NSString *FileParamConstant6 = @"book[pages_attributes][1411060115055][image]";
    NSString *FileParamConstant7 = @"book[pages_attributes][1411060117432][image]";
    NSString *FileParamConstant8 = @"book[pages_attributes][1411060118480][image]";
    NSString *FileParamConstant9 = @"book[pages_attributes][1411060121197][image]";
    
    
    
    
    //RP: Configurando la dirección
    NSURL *requestURL = [[NSURL alloc] initWithString:@"http://npm-ebook.herokuapp.com/books"];
    
    // set Content-Type in HTTP header
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", BoundaryConstant];
    [request setValue:contentType forHTTPHeaderField: @"Content-Type"];
    
    
    // post body
    NSMutableData *body = [NSMutableData data];
    
    // add params (all params are strings)
    for (NSString *param in _params) {
        [body appendData:[[NSString stringWithFormat:@"--%@\r\n", BoundaryConstant] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n", param] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"%@\r\n", [_params objectForKey:param]] dataUsingEncoding:NSUTF8StringEncoding]];
    }
    
    
    
    // add image data 1
    UIImage *test_image = self.data.Global_Cover_Image;
    NSData *imageData = UIImageJPEGRepresentation(test_image, 1.0);
    
    if (imageData) {
        printf("appending image data1\n");
        [body appendData:[[NSString stringWithFormat:@"--%@\r\n", BoundaryConstant] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=%@; filename=\"image.jpg\"\r\n", FileParamConstant] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[@"Content-Type: image/jpeg\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:imageData];
        [body appendData:[[NSString stringWithFormat:@"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    }
    //
    
    // add image data 2
    UIImage *test_image2 = self.data.Global_Together_Image;
    NSData *imageData2 = UIImageJPEGRepresentation(test_image2, 1.0);
    
    if (imageData2) {
        printf("appending image data2\n");
        [body appendData:[[NSString stringWithFormat:@"--%@\r\n", BoundaryConstant] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=%@; filename=\"image.jpg\"\r\n", FileParamConstant2] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[@"Content-Type: image/jpeg\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:imageData2];
        [body appendData:[[NSString stringWithFormat:@"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    }
    //
    
    
    // add image data 3
    UIImage *test_image3 = self.data.Global_Back_Image;
    NSData *imageData3 = UIImageJPEGRepresentation(test_image3, 1.0);
    
    if (imageData3) {
        printf("appending image data3\n");
        [body appendData:[[NSString stringWithFormat:@"--%@\r\n", BoundaryConstant] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=%@; filename=\"image.jpg\"\r\n", FileParamConstant3] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[@"Content-Type: image/jpeg\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:imageData3];
        [body appendData:[[NSString stringWithFormat:@"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    }
    //
    
    
    
    // add image hole
    UIImage *test_image4 = self.data.Global_Hole_Image;
    NSData *imageData4 = UIImageJPEGRepresentation(test_image4, 1.0);
    
    
    if (imageData4) {
        printf("appending image data4\n");
        [body appendData:[[NSString stringWithFormat:@"--%@\r\n", BoundaryConstant] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=%@; filename=\"image.jpg\"\r\n", FileParamConstant4] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[@"Content-Type: image/jpeg\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:imageData4];
        [body appendData:[[NSString stringWithFormat:@"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    }
    //
    
    // add image mountain
    UIImage *test_image5 = self.data.Global_Mountain_Image;
    NSData *imageData5 = UIImageJPEGRepresentation(test_image5, 1.0);
    
    if (imageData5) {
        printf("appending image data5\n");
        [body appendData:[[NSString stringWithFormat:@"--%@\r\n", BoundaryConstant] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=%@; filename=\"image.jpg\"\r\n", FileParamConstant5] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[@"Content-Type: image/jpeg\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:imageData5];
        [body appendData:[[NSString stringWithFormat:@"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    }
    //
    
    // add image festival
    UIImage *test_image6 = self.data.Global_Festival_Image;
    NSData *imageData6 = UIImageJPEGRepresentation(test_image6, 1.0);
    
    if (imageData6) {
        printf("appending image data6\n");
        [body appendData:[[NSString stringWithFormat:@"--%@\r\n", BoundaryConstant] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=%@; filename=\"image.jpg\"\r\n", FileParamConstant6] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[@"Content-Type: image/jpeg\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:imageData6];
        [body appendData:[[NSString stringWithFormat:@"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    }
    //
    
    // add image uni
    UIImage *test_image7 = self.data.Global_Uni_Image;
    NSData *imageData7 = UIImageJPEGRepresentation(test_image7, 1.0);
    
    if (imageData7) {
        printf("appending image data7\n");
        [body appendData:[[NSString stringWithFormat:@"--%@\r\n", BoundaryConstant] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=%@; filename=\"image.jpg\"\r\n", FileParamConstant7] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[@"Content-Type: image/jpeg\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:imageData7];
        [body appendData:[[NSString stringWithFormat:@"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    }
    //
    
    // add image ten
    UIImage *test_image8 = self.data.Global_Ten_Image;
    NSData *imageData8 = UIImageJPEGRepresentation(test_image8, 1.0);
    
    if (imageData8) {
        printf("appending image data8\n");
        [body appendData:[[NSString stringWithFormat:@"--%@\r\n", BoundaryConstant] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=%@; filename=\"image.jpg\"\r\n", FileParamConstant8] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[@"Content-Type: image/jpeg\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:imageData8];
        [body appendData:[[NSString stringWithFormat:@"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    }
    //
    
    // add image people
    UIImage *test_image9 = self.data.Global_People_Image;
    NSData *imageData9 = UIImageJPEGRepresentation(test_image9, 1.0);
    
    if (imageData9) {
        printf("appending image data9\n");
        [body appendData:[[NSString stringWithFormat:@"--%@\r\n", BoundaryConstant] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=%@; filename=\"image.jpg\"\r\n", FileParamConstant9] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[@"Content-Type: image/jpeg\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:imageData9];
        [body appendData:[[NSString stringWithFormat:@"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    }
    //
    
    
    
    
    
    [body appendData:[[NSString stringWithFormat:@"--%@--\r\n", BoundaryConstant] dataUsingEncoding:NSUTF8StringEncoding]];
    [request setHTTPBody:body];
    
    // set the content-length
    NSString *postLength = [NSString stringWithFormat:@"%d", [body length]];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    
    // set URL
    [request setURL:requestURL];
    
    NSURLResponse *response = nil;
    NSError *err = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&err];
    NSString *str = [[NSString alloc] initWithBytes:[data bytes] length:[data length] encoding:NSUTF8StringEncoding];
    NSLog(@"Response : %@",str);
    
    NSString *search = @"/ebook/";
    NSRange range = [str rangeOfString:search];
    
    NSLog(@"位置：%d || 字串相同長度：%d", range.location, range.length);
    self.number = [str substringWithRange:NSMakeRange(range.location+range.length, 2)];
    NSLog(@"NUMBER:%@",self.number );
    
    //[self performSegueWithIdentifier:@"TenToFinal" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"TenToFinal"]){
        
        self.data.Global_Back_Image = self.imageField.image;
        self.data.Global_Creator_Word=self.bottom_text.text;

        //[self uploadData];
        self.data.final_number=self.number;

        final_ebook_ViewController *vc10_f = segue.destinationViewController;
        vc10_f.data = self.data;
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
