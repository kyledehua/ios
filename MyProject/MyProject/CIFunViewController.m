//
//  CIFunViewController.m
//  MyProject
//
//  Created by Chen on 3/8/14.
//  Copyright (c) 2014 DehuaLai. All rights reserved.
//

#import "CIFunViewController.h"

@interface CIFunViewController ()

@end

@implementation CIFunViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // 1
    NSString *filePath =
    [[NSBundle mainBundle] pathForResource:@"test" ofType:@"png"];
    NSURL *fileNameAndPath = [NSURL fileURLWithPath:filePath];
    
    CIImage *beginImage =
    [CIImage imageWithContentsOfURL:fileNameAndPath];
    
    // 1
    CIContext *context = [CIContext contextWithOptions:nil];
    
    CIFilter *filter = [CIFilter filterWithName:@"CISepiaTone"
                                  keysAndValues: kCIInputImageKey, beginImage,
                        @"inputIntensity", @0.8, nil];
    CIImage *outputImage = [filter outputImage];
    
    // 2
    CGImageRef cgimg =
    [context createCGImage:outputImage fromRect:[outputImage extent]];
    
    // 3
    UIImage *newImage = [UIImage imageWithCGImage:cgimg];
    self.TicketView.image = newImage;
    
    // 4
    CGImageRelease(cgimg);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
