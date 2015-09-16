//
//  OverallControlLayer.m
//  TecprogRunner
//
//  Created by Henrique Dutra on 15/09/15.
//  Copyright (c) 2015 Bepid-UnB. All rights reserved.
//

#import "OverallControlLayer.h"
#import "GameData.h"

@implementation OverallControlLayer

-(instancetype) initWithSize: (CGSize) size{
    
    if(self = [super init]){

        self.menuLayer = [[MenuLayer alloc] initWithSize:size];
    
        self.menuLayer.name = @"name";
        
        [self putLayer];
        
    }
    return self;
}

-(void) changeLayer{
    
    [self enumerateChildNodesWithName:@"layer" usingBlock:^(SKNode *node, BOOL *stop){
        
        SKSpriteNode *layer = (SKSpriteNode *) node;
        [layer removeFromParent];
        
    }];
    
    [self putLayer];
    
}

-(void) putLayer{
    
    if([GameData sharedGameData].layerActivated == 1){
        [self addChild:self.menuLayer];
        [self.menuLayer activateLayer];
        
    }
    else{
    }
}

@end
