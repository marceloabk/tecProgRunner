//
//  GameViewController.m
//  TecprogRunner
//
//  Control the views of the game
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "GameViewController.h"
#import "OverallScene.h"

@implementation GameViewController

-(void) viewDidLoad{
    
    // Call superclass default method for when a view is loaded
    [super viewDidLoad];
    
    // Configure the view
    SKView * skView = (SKView *)self.view;
    
    NSAssert((skView != nil), @"SKview is nil");
    
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    
    // Sprite Kit applies additional optimizations to improve rendering performance
    skView.ignoresSiblingOrder = YES;
    skView.showsPhysics = YES;
    
    [GameData sharedGameData].layerActivated = menu;
    
    // Create and configure the scene...
    // ...Setting a default screen size for to base positions of sprites
    CGSize screenSize = CGSizeMake(DEFAULT_LAYER_WIDTH, DEFAULT_LAYER_HEIGHT);
    
    // ...Allocating and initializing first scene
    // OverallScene will control all of the architecture of the game
    OverallScene *scene = [[OverallScene alloc] initWithSize:screenSize];
    
    NSAssert((scene != nil), @"OverrallScene is nil");
    
    // ...Adjust contents according to the screen size
    scene.scaleMode = SKSceneScaleModeFill;
    
    // Present the scene.
    [skView presentScene:scene];
    
}

-(BOOL) shouldAutorotate{
    return YES;
}

-(UIInterfaceOrientationMask) supportedInterfaceOrientations{
    
    UIInterfaceOrientationMask supported = UIInterfaceOrientationMaskAll;
    
    if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone){
        supported = UIInterfaceOrientationMaskAllButUpsideDown;
    }else{
        // Do nothing
    }
    
    return supported;
    
}

-(void) didReceiveMemoryWarning{
    // Release any cached data, images, etc that aren't in use.
    [super didReceiveMemoryWarning];
}

-(BOOL) prefersStatusBarHidden{
    return YES;
}

@end