//
//  OverallControlLayer.m
//  TecprogRunner
//
//
//  Control the layers in the game and their disposition
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "OverallControlLayer.h"
#import "GameData.h"

@implementation OverallControlLayer

-(instancetype) initWithSize:(CGSize)size{
    
    DebugLog(@"Initializing");
    if(self = [super init]){

        [self loadLayers];
        
    }else{
        // Exception
    }
    
    return self;
}

-(void) changeLayer{
    
    DebugLog(@"Removing layers...");
    // Removing all layers from parent
    [self enumerateChildNodesWithName:@"layer" usingBlock:^(SKNode *node, BOOL *stop){
        
        SKSpriteNode *layer = (SKSpriteNode *) node;
        [layer removeFromParent];
        
    }];
    
    [self loadLayers];
}

-(void) loadLayers{
    
    DebugLog(@"Loading layers...");
    // Get specific type of layer to change
    GameDataLayerType layerType = [GameData sharedGameData].layerActivated;
    
    [self putLayer:layerType];

}

-(void) putLayer:(GameDataLayerType)layerType{
    
    // Set layer size
    CGSize layerSize = CGSizeMake(DEFAULT_LAYER_WIDTH, DEFAULT_LAYER_HEIGHT);
    
    if(layerType == menu){
        DebugLog(@"putting menu layer...");
        [self presentMenuLayer:layerSize];
        
    }else if(layerType == store){
        [self presentStoreLayer:layerSize];
        
    }else if(layerType == game){
        DebugLog(@"putting game layer...");
        [self presentGameLayer:layerSize];
        
    }else if(layerType == settings){
        DebugLog(@"putting settings layer...");
        [self presentSettingsLayer:layerSize];
        
    }else if(layerType == trainingCenter){
        DebugLog(@"putting training center layer");
        [self presentTrainingCenterLayer:layerSize];
        
    }else{
        DebugLog(@"unknown layer type");
    }
    
    #warning VERIFY WHEN LAYER IS TYPE PAUSE
    
}

// Initialize menu layer and activate
-(void) presentMenuLayer:(CGSize)layerSize{
    self.menuLayer = [[MenuLayer alloc] initWithSize:layerSize];
    [self addChild:self.menuLayer];
    [self.menuLayer activateLayer];
}

// Initialize store layer and activate
-(void) presentStoreLayer:(CGSize)layerSize{
    self.storeLayer = [[StoreLayer alloc] initWithSize:layerSize];
    [self addChild:self.storeLayer];
    [self.storeLayer activateLayer];
}

// Initialize Game layer and activate
-(void) presentGameLayer:(CGSize)layerSize{
    self.gameLayer = [[GameLayer alloc] initWithSize:layerSize];
    self.gameLayer.layerChangeDelegate = self;
    [self addChild:self.gameLayer];
    [self.gameLayer activateLayer];
}

// Initialize settings layer and activate
-(void) presentSettingsLayer:(CGSize)layerSize{
    self.settingsLayer = [[SettingsLayer alloc] initWithSize:layerSize];
    [self addChild:self.settingsLayer];
    [self.settingsLayer activateLayer];
}

// Initialize settings layer and activate
-(void) presentTrainingCenterLayer:(CGSize)layerSize{
    self.trainingCenterLayer = [[TrainingCenterLayer alloc] initWithSize:layerSize];
    [self addChild:self.trainingCenterLayer];
    [self.trainingCenterLayer activateLayer];
}

-(void) presentPauseLayer:(CGSize)layerSize{
    // Pause Game Layer
    DebugLog("PAUSE GAME LAYER NOT WORKING YET");
}

-(void) swipeLeft{
}
-(void) swipeRight{
}

-(void) changeToLayer:(GameDataLayerType)layerType{
    
    [GameData sharedGameData].layerActivated = layerType;
    [self changeLayer];
}

@end
