//
//  GameKitHelper.m
//  TecprogRunner
//
//  Created by Julio Xavier on 15/09/15.
//  Copyright (c) 2015 Bepid-UnB. All rights reserved.
//

#import "GameKitHelper.h"

@implementation GameKitHelper{
    // Identify if the Game Center is enabled
    BOOL _GameCenterEnabled;
}

#pragma mark Initialization and sharing

-(instancetype) init{
    
    // Calling the default init for classes in Objective C
    self = [super init];
    
    if (self != nil) {
        // Define the initial configuration for GameKitHelper
        _GameCenterEnabled = YES;
    }else{
        _GameCenterEnabled = NO;
        // Throw a exception
    }
    
    return self;
}

+(instancetype) sharedGameKitHelper{
    // Make the class static and dispatched once
    static GameKitHelper *sharedGameKitHelper;
    static dispatch_once_t onceToken;
    
    // Dispatching the class in the adress of onceToken
    dispatch_once(&onceToken, ^{
        //Allocating and initializing the class
        sharedGameKitHelper = [[GameKitHelper alloc] init];
    });
    
    return sharedGameKitHelper;
}

#pragma mark Authentication

-(void) authenticateLocalPlayer{
    // Authenticate player
}

-(void) setAuthenticationViewController:(UIViewController *)authenticationViewController{
    // Define Authentication View Controller
}

-(void) setLastError:(NSError *)error{
    // To present error of more legible form
}

#pragma mark Report conquests

-(void) reportScore:(int64_t)score forLeaderboardID:(NSString *)leaderboardID{
    // Submit 'score' for determined 'leaderboardID'
}

-(void) reportAchievements:(NSArray *)achievements{
    // Submit 'achievements'
    // Define if the game will have achievements
}

#pragma mark View Controller manipulation

-(void) presentLeaderboardsOnViewController:(UIViewController *)viewController{
    // Allocating and initializing the default Game Center View Controller
    GKGameCenterViewController *leaderboardViewController = [[GKGameCenterViewController alloc] init];
    leaderboardViewController.viewState = GKGameCenterViewControllerStateDefault;
    leaderboardViewController.gameCenterDelegate = self;
    
    //Presenting Game Center View Controller on screen
    [viewController presentViewController:leaderboardViewController animated:YES completion:nil];
}

-(void) gameCenterViewControllerDidFinish:(GKGameCenterViewController *)gameCenterViewController{
    // Remove View Controller from screen
    [gameCenterViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
