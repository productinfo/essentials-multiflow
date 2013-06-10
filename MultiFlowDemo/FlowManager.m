//
//  FlowManager.m
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

#import "FlowManager.h"

@interface FlowManager () {
    NSMutableArray *flowLayouts;
    UIView *viewInProgress;
}
@end

@implementation FlowManager

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        flowLayouts = [NSMutableArray new];
        for (int i = 0; i < 3; i++)
        {
            CGSize flowSize = CGSizeMake(frame.size.width/3, frame.size.height);
            CGRect flowFrame = CGRectMake(i*flowSize.width, 0, flowSize.width, flowSize.height);
            [self createFlowWithFrame:flowFrame];
        }
    }
    return self;
}

-(void)createFlowWithFrame:(CGRect)frame
{
    SEssentialsFlowLayout *flow = [[SEssentialsFlowLayout alloc] initWithFrame:frame];
    flow.flowDelegate = self;
    flow.dragsOutsideBounds = YES;
    flow.clipsToBounds = NO;
    [flowLayouts addObject:flow];
    [self addSubview:flow];
}

-(void)addSubview:(UIView*)subview toFlowAtIndex:(int)index
{
    SEssentialsFlowLayout *flow = [flowLayouts objectAtIndex:index];
    [flow addManagedSubview:subview];
}

#pragma mark - Flow Delegate Methods

- (void)didBeginEditInFlowLayout:(SEssentialsFlowLayout *)flow
{
    for (SEssentialsFlowLayout *otherFlow in flowLayouts)
    {
        if (flow != otherFlow)
        {
            [otherFlow beginEditMode];
        }
    }
    
    [self bringSubviewToFront:flow];
}

- (void)didEndEditInFlowLayout:(SEssentialsFlowLayout *)flow
{
    for (SEssentialsFlowLayout *otherFlow in flowLayouts)
    {
        if (flow != otherFlow)
        {
            [otherFlow endEditMode];
        }
    }
}

-(void)flowLayout:(SEssentialsFlowLayout *)sourceFlow didDragView:(UIView *)view
{
    CGPoint dragPosition = [sourceFlow convertPoint:view.center toView:self];
    for (SEssentialsFlowLayout *destinationFlow in flowLayouts)
    {
        if (destinationFlow != sourceFlow)
        {
            if(CGRectContainsPoint(destinationFlow.frame, dragPosition))
            {
                //Convert the center to the new frame of reference
                view.center = [self convertPoint:dragPosition toView:destinationFlow];
                
                //Swap owners
                [sourceFlow unmanageSubview:view];
                [destinationFlow addManagedSubview:view];
            }
        }
    }
}


-(BOOL)flowLayout:(SEssentialsFlowLayout *)flow shouldMoveView:(UIView *)view
{
    if (!viewInProgress)
        viewInProgress = view;
    
    return view == viewInProgress;
}

-(void)flowLayout:(SEssentialsFlowLayout *)flow didMoveView:(UIView *)view
{
    viewInProgress = nil;
}

-(void)flowLayout:(SEssentialsFlowLayout *)flow didNotMoveView:(UIView *)view
{
    viewInProgress = nil;
}
@end