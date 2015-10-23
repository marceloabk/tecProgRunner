//
//  OverallScene.m
//  TecprogRunner
//
//  Scene used to contain and show layers
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "OverallScene.h"
#import "GameData.h"
#import "GameLayer.h"


@implementation OverallScene

-(instancetype) initWithSize:(CGSize)size{
    
    DebugLog(@"Initializing");
    
    self = [super initWithSize:size];
    
    NSAssert((self!=NULL), @"Overall Scene is NULL");
    
    if(self != NULL){
        
        // Check for the users first time entered
        
        if([[NSUserDefaults standardUserDefaults] objectForKey:@"primeiraVez"] == NULL){
            [[NSUserDefaults standardUserDefaults] setObject:@"comecouJogoPelaPrimeiraVez" forKey:@"primeiraVez"];
            
            [[GameData sharedGameData] start];
        }
        
        
        // Adding layer that is on the screen
        self.overallControlLayer = [[OverallControlLayer alloc] initWithSize:size];
        
        DebugLog(@"adding overallControlLayer as child node");
        [self addChild:self.overallControlLayer];
        
    }else{
        // There's no alternative path
    }
    
    return self;
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    if([GameData sharedGameData].layerActivated == game){
        [self.overallControlLayer.gameLayer touchesBegan:touches withEvent:event];
    }
    
}

-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{

}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{

    UITouch * touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInNode:self];
    
    SKNode *node = [self nodeAtPoint:touchLocation];
    
    DebugLog(@"Node touched = %@", node.name);
    
    if([GameData sharedGameData].layerActivated == menu){
        
        DebugLog(@"%@ node in menu",node.name);
        if([node.name isEqualToString:@"tapToPlay"]){
            [GameData sharedGameData].layerActivated = game;
            [self.overallControlLayer changeLayer];
            
            self.physicsWorld.contactDelegate = self.overallControlLayer.gameLayer.physicsController;
            self.physicsWorld.gravity = CGVectorMake(0.0, -6.0);

        }
        else if([node.name isEqualToString:@"settingsButton"]){
            [GameData sharedGameData].layerActivated = settings;
            [self.overallControlLayer changeLayer];
        }
        else if([node.name isEqualToString:@"storeButton"]){
            [GameData sharedGameData].layerActivated = store;
            [self.overallControlLayer changeLayer];
        }
        else if([node.name isEqualToString:@"trainingCenterButton"]){
            [GameData sharedGameData].layerActivated = trainingCenter;
            [self.overallControlLayer changeLayer];
        }
        else{
            DebugLog(@"node %@ unknown for menu",node.name);
        }
    }
    else if([GameData sharedGameData].layerActivated == store){
        
        DebugLog(@"%@ node in store",node.name);
        if([node.name isEqualToString:@"backButtonStore"]){
            [GameData sharedGameData].layerActivated = menu;
            [self.overallControlLayer changeLayer];
        }
        else{
            DebugLog(@"node %@ unknown for menu",node.name);
        }
    }
    else if([GameData sharedGameData].layerActivated == settings){
        
        DebugLog(@"%@ node in settings",node.name);
        if([node.name isEqualToString:@"backButtonSettings"]){
            [GameData sharedGameData].layerActivated = menu;
            [self.overallControlLayer changeLayer];
        }
        else{
            DebugLog(@"node %@ unknown for menu",node.name);
        }
    }
    else if([GameData sharedGameData].layerActivated == trainingCenter){
        if([node.name isEqualToString:@"backTrainingCenter"]){
            [GameData sharedGameData].layerActivated = menu;
            [self.overallControlLayer changeLayer];
        }
    }
    else {
        DebugLog(@"unknown layer type ");
    }
    
}

-(void) update:(CFTimeInterval)currentTime{
    
    if([GameData sharedGameData].layerActivated == game){
        [self.overallControlLayer.gameLayer update:currentTime];
    }
    
}

@end
