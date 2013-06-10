//
//  ViewController.m
//  MultiFlowDemo
//
//  Created by Thomas Kelly on 20/02/2013.
//
//  Copyright 2013 Scott Logic
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import "ViewController.h"
#import "FlowManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    FlowManager *manager = [[FlowManager alloc] initWithFrame:self.view.frame];
    [self.view addSubview:manager];
    
    for (int i = 0; i < 9; i++)
    {
        UIView *newView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
        [newView setBackgroundColor:[UIColor redColor]];
        [manager addSubview:newView toFlowAtIndex:0];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
