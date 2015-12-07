//
//  Copyright (c) 2015 Henrique Dutra. All rights reserved.
//

#import "TecProgIAPHelper.h"

@implementation TecProgIAPHelper


+ (TecProgIAPHelper *)sharedInstance {
    static dispatch_once_t once;
    static TecProgIAPHelper * sharedInstance;
    dispatch_once(&once, ^{
        NSSet * productIdentifiers = [NSSet setWithObjects:
                                      @"0404020770packageGold1",
//                                      @"0404020770packageGold2",
//                                      @"0404020770packageGold3",
//                                      @"0404020770packageGold4",
//                                      @"0404020770packageGold5",
//                                      @"0404020770packageGold6",
//                                      @"0404020770packageGems1",
//                                      @"0404020770packageGems2",
//                                      @"0404020770packageGems3",
//                                      @"0404020770packageGems4",
//                                      @"0404020770packageGems5",
//                                      @"0404020770packageGems6",
                                      nil];
        sharedInstance = [[self alloc] initWithProductIdentifiers:productIdentifiers];
    });
    return sharedInstance;
}

@end
