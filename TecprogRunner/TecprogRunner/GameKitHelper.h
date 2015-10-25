//
//  GameKitHelper.h
//  TecprogRunner
//
//  Simplify communication with game center
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "GlobalHeaders.h"
@import GameKit;

/**
 Authentication View Controller being used
*/
extern NSString *const PresentAuthenticationViewController;

@interface GameKitHelper : NSObject <GKGameCenterControllerDelegate>

@property (nonatomic, readonly) UIViewController *authenticationViewController;

/**
 Store error ocurred
*/
@property (nonatomic, readonly) NSError *lastError;

#pragma mark Initialization and sharing

/**
 Initialize Game Kit Helper class
*/
-(instancetype) init;

/**
 Used to make class static
 and shared
*/
+(instancetype) sharedGameKitHelper;

#pragma mark Authentication

/**
 Authenticate the Player
 on Game Center
*/
-(void) authenticateLocalPlayer;

/**
 Set the Authentication
 View Controller
*/
-(void) setAuthenticationViewController:(UIViewController *)authenticationViewController;

/**
 Set the error if ocurred
*/
-(void) setLastError:(NSError *)error;

#pragma mark Report conquests

/**
 Report a Score to a Leaderboard
 in Game Center
*/
-(void) reportScore:(int64_t)score forLeaderboardID:(NSString *)leaderboardID;

/**
 Report a Achievement
 to Game Center
*/
-(void) reportAchievements:(NSArray *)achievements;

#pragma mark View Controller manipulation

/**
 Present Leaderboard on Screen
*/
-(void) presentLeaderboardsOnViewController:(UIViewController *)viewController;

/**
 Dismiss View Controller from Screen
*/
-(void) gameCenterViewControllerDidFinish:(GKGameCenterViewController *)gameCenterViewController;

@end
