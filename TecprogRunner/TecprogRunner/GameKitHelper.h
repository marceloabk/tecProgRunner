//
//  GameKitHelper.h
//  TecprogRunner
//
//  Simplify communication with game center
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "GlobalHeaders.h"
@import GameKit;

extern NSString *const PresentAuthenticationViewController;

@interface GameKitHelper : NSObject <GKGameCenterControllerDelegate>

@property (nonatomic, readonly) UIViewController *authenticationViewController;
@property (nonatomic, readonly) NSError *lastError;

#pragma mark Initialization and sharing

-(instancetype) init;

+(instancetype) sharedGameKitHelper;

#pragma mark Authentication

-(void) authenticateLocalPlayer;

-(void) setAuthenticationViewController:(UIViewController *)authenticationViewController;

-(void) setLastError:(NSError *)error;

#pragma mark Report conquests

-(void) reportScore:(int64_t)score forLeaderboardID:(NSString *)leaderboardID;

-(void) reportAchievements:(NSArray *)achievements;

#pragma mark View Controller manipulation

-(void) presentLeaderboardsOnViewController:(UIViewController *)viewController;

-(void) gameCenterViewControllerDidFinish:(GKGameCenterViewController *)gameCenterViewController;

@end
