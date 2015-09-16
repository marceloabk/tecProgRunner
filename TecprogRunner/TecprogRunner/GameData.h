//
//  GameData.h
//  TecprogRunner
//
//  Created by Henrique Dutra on 15/09/15.
//  Copyright (c) 2015 Bepid-UnB. All rights reserved.
//

// GameData singleton that will save user data, and control layers inside the OverallScene

#import <Foundation/Foundation.h>

@interface GameData : NSObject <NSCoding>

+(instancetype)sharedGameData;

@property (nonatomic) int layerActivated;

-(void) start;
-(void) save;

@end
