//
//  TrainingCenterBackground.m
//  TecprogRunner
//
//  Contain a background for Training Center
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "TrainingCenterBackground.h"
#import "TrainingCenterBackground.h"
#import "SpriteNode.h"

@implementation TrainingCenterBackground
-(instancetype) initWithSize:(CGSize)size{
    
    self = [super init];
    
    if(self != nil){
        [self addBackgroundSprite];
    }else{
        NSException *exception = [NSException exceptionWithName:@"Training Center Background" reason:@"Can't initialize training center background" userInfo:nil];
        [exception raise];
    }
    
    return self;
}


-(void) addBackgroundSprite{

    SpriteNode *background = [SpriteNode spriteNodeWithImageNamed:@"background" andPosition:CGPointZero
                                               anchorPoint:CGPointZero andScale:0.5 andZPosition:-1];
    
    [self addChild:background];
    
}



@end
