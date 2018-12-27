//
//  ViewController.m
//  LCUtils
//
//  Created by LiCheng on 2018/12/27.
//  Copyright © 2018 LiCheng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSLog(@"111 = %@", [NSString lc_tempPath]);
    
    NSLog(@"222 = %@", [@"xxx" lc_appendDocumentsPath]);
}


@end
