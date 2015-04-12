//
//  ViewController.m
//  TouchStamp
//
//  Created by Rin Ishii on 2015/02/01.
//  Copyright (c) 2015年 Rin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    index=0;
    
    stamp[0]=@"インコ01.png";
    stamp[1]=@"インコ02.png";
    stamp[2]=@"インコ03.png";
    stamp[3]=@"インコ04.png";
    
    UIImage *image=[UIImage imageNamed:@"背景.png"];
    [haikei setImage:image];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch=[touches anyObject];
    CGPoint location=[touch locationInView:self.view];
    
    if(index>=1)
    {
        UIImage *image=[UIImage imageNamed:stamp[index-1]];
        imgView[count]=[[UIImageView alloc]initWithImage:image];
        imgView[count].center=CGPointMake(location.x,location.y);
        [self.view addSubview:imgView[count]];
        count=count+1;
    }
}

-(IBAction)stamp0
{
    index=1;
}

-(IBAction)stamp1
{
    index=2;
}

-(IBAction)stamp2
{
    index=3;
}

-(IBAction)stamp3
{
    index=4;
}

-(IBAction)back
{
    if(count>0){
    [imgView[count-1] removeFromSuperview];
    count=count-1;
    }
}

-(IBAction)photo
{
    UIImagePickerController *ipc=[[UIImagePickerController alloc]init];
    [ipc setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    [ipc setDelegate:self];
    [ipc setAllowsEditing:YES];
    [self presentViewController:ipc animated:YES completion:nil];
}

-(void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image=[info objectForKey:UIImagePickerControllerEditedImage];
    [haikei setImage:image];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)save
{
    CGRect rect=CGRectMake(0, 30, 320, 380);
    
    UIGraphicsBeginImageContext(rect.size);
    
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *capture=UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();

    UIImageWriteToSavedPhotosAlbum(capture, nil, nil, nil);
    UIGraphicsEndImageContext();
}

-(IBAction)clear
{
    for(int i=0 ; i<100 ; i=i+1)
    {
        if(count>0){
            [imgView[count-1] removeFromSuperview];
            count=count-1;}
    }
    UIImage *image=[UIImage imageNamed:@"背景.png"];
    [haikei setImage:image];
    
}


@end
