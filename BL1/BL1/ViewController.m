//
//  ViewController.m
//  BL1
//
//  Created by Kamil Zietek on 05.01.2013.
//  Copyright (c) 2013 Kamil Zietek. All rights reserved.
//

#import "ViewController.h"
#import "Samolot.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize tu154;

@synthesize wyswietlacz;
@synthesize nowySamolotBtn;
@synthesize kontrolki;


- (void)viewDidLoad
{
    [super viewDidLoad];
	tu154 = [[Samolot alloc] init];
	wyswietlacz.text = [tu154 zwrocOpis];
	
	time = [NSTimer scheduledTimerWithTimeInterval:0.3
									 target:self
								   selector:@selector(uaktualnijModel)
								   userInfo:nil
									repeats:YES];
}

- (IBAction)uaktualnijDane:(id)sender
{
	switch ([sender tag]) {
		case 1: //ciag silnika
			tu154.ciagSilnika = [((UISlider*)sender) value]; break;
		case 2: //lotki
			tu154.lotki = [((UISlider*)sender) value]; break;
		case 3: //klapy
			tu154.klapy = [((UISwitch*)sender) isOn]; break;
		case 4: //sterKierunku
			tu154.sterKierunku = [((UISlider*)sender) value]; break;
		case 5: //sterWysokosci
			tu154.sterWysokosci = [((UISlider*)sender) value]; break;
		case 6: //podwozie
			tu154.podwozie = [((UISwitch*)sender) isOn]; break;
		default:
			break;
	}
}

- (void)uaktualnijModel
{
	wyswietlacz.text = [tu154 zwrocOpis];
	if(tu154.zgon)
	{
		/*
		for (int i=1; i<=6; i++)
		{
			[self.view viewWithTag:i].hidden = YES;
		}
		 */
		kontrolki.hidden = YES;
		nowySamolotBtn.hidden = NO;
	}
}

- (IBAction)kupNowySamolot:(id)sender
{
	for (int i=1; i<=6; i++)
	{
		//[self.view viewWithTag:i].hidden = NO;
		
		switch (i) {
			case 1: //ciag silnika
			case 2: //lotki
			case 4: //sterKierunku
			case 5: //sterWysokosci
				((UISlider*)[self.view viewWithTag:i]).value = 0; break;
			case 3: //klapy
			case 6: //podwozie
				((UISwitch*)[self.view viewWithTag:i]).on = YES; break;
			default:
				break;
		}
	}
	kontrolki.hidden = NO;
	nowySamolotBtn.hidden = YES;
	[tu154 resetuj];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

	[tu154 release];
}
@end
