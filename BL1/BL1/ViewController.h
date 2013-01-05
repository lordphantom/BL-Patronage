//
//  ViewController.h
//  BL1
//
//  Created by Kamil Zietek on 05.01.2013.
//  Copyright (c) 2013 Kamil Zietek. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Samolot;

@interface ViewController : UIViewController
{
	@private
	NSTimer* time;
}

@property(nonatomic, retain) Samolot* tu154;

@property(nonatomic, strong) IBOutlet UILabel* wyswietlacz;
@property(nonatomic, strong) IBOutlet UIButton* nowySamolotBtn;
@property(nonatomic, strong) IBOutlet UIView* kontrolki;

- (IBAction)uaktualnijDane:(id)sender;
- (IBAction)kupNowySamolot:(id)sender;

@end
