//
//  ViewController.h
//  TouchStamp
//
//  Created by Rin Ishii on 2015/02/01.
//  Copyright (c) 2015年 Rin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    IBOutlet UIImageView *haikei;
    
    UIImageView *imgView[100];
    int count;
    
    int index;
    NSString *stamp[4];
}
-(IBAction)stamp0;
-(IBAction)stamp1;
-(IBAction)stamp2;
-(IBAction)stamp3;

-(IBAction)back;
-(IBAction)clear;
-(IBAction)photo;
-(IBAction)save;


@end