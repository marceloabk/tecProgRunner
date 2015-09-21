//
//  GameKitHelper.m
//  TecprogRunner
//
//  Created by Julio Xavier on 15/09/15.
//  Copyright (c) 2015 Bepid-UnB. All rights reserved.
//

#import "GameKitHelper.h"

@implementation GameKitHelper

#pragma mark Initialization and sharing

-(instancetype) init{
    self = [super init];
    if (self) {
        
    }
    return self;
}

+(instancetype) sharedGameKitHelper{
    // Sharing methods and attributes of the static class
    
    return nil;
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
    // Show View Controller on screen
}

-(void) gameCenterViewControllerDidFinish:(GKGameCenterViewController *)gameCenterViewController{
    // Remove View Controller from screen
}

@end
