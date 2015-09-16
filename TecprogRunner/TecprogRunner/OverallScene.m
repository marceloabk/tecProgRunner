//
//  OverallScene.m
//  TecprogRunner
//
//  Created by Henrique Dutra on 15/09/15.
//  Copyright (c) 2015 Bepid-UnB. All rights reserved.
//

#import "OverallScene.h"

@implementation OverallScene

- (instancetype)initWithSize:(CGSize)size{
    
    self = [super initWithSize:size];
    
    if(self){
        
        self.gameControlLayer = [[GameControlLayer alloc] initWithSize:size];
        self.overallControlLayer = [[OverallControlLayer alloc] initWithSize:size];
        
        [self addChild:self.gameControlLayer];
        [self addChild:self.overallControlLayer];
        
    }
    return self;
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{

    
}

-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{

}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{

}

@end