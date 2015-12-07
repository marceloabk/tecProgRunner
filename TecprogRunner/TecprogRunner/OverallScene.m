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


@implementation OverallScene{
    /**
     Recognizes left swipe
    */
    UISwipeGestureRecognizer *_leftSwipe;
    
    /**
     Recognizes right swipe
     */
    UISwipeGestureRecognizer *_rightSwipe;
}

-(instancetype) initWithSize:(CGSize)size{
    
    
    DebugLog(@"Initializing");
    
    self = [super initWithSize:size];
    
    NSAssert(self != nil, @"Overall Scene is nil");
    
    if(self != nil){
        
        // Check if the user entered by first time
        
        if([[NSUserDefaults standardUserDefaults] objectForKey:@"primeiraVez"] == nil){
            [[NSUserDefaults standardUserDefaults] setObject:@"comecouJogoPelaPrimeiraVez" forKey:@"primeiraVez"];
            
            [[GameData sharedGameData] start];
            [[GameData sharedGameData] save];
        }else{
            // Continue
        }
        
        // Adding layer that is on the screen
        self.overallControlLayer = [[OverallControlLayer alloc] initWithSize:size];
        
        DebugLog(@"adding overallControlLayer as child node");
        [self addChild:self.overallControlLayer];
        
    }else{
        NSException *exception = [NSException exceptionWithName:@"Overall Scene init" reason:@"Can't init scene!" userInfo:nil];
        [exception raise];
    }
    
    return self;
}

-(void) update:(CFTimeInterval)currentTime{
    
    
    // Verify if layer activated is game layer...
    if([GameData sharedGameData].layerActivated == game){
        // ... update game layer
        [self.overallControlLayer.gameLayer update:currentTime];
        
    }else{
        // Continue
    }
    
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    // Detect touch properly
    UITouch * touch = [touches anyObject];
    
    // Detect touch location
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


/**
 Set basics physics world
 @brief Define physics world contact delegate and set a gravity
*/
-(void) setBasicsPhysicsWorld{
    
    // Defining Physics Controller as contact delegate
    self.physicsWorld.contactDelegate = self.overallControlLayer.gameLayer.physicsController;
    
    // Setting a gravity for physics world
    self.physicsWorld.gravity = CGVectorMake(0.0, -6.0);
    
}

/**
 @brief Changes page
 @param sender A swipe to right or left
*/
-(void) changePage:(UISwipeGestureRecognizer*)sender{
    
    DebugLog(@"Change page");
    
    // Verify the direction of the swipe
    if(sender.direction == UISwipeGestureRecognizerDirectionLeft){
        [self.overallControlLayer swipeLeft];
    }else if(sender.direction == UISwipeGestureRecognizerDirectionRight){
        [self.overallControlLayer swipeRight];
    }else{
        // There's no alternative path
        DebugLog(@"Direction not recognized");
    }
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    // Verify if the touches began in game...
    if([GameData sharedGameData].layerActivated == game){
        
        // Call the responsible layer method
        [self.overallControlLayer.gameLayer touchesBegan:touches withEvent:event];
    }else{
        DebugLog("Touches began outside game layer");
        // There's no alternative path
    }
    
}

-(void) didMoveToView:(SKView *)view{
    
    [self addSwipeRecognizers];

}

/**
 @brief Add left and right swipe recognizers using the change page selector
*/
-(void) addSwipeRecognizers{
    _leftSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(changePage:)];
    _rightSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(changePage:)];
    
    _leftSwipe.direction = UISwipeGestureRecognizerDirectionRight;
    _rightSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
    
    [self.view addGestureRecognizer:_rightSwipe];
    [self.view addGestureRecognizer:_leftSwipe];
}

