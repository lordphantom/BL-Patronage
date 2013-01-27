//
//  ButtonController.h
//  BL2
//
//  Created by Kamil Zietek on 27.01.2013.
//  Copyright (c) 2013 Kamil Zietek. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ButtonController : UIViewController

@property(atomic, assign) BOOL isFirstState;
@property(nonatomic, strong) IBOutlet UILabel* stateDisplayer;
@property(nonatomic, strong) IBOutlet UIButton* btnNextScreen;
@property(nonatomic, strong) IBOutlet UIButton* btnChangeState;

- (IBAction)changeState:(id)sender;

@end
