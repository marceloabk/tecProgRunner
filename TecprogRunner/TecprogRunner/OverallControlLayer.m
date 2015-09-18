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

        [self loadLayers];
        [self putLayer];
        
    }
    return self;
}

-(void) changeLayer{
    
    [self enumerateChildNodesWithName:@"layer" usingBlock:^(SKNode *node, BOOL *stop){
        
        SKSpriteNode *layer = (SKSpriteNode *) node;
        [layer removeFromParent];
        
    }];
    
    [self loadLayers];
    [self putLayer];
    
}

-(void) loadLayers{

    CGSize layerSize = CGSizeMake(667, 375);
    
    self.menuLayer = [[MenuLayer alloc] initWithSize:layerSize];
    self.storeLayer = [[StoreLayer alloc] initWithSize:layerSize];
    self.gameLayer = [[GameLayer alloc] initWithSize:layerSize];
    
    self.menuLayer.name = @"layer";
    self.storeLayer.name = @"layer";
    self.gameLayer.name = @"layer";

}
-(void) putLayer{
    
    if([GameData sharedGameData].layerActivated == menu){
        [self addChild:self.menuLayer];
        [self.menuLayer activateLayer];
    }
    else if([GameData sharedGameData].layerActivated == store){
        [self addChild:self.storeLayer];
        [self.storeLayer activateLayer];
    }
    else if([GameData sharedGameData].layerActivated == game){
        [self addChild:self.gameLayer];
        [self.storeLayer activateLayer];
    }
}



@end
