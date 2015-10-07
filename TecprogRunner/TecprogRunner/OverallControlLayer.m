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
    
    // Removing all layers from parent
    [self enumerateChildNodesWithName:@"layer" usingBlock:^(SKNode *node, BOOL *stop){
        
        SKSpriteNode *layer = (SKSpriteNode *) node;
        [layer removeFromParent];
        
    }];
    
    [self loadLayers];
}

-(void) loadLayers{
    
    // Get specific type of layer to change
    GameDataLayerType layerType = [GameData sharedGameData].layerActivated;
    
    [self putLayer:layerType];

}
-(void) putLayer:(GameDataLayerType) layerType{
    
    // Set layer size
    CGSize layerSize = CGSizeMake(DEFAULT_LAYER_WIDTH, DEFAULT_LAYER_HEIGHT);
    
    if(layerType == menu){
        // Initialize menu layer and activate
        self.menuLayer = [[MenuLayer alloc] initWithSize:layerSize];
        [self addChild:self.menuLayer];
        [self.menuLayer activateLayer];
    }
    else if(layerType == store){
        // Initialize store layer and activate
        self.storeLayer = [[StoreLayer alloc] initWithSize:layerSize];
        [self addChild:self.storeLayer];
        [self.storeLayer activateLayer];
    }
    else if(layerType == game){
        // Initialize game layer and activate
        self.gameLayer = [[GameLayer alloc] initWithSize:layerSize];
        [self addChild:self.gameLayer];
        [self.gameLayer activateLayer];
    }
    else if(layerType == settings){
        // Initialize settings layer and activate
        self.settingsLayer = [[SettingsLayer alloc] initWithSize:layerSize];
        [self addChild:self.settingsLayer];
        [self.settingsLayer activateLayer];
    }
    else if(layerType == trainingCenter){
        // Initialize settings layer and activate
        self.trainingCenterLayer = [[TrainingCenterLayer alloc] initWithSize:layerSize];
        [self addChild:self.trainingCenterLayer];
        [self.trainingCenterLayer activateLayer];
    }
    
//    else if(layerType == pause){
//        // Pause game layer
//    }
}



@end
