//
//  ViewController.m
//  CCPExtension
//
//  Created by Ceair on 17/6/27.
//  Copyright © 2017年 ccp. All rights reserved.
//

#import "ViewController.h"
#import "NSArray+CCPArray.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *arr = @[@"0",@"0"];
    NSArray *maparr = [arr map:^id(id value) {
        return @"1";
    }];
    NSLog(@"maparr--%@----arr---%@",maparr,arr);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
