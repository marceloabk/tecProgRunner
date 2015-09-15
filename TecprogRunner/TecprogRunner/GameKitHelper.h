//
//  GameKitHelper.h
//  TecprogRunner
//
//  Created by Julio Xavier on 15/09/15.
//  Copyright (c) 2015 Bepid-UnB. All rights reserved.
//

#import <Foundation/Foundation.h>
@import GameKit;

@interface GameKitHelper : NSObject

#pragma mark Initialization and sharing

-(instancetype)init;

+(instancetype)sharedGameKitHelper;

#pragma mark Authentication

-(void)authenticateLocalPlayer;

-(void)setAuthenticationViewController: (UIViewController *)authenticationViewController;

-(void)setLastError:(NSError *)error;

#pragma mark Report conquests

-(void)reportScore:(int64_t)score forLeaderboardID:(NSString *)leaderboardID;

-(void)reportAchievements:(NSArray *)achievements;

#pragma mark View Controller manipulation

-(void)presentLeaderboardsOnViewController:(UIViewController *)viewController;

-(void)gameCenterViewControllerDidFinish: (GKGameCenterViewController *)gameCenterViewController;

@end
