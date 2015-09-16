//
//  GameData.m
//  TecprogRunner
//
//  Created by Henrique Dutra on 15/09/15.
//  Copyright (c) 2015 Bepid-UnB. All rights reserved.
//

#import "GameData.h"

@implementation GameData

// dispatch method that creates the singleton
+ (instancetype)sharedGameData {
    static id sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [self loadInstance];
    });
    
    return sharedInstance;
}

// load data inside the singleton
+(instancetype)loadInstance{
    
    NSData* decodedData = [NSData dataWithContentsOfFile: [GameData filePath]];
    
    if (decodedData) {
        GameData* gameData = [NSKeyedUnarchiver unarchiveObjectWithData:decodedData];
        return gameData;
    }
    
    return [[GameData alloc] init];
}


// saving method
-(void)save{
    
    NSData* encodedData = [NSKeyedArchiver archivedDataWithRootObject: self];
    [encodedData writeToFile:[GameData filePath] atomically:YES];
    
}

// initialize with Apple's NSCoder
- (instancetype)initWithCoder:(NSCoder *)decoder{
    
    self = [self init];
    
    if (self){
       
    }
    
    return self;
}

// method that will be called the first time the user enters the game
-(void) start{

}

// encode data
- (void)encodeWithCoder:(NSCoder *)encoder{
    
}

// file path
+(NSString*)filePath{
    
    static NSString* filePath = nil;
    
    if (!filePath) {
        filePath =
        [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
         stringByAppendingPathComponent:@"gamedata"];
    }
    return filePath;
}



@end
