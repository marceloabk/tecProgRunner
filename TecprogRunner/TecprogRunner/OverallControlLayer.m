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

@implementation OverallControlLayer{
    CGSize layerSize;
}

-(instancetype) initWithSize:(CGSize)size{
    
    DebugLog(@"Initializing");
    if(self = [super init]){
        
        // Set layer size
        layerSize = CGSizeMake(DEFAULT_LAYER_WIDTH, DEFAULT_LAYER_HEIGHT);
        
        [self loadLayers];
        
    }else{
        NSException *exception = [NSException exceptionWithName:@"OverallControl layer init" reason:@"Can't init OverallControl layer" userInfo:nil];
        [exception raise];
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
    
    if(layerType == menu){
        DebugLog(@"putting menu layer...");
        [self presentMenuLayer];
        
    }else if(layerType == store){
        [self presentStoreLayer];
        
    }else if(layerType == game){
        DebugLog(@"putting game layer...");
        [self presentGameLayer];
        
    }else if(layerType == settings){
        DebugLog(@"putting settings layer...");
        [self presentSettingsLayer];
        
    }else if(layerType == trainingCenter){
        DebugLog(@"putting training center layer");
        [self presentTrainingCenterLayer];
        
    }else{
        DebugLog(@"unknown layer type");
    }
    
    
    //TODO: Verify when layer is type pause
    
}

// Initialize menu layer and activate
-(void) presentMenuLayer{
    
    self.menuLayer = [[MenuLayer alloc] initWithSize:layerSize];
    [self addChild:self.menuLayer];
    [self.menuLayer activateLayer];
}

// Initialize store layer and activate
-(void) presentStoreLayer{
    
    @try {
        self.storeLayer = [[StoreLayer alloc] initWithSize:layerSize];
        [self addChild:self.storeLayer];
        [self.storeLayer activateLayer];
    }@catch (NSException *exception) {
        DebugLog(@"EXCEPTION WHILE INITIALIZING STORE LAYER");
    }
}

// Initialize Game layer and activate
-(void) presentGameLayer{
    self.gameLayer = [[GameLayer alloc] initWithSize:layerSize];
    self.gameLayer.layerChangeDelegate = self;
    self.gameLayer.gameRestartDelegate = self;
    [self addChild:self.gameLayer];
    [self.gameLayer activateLayer];
}

// Initialize settings layer and activate
-(void) presentSettingsLayer{
    self.settingsLayer = [[SettingsLayer alloc] initWithSize:layerSize];
    [self addChild:self.settingsLayer];
    [self.settingsLayer activateLayer];
}

// Initialize settings layer and activate
-(void) presentTrainingCenterLayer{
    self.trainingCenterLayer = [[TrainingCenterLayer alloc] initWithSize:layerSize];
    [self addChild:self.trainingCenterLayer];
    [self.trainingCenterLayer activateLayer];
}

//TODO: implement present pause layer
-(void) presentPauseLayer{
    // Pause Game Layer
    DebugLog("PAUSE GAME LAYER NOT WORKING YET");
}

-(void) swipeLeft{
    DebugLog("User swiped left");
}

-(void) swipeRight{
    DebugLog("User swiped right");
}

-(void) changeToLayer:(GameDataLayerType)layerType{
    
    [GameData sharedGameData].layerActivated = layerType;
    [self changeLayer];
}

-(void) restartGame{
    
    [self.gameLayer removeAllActions];
    [self.gameLayer removeAllChildren];
    self.gameLayer = nil;
    
    self.gameLayer = [[GameLayer alloc] initWithSize:layerSize];
    self.gameLayer.layerChangeDelegate = self;
    self.gameLayer.gameRestartDelegate = self;
    [self addChild:self.gameLayer];
    [self.gameLayer activateLayer];
}

@end
