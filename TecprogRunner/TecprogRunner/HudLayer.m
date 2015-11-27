//
//  HudLayer.m
//  TecprogRunner
//
//  Contain aditional information, like score
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "HudLayer.h"

@implementation HudLayer{
    CGSize _size;
    Label *_scoreLabel;
    Label *_timeLabel;
}

-(instancetype) initWithSize:(CGSize)size{
    
    DebugLog(@"Initializing");
    
    self = [super init];
    
    if(self != nil){
        _size = size;
        
        self.layer = [SKNode node];
        
        [self addChild:self.layer];
                
        [self putScoreLabel];
        [self putTimeLabel];
        
    }else{
        NSException *exception = [NSException exceptionWithName:@"Hud layer init" reason:@"Can't init hud layer" userInfo:nil];
        [exception raise];
    }
    
    return self;
}

-(void) updateTimeLabel:(int)timePassed{
    
    // Text for timeLabel
    NSString *timeLabelString = [[NSString alloc] initWithFormat:@"%i", timePassed];
    
    _timeLabel.text = timeLabelString;
}

-(void) updateScoreLabel:(int)points{
    
    // Text for pointsLabel
    NSString *pointsLabelString = [[NSString alloc] initWithFormat:@"%i", points];
    
    _scoreLabel.text = pointsLabelString;
    
}

-(void) putScoreLabel{
    
    // Setting font position
    CGPoint fontPosition = CGPointMake(_size.width*0.85, _size.height*0.9);
    
    // If score label isn't initialized yet...
    if(_scoreLabel == nil){
        
        // ... init and add score label on screen
        _scoreLabel = [Label labelWithText:@"0" andPosition:fontPosition andSize:38 andZPosition:100];
        [self addChild:_scoreLabel];
    }else{
        // The score label already exists
    }
    
}

-(void) putTimeLabel{
    
    // Setting font position
    CGPoint fontPosition = CGPointMake(_size.width*0.5, _size.height*0.9);
    
    // If time label isn't initialized yet...
    if(_timeLabel == nil){
        
        // ...init and add time label on screen
        _timeLabel = [Label labelWithText:@"0" andPosition:fontPosition andSize:38 andZPosition:100];
        [self addChild:_timeLabel];
        
    }else{
        // The time label already exists
    }
    
}

-(void) activateLayer{

}

@end
