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
        
    }
    return self;
}

-(void) changeLayer{
    
    [self enumerateChildNodesWithName:@"layer" usingBlock:^(SKNode *node, BOOL *stop){
        
        SKSpriteNode *layer = (SKSpriteNode *) node;
        [layer removeFromParent];
        
    }];
    
    [self loadLayers];
}

-(void) loadLayers{
    
    GameDataLayerType layerType = [GameData sharedGameData].layerActivated;
    
    [self putLayer:layerType];

}
-(void) putLayer:(GameDataLayerType) layerType{
    
    CGSize layerSize = CGSizeMake(667, 375);
    
    if(layerType == menu){
        self.menuLayer = [[MenuLayer alloc] initWithSize:layerSize];
        [self addChild:self.menuLayer];
        [self.menuLayer activateLayer];
    }
    else if(layerType == store){
        self.storeLayer = [[StoreLayer alloc] initWithSize:layerSize];
        [self addChild:self.storeLayer];
        [self.storeLayer activateLayer];
    }
    else if(layerType == game){
        self.gameLayer = [[GameLayer alloc] initWithSize:layerSize];
        [self addChild:self.gameLayer];
        [self.gameLayer activateLayer];
    }
    else if(layerType == settings){
        self.settingsLayer = [[SettingsLayer alloc] initWithSize:layerSize];
        [self addChild:self.settingsLayer];
        [self.settingsLayer activateLayer];
    }
}



@end
