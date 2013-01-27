//
//  ButtonController.m
//  BL2
//
//  Created by Kamil Zietek on 27.01.2013.
//  Copyright (c) 2013 Kamil Zietek. All rights reserved.
//

#import "ButtonController.h"

@interface ButtonController ()

@end

@implementation ButtonController

@synthesize isFirstState;
@synthesize stateDisplayer;
@synthesize btnChangeState;
@synthesize btnNextScreen;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        isFirstState = YES;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)changeState:(id)sender
{
	isFirstState = !isFirstState;
	if(isFirstState)
		stateDisplayer.text = @"Second State";
	else
		stateDisplayer.text = @"First State";
}

@end
