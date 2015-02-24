//
//  ViewController.h
//  FaceppPhotoPickerDemo
//
//  Created by youmu on 12-12-5.
//  Copyright (c) 2012年 Megvii. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FaceppAPI.h"

#define USE_FACEPP_OFFLINE_DETECTION

@interface ViewController : UIViewController<UINavigationControllerDelegate, UIImagePickerControllerDelegate> {
    IBOutlet UIImageView *imageView;
    IBOutlet UIButton *button;
    UIImagePickerController *imagePicker;
}
@property (retain, nonatomic) IBOutlet UILabel *talk;
@property (retain, nonatomic) IBOutlet UIImageView *Sanguo;
@property (retain, nonatomic) IBOutlet UIImageView *Original;
@property (retain, nonatomic) IBOutlet UIImageView *startImageView;
@property (retain, nonatomic) IBOutlet UIButton *startButton;
@property (retain, nonatomic) IBOutlet UIImageView *wood1;
@property (retain, nonatomic) IBOutlet UIImageView *wood2;
@property (retain, nonatomic) IBOutlet UILabel *myTitle;
@property (retain, nonatomic) IBOutlet UIScrollView *scrollView;
@property (retain, nonatomic) IBOutlet UIButton *repickButton;
@property (retain, nonatomic) IBOutlet UIImageView *myFrame;
@property (retain, nonatomic) IBOutlet UIButton *scrollButton;
@property (retain, nonatomic) IBOutlet UIButton *shareButton;
@property (retain, nonatomic) UIImage *imageToSend;
@property (retain, nonatomic) IBOutlet UIButton *instructionButton;
@property (retain, nonatomic) IBOutlet UIImageView *instructionImage;

-(IBAction)pickFromCameraButtonPressed:(id)sender;
- (IBAction)repick:(id)sender;
-(void) detectWithImage: (UIImage*) image;
- (IBAction)scrollButtonPressed:(id)sender;
- (IBAction)wechatPressed:(id)sender;
- (IBAction)instructionButtonPressed:(id)sender;


@end