/**
 Handle when user touches in Menu
 @param node Node touched
*/
-(void) touchesInMenu:(SKNode*)node{
    DebugLog(@"%@ node in menu",node.name);
    
    // Verify wich node was touched
    if([node.name isEqualToString:@"tapToPlay"]){
        
        // Activate game layer
        [GameData sharedGameData].layerActivated = game;
        [self.overallControlLayer changeLayer];
        
        // Initialize Game
        [self setBasicsPhysicsWorld];
        
    }else if([node.name isEqualToString:@"settingsButton"]){
        
        // Activate settings layer
        [GameData sharedGameData].layerActivated = settings;
        [self.overallControlLayer changeLayer];
        
    }else if([node.name isEqualToString:@"storeButton"]){
        
        // Activate store layer
        [GameData sharedGameData].layerActivated = store;
        [self.overallControlLayer changeLayer];
        
    }else if([node.name isEqualToString:@"trainingCenterButton"]){
        
        // Activate training center layer
        [GameData sharedGameData].layerActivated = trainingCenter;
        [self.overallControlLayer changeLayer];
        
    }else{
        DebugLog(@"node %@ unknown for menu",node.name);
    }
}

/**
 Handle when user touches in Store
 @param node Node touched
 */
-(void) touchesInStore:(SKNode*)node{
    DebugLog(@"%@ node in store",node.name);
    
    // Check wich node was touched
    if([node.name isEqualToString:@"backButton"]){
        
        // Activate Menu layer
        [GameData sharedGameData].layerActivated = menu;
        [self.overallControlLayer changeLayer];
        
    }else if([node.name isEqualToString:@"freeCoinsCard"]){
        [self.overallControlLayer.storeLayer freeCoinsChoosed];

    }else if([node.name isEqualToString:@"coinsCard"]){
        [self.overallControlLayer.storeLayer coinsChoosed];
        
    }else if([node.name isEqualToString:@"gemsCard"]){
        [self.overallControlLayer.storeLayer gemsChoosed];

    }else if([node.name isEqualToString:@"freeCoinsBack"]){
        [self.overallControlLayer.storeLayer backToMainLayer];
        
    }else if([node.name isEqualToString:@"gemsBack"]){
        [self.overallControlLayer.storeLayer backToMainLayer];
        
    }else if([node.name isEqualToString:@"coinsBack"]){
        [self.overallControlLayer.storeLayer backToMainLayer];
        
    }else{
        DebugLog(@"node %@ unknown for store",node.name);
    }
    
}

/**
 Handle when user touches in Settings
 @param node Node touched
 */
-(void) touchesInSettings:(SKNode*)node{
    
    DebugLog(@"%@ node in settings",node.name);
    
    // Check wich node was touched
    if([node.name isEqualToString:@"backButton"]){
        
        // Activate Menu layer
        [GameData sharedGameData].layerActivated = menu;
        [self.overallControlLayer changeLayer];
    }else if([node.name isEqualToString:@"volumeOff1"] || [node.name isEqualToString:@"volumeOn1"]){
        [GameData sharedGameData].soundEffectsAvailibility = ![GameData sharedGameData].soundEffectsAvailibility;
        [self.overallControlLayer.settingsLayer changedSetting];
        
    }else if([node.name isEqualToString:@"volumeOff2"] || [node.name isEqualToString:@"volumeOn2"]){
        [GameData sharedGameData].musicAvailibility = ![GameData sharedGameData].musicAvailibility;
        [self.overallControlLayer.settingsLayer changedSetting];
        
    }else{
        DebugLog(@"node %@ unknown for settings",node.name);
    }
}

/**
 Handle when user touches in Training Center
 @param node Node touched
 */
-(void) touchesInTrainingCenter:(SKNode*)node{
    
    // Check wich node was touched
    if([node.name isEqualToString:@"backButton"]){
        
        // Activate Menu layer
        [GameData sharedGameData].layerActivated = menu;
        [self.overallControlLayer changeLayer];
        
    }else{
        DebugLog(@"node %@ unknown for training center", node.name);
    }
    
}
@end
