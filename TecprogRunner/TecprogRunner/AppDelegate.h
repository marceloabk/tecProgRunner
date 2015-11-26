//
//  AppDelegate.h
//  TecprogRunner
//
//  Control the application and his states
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import <UIKit/UIKit.h>

@import AVFoundation;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

/**
 Audio player used to
 play background music
*/
@property (nonatomic) AVAudioPlayer *backgroundMusicPlayer;

@end

