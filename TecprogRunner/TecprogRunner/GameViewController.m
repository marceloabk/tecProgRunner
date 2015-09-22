//
//  GameViewController.m
//  TecprogRunner
//
//  Created by Marcelo Cristiano Araujo Silva on 03/09/15.
//  Copyright (c) 2015 Bepid-UnB. All rights reserved.
//

#import "GameViewController.h"
#import "OverallScene.h"

@implementation GameViewController

-(void) viewDidLoad{
    
    // Call superclass default method for when a view is loaded
    [super viewDidLoad];
    
    // Configure the view
    SKView * skView = (SKView *)self.view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    
    /* Sprite Kit applies additional optimizations to improve rendering performance */
    skView.ignoresSiblingOrder = YES;
    skView.showsPhysics = YES;
    
    // Create and configure the scene.
    // OverallScene will control all of the architecture of the game
    
    [GameData sharedGameData].layerActivated = menu;
    
    OverallScene *scene = [[OverallScene alloc] initWithSize:[UIScreen mainScreen].bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    
    // Present the scene.
    [skView presentScene:scene];
    
}

-(BOOL) shouldAutorotate{
    return YES;
}

-(UIInterfaceOrientationMask) supportedInterfaceOrientations{
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    }else{
        return UIInterfaceOrientationMaskAll;
    }
}

-(void) didReceiveMemoryWarning{
    // Release any cached data, images, etc that aren't in use.
    [super didReceiveMemoryWarning];
}

-(BOOL) prefersStatusBarHidden{
    return YES;
}

@end