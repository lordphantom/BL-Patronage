//
//  Samolot.h
//  BL1
//
//  Created by Kamil Zietek on 04.01.2013.
//  Copyright (c) 2013 Kamil Zietek. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Samolot : NSObject
{
	@private
	NSString *stan;
	float wysokosc;
}

@property(assign) float ciagSilnika;
@property(assign) float lotki;
@property(assign) bool klapy;
@property(assign) float sterKierunku;
@property(assign) float sterWysokosci;
@property(assign) bool podwozie;

@property(assign) bool zgon;

-(id) init;
-(void)dealloc;

-(NSString*)zwrocOpis;
-(void)resetuj;

@end
