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
    
    NSAssert(self != nil, @"Overall Scene is nil");
    
    if(self != nil){
        
        // Check for the users first time entered
        
        if([[NSUserDefaults standardUserDefaults] objectForKey:@"primeiraVez"] == nil){
            [[NSUserDefaults standardUserDefaults] setObject:@"comecouJogoPelaPrimeiraVez" forKey:@"primeiraVez"];
            
            [[GameData sharedGameData] start];
            [[GameData sharedGameData] save];
        }else{
            // There's no alternative path
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


-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    if([GameData sharedGameData].layerActivated == game){
        [self.overallControlLayer.gameLayer touchesBegan:touches withEvent:event];
    }else{
        // There's no alternative path
    }
    
}

-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{

}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{

    // Detect touch properly
    UITouch * touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInNode:self];
    
    // Detect node touched
    SKNode *node = [self nodeAtPoint:touchLocation];
    
    DebugLog(@"Node touched = %@", node.name);
    
    if([GameData sharedGameData].layerActivated == menu){
        
        [self touchesInMenu:node];
        
    }else if([GameData sharedGameData].layerActivated == store){
        
        [self touchesInStore:node];
        
    }else if([GameData sharedGameData].layerActivated == settings){
        
        [self touchesInSettings:node];
        
    }else if([GameData sharedGameData].layerActivated == trainingCenter){
        
        [self touchesInTrainingCenter:node];
        
    }else{
        DebugLog(@"unknown layer type ");
    }
    
}

-(void) setBasicsPhysicsWorld{
    self.physicsWorld.contactDelegate = self.overallControlLayer.gameLayer.physicsController;
    self.physicsWorld.gravity = CGVectorMake(0.0, -6.0);
}

-(void) update:(CFTimeInterval)currentTime{
    
    if([GameData sharedGameData].layerActivated == game){
        [self.overallControlLayer.gameLayer update:currentTime];
    }else{
        // There's no alternative path
    }
    
}

-(void) changePage:(UISwipeGestureRecognizer*)sender{
    if(sender.direction == UISwipeGestureRecognizerDirectionLeft){
        [self.overallControlLayer swipeLeft];
    }else if(sender.direction == UISwipeGestureRecognizerDirectionRight){
        [self.overallControlLayer swipeRight];
    }else{
        // There's no alternative path
    }
}

-(void) didMoveToView:(SKView *)view{

    
    self.leftSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(changePage:)];
    self.rightSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(changePage:)];
    
    self.leftSwipe.direction = UISwipeGestureRecognizerDirectionRight;
    self.rightSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
    
    [self.view addGestureRecognizer:self.rightSwipe];
    [self.view addGestureRecognizer:self.leftSwipe];

}

-(void) touchesInMenu:(SKNode*)node{
    DebugLog(@"%@ node in menu",node.name);
    
    if([node.name isEqualToString:@"tapToPlay"]){
        
        [GameData sharedGameData].layerActivated = game;
        [self.overallControlLayer changeLayer];
        [self setBasicsPhysicsWorld];
        
    }else if([node.name isEqualToString:@"settingsButton"]){
        
        [GameData sharedGameData].layerActivated = settings;
        [self.overallControlLayer changeLayer];
        
    }else if([node.name isEqualToString:@"storeButton"]){
        
        [GameData sharedGameData].layerActivated = store;
        [self.overallControlLayer changeLayer];
        
    }else if([node.name isEqualToString:@"trainingCenterButton"]){
        
        [GameData sharedGameData].layerActivated = trainingCenter;
        [self.overallControlLayer changeLayer];
        
    }else{
        DebugLog(@"node %@ unknown for menu",node.name);
    }
}

-(void) touchesInStore:(SKNode*)node{
    DebugLog(@"%@ node in store",node.name);
    
    if([node.name isEqualToString:@"backButton"]){
        [GameData sharedGameData].layerActivated = menu;
        [self.overallControlLayer changeLayer];
    }else if([node.name isEqualToString:@"freeCoinsCard"]){
        
    }else if([node.name isEqualToString:@"coinsCard"]){
        
    }else if([node.name isEqualToString:@"gemsCard"]){
        
    }else{
        DebugLog(@"node %@ unknown for store",node.name);
    }
}

-(void) touchesInSettings:(SKNode*)node{
    DebugLog(@"%@ node in settings",node.name);
    if([node.name isEqualToString:@"backButton"]){
        [GameData sharedGameData].layerActivated = menu;
        [self.overallControlLayer changeLayer];
    }else{
        DebugLog(@"node %@ unknown for settings",node.name);
    }
}

-(void) touchesInTrainingCenter:(SKNode*)node{
    if([node.name isEqualToString:@"backButton"]){
        [GameData sharedGameData].layerActivated = menu;
        [self.overallControlLayer changeLayer];
    }else{
        DebugLog(@"node %@ unknown for training center", node.name);
    }
}

@end
