//
//  OverallScene.m
//  TecprogRunner
//
//  Created by Henrique Dutra on 15/09/15.
//  Copyright (c) 2015 Bepid-UnB. All rights reserved.
//

#import "OverallScene.h"
#import "GameData.h"
#import "GameLayer.h"


@implementation OverallScene

- (instancetype)initWithSize:(CGSize)size{
    DebugLog(@"initializating");
    self = [super initWithSize:size];
    
    if(self){
        
        // check for the users first time entered
        
        if([[NSUserDefaults standardUserDefaults] objectForKey:@"primeiraVez"] == NULL){
            [[NSUserDefaults standardUserDefaults] setObject:@"comecouJogoPelaPrimeiraVez" forKey:@"primeiraVez"];
            
            [[GameData sharedGameData] start];
        }
        
        
        // adding layer that is on the screen
        self.overallControlLayer = [[OverallControlLayer alloc] initWithSize:size];
        
        DebugLog(@"adding overallControlLayer as child node");
        [self addChild:self.overallControlLayer];
        
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
    
//    if([GameData sharedGameData].layerActivated == game){
//        [_gameLayer update:currentTime];
//    }
    
}

@end
