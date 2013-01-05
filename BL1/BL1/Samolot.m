//
//  Samolot.m
//  BL1
//
//  Created by Kamil Zietek on 04.01.2013.
//  Copyright (c) 2013 Kamil Zietek. All rights reserved.
//

#import "Samolot.h"
#import <stdlib.h>

@implementation Samolot

@synthesize ciagSilnika;
@synthesize lotki;
@synthesize klapy;
@synthesize sterKierunku;
@synthesize sterWysokosci;
@synthesize podwozie;

@synthesize zgon;

- (id) init;
{
	self = [super init];
	if (self != nil) {
		[self resetuj];
	}
	return self;
}

-(void) resetuj
{
	stan = @"Stoi na ziemi.";
	
	//elementy pokladowe
	ciagSilnika = 0;
	lotki = 0;
	klapy = true;
	sterKierunku = 0;
	sterWysokosci = 0;
	podwozie = true;
	
	//zachowanie samolotu
	wysokosc = 0;
	zgon = false;
}

-(NSString*)zwrocOpis
{
	[self uaktualnijStan];
	
	char buffer[2048];
	int offset;
	
	if (!zgon)
	{
	offset = sprintf(buffer, "Stan:\t\t\t%s\n",[stan UTF8String]);
	offset += sprintf(buffer+offset, "-------------\n");
	offset += sprintf(buffer+offset, "Ciag silnika:\t%f\n", ciagSilnika);
	offset += sprintf(buffer+offset, "Lotki:\t\t\t%f\n",lotki);
	offset += sprintf(buffer+offset, "Klapy:\t\t\t%s\n",klapy?"tak":"nie");
	offset += sprintf(buffer+offset, "Ster kierunku:\t%f\n",sterKierunku);
	offset += sprintf(buffer+offset, "Ster wysokosci:\t%f\n",sterWysokosci);
	offset += sprintf(buffer+offset, "Podwozie:\t\t%s\n",podwozie?"tak":"nie");
	offset += sprintf(buffer+offset, "-------------\n");
	offset += sprintf(buffer+offset, "Wysokosc:\t%f\n",wysokosc);
	}
	else
	{
		offset = sprintf(buffer, "10 kwietnia 2010.\nTu-154 gotowy do lotu...\nPrzejmij stery, ide po kawe...\nNieeeeeee!!!\n(Zgon.)",[stan UTF8String]);
	}

	return [NSString stringWithCString:buffer encoding:NSASCIIStringEncoding];
}

-(void)uaktualnijStan
{
	float opor = (-10)*podwozie + (-7)*klapy;
	float dodatkoweWznoszenie = 7*klapy;
	float poprzedniaWysokosc = wysokosc;
	wysokosc += sinf(sterWysokosci) * (ciagSilnika + opor) - 10.0f + dodatkoweWznoszenie;
	if (wysokosc < -20.0f)
	{
		stan = @"Wrak.";
		zgon = true;
		return;
	}
	wysokosc = (wysokosc < 0)?0:wysokosc;
	float deltaWysokosci = wysokosc - poprzedniaWysokosc;
	
	if(ciagSilnika == 0)
	{
		if (podwozie == true && wysokosc == 0)
		{
			stan = @"Stoi na ziemi.";
			return;
		}
		
		if (podwozie == false && wysokosc == 0)
		{
			stan = @"Lezy na brzuchu niczym wieloryb.";
			return;
		}
		
		if(wysokosc > 0)
		{
			stan = @"Spada.";
			return;
		}

	}

	if(ciagSilnika > 0)
	{
		if(podwozie == true && wysokosc == 0)
		{
			stan = @"Jedzie po ziemi.";
			return;
		}
		if(podwozie == false && wysokosc == 0)
		{
			stan = @"Szoruje brzuchem po ziemi.";
			return;
		}
		if(podwozie == false && wysokosc > 0)
		{
			stan = @"Leci.";
			return;
		}
		if(podwozie == true && wysokosc > 0 && deltaWysokosci > 0)
		{
			stan = @"Startuje.";
			return;
		}
		if(podwozie == true && wysokosc > 0 && deltaWysokosci < 0)
		{
			stan = @"Laduje.";
			return;
		}
	}
	
}

- (void)dealloc
{
	[super dealloc];
}

@end

