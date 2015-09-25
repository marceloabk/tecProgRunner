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
    
    self = [super initWithSize:size];
    
    if(self){
        
        // adding layer that is on the screen
        self.overallControlLayer = [[OverallControlLayer alloc] initWithSize:size];
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
    
    NSLog(@"Node touched = %@", node.name);
    
    if([GameData sharedGameData].layerActivated == menu){
        
        if([node.name isEqualToString:@"tapToPlay"]){
            NSLog(@"LETS PLAY");
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
        else{
        
        }
    }
    else if([GameData sharedGameData].layerActivated == store){
        if([node.name isEqualToString:@"backButtonStore"]){
            [GameData sharedGameData].layerActivated = menu;
            [self.overallControlLayer changeLayer];
        }
    }
    
}

-(void) update:(CFTimeInterval)currentTime{
    
//    if([GameData sharedGameData].layerActivated == game){
//        [_gameLayer update:currentTime];
//    }
    
}

@end
