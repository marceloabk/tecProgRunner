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

    self.menuLayer = [[MenuLayer alloc] initWithSize:CGSizeMake(667, 375)];
    self.storeLayer = [[StoreLayer alloc] initWithSize:CGSizeMake(667, 375)];
    
    self.menuLayer.name = @"layer";
    self.storeLayer.name = @"layer";

}
-(void) putLayer{
    
    if([GameData sharedGameData].layerActivated == 1){
        [self addChild:self.menuLayer];
        [self.menuLayer activateLayer];
    }
    else if([GameData sharedGameData].layerActivated == 2){
        [self addChild:self.storeLayer];
        [self.storeLayer activateLayer];
    }
    else{
    }
}



@end
