//
//  iRate.h
//  TecprogRunner
//
//  iRate control
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-missing-property-synthesis"

#import <Availability.h>
#undef weak_delegate
#if __has_feature(objc_arc_weak) && \
(TARGET_OS_IPHONE || __MAC_OS_X_VERSION_MIN_REQUIRED >= __MAC_10_8)
#define weak_delegate weak
#else
#define weak_delegate unsafe_unretained
#endif


#import <TargetConditionals.h>
#if TARGET_OS_IPHONE
#import <UIKit/UIKit.h>
#define IRATE_EXTERN UIKIT_EXTERN
#else
#import <Cocoa/Cocoa.h>
#define IRATE_EXTERN APPKIT_EXTERN
#endif


IRATE_EXTERN NSUInteger const iRateAppStoreGameGenreID;
IRATE_EXTERN NSString *const iRateErrorDomain;

// Localisation string keys
IRATE_EXTERN NSString *const iRateMessageTitleKey; //iRateMessageTitle
IRATE_EXTERN NSString *const iRateAppMessageKey; //iRateAppMessage
IRATE_EXTERN NSString *const iRateGameMessageKey; //iRateGameMessage
IRATE_EXTERN NSString *const iRateUpdateMessageKey; //iRateUpdateMessage
IRATE_EXTERN NSString *const iRateCancelButtonKey; //iRateCancelButton
IRATE_EXTERN NSString *const iRateRemindButtonKey; //iRateRemindButton
IRATE_EXTERN NSString *const iRateRateButtonKey; //iRateRateButton

// Notification keys
IRATE_EXTERN NSString *const iRateCouldNotConnectToAppStore;
IRATE_EXTERN NSString *const iRateDidDetectAppUpdate;
IRATE_EXTERN NSString *const iRateDidPromptForRating;
IRATE_EXTERN NSString *const iRateUserDidAttemptToRateApp;
IRATE_EXTERN NSString *const iRateUserDidDeclineToRateApp;
IRATE_EXTERN NSString *const iRateUserDidRequestReminderToRateApp;
IRATE_EXTERN NSString *const iRateDidOpenAppStore;


typedef NS_ENUM(NSUInteger, iRateErrorCode){
    iRateErrorBundleIdDoesNotMatchAppStore = 1,
    iRateErrorApplicationNotFoundOnAppStore,
    iRateErrorApplicationIsNotLatestVersion,
    iRateErrorCouldNotOpenRatingPageURL
};


@protocol iRateDelegate <NSObject>
@optional

- (void)iRateCouldNotConnectToAppStore:(NSError *)error;
- (void)iRateDidDetectAppUpdate;
- (BOOL)iRateShouldPromptForRating;
- (void)iRateDidPromptForRating;
- (void)iRateUserDidAttemptToRateApp;
- (void)iRateUserDidDeclineToRateApp;
- (void)iRateUserDidRequestReminderToRateApp;
- (BOOL)iRateShouldOpenAppStore;
- (void)iRateDidOpenAppStore;

@end


@interface iRate : NSObject

+ (instancetype)sharedInstance;

// App store ID - this is only needed if your
// bundle ID is not unique between iOS and Mac app stores
@property (nonatomic, assign) NSUInteger appStoreID;

// Application details - these are set automatically
@property (nonatomic, assign) NSUInteger appStoreGenreID;
@property (nonatomic, copy) NSString *appStoreCountry;
@property (nonatomic, copy) NSString *applicationName;
@property (nonatomic, copy) NSString *applicationVersion;
@property (nonatomic, copy) NSString *applicationBundleID;

// Usage settings - these have sensible defaults
@property (nonatomic, assign) NSUInteger usesUntilPrompt;
@property (nonatomic, assign) NSUInteger eventsUntilPrompt;
@property (nonatomic, assign) float daysUntilPrompt;
@property (nonatomic, assign) float usesPerWeekForPrompt;
@property (nonatomic, assign) float remindPeriod;

// Message text, you may wish to customise these
@property (nonatomic, copy) NSString *messageTitle;
@property (nonatomic, copy) NSString *message;
@property (nonatomic, copy) NSString *updateMessage;
@property (nonatomic, copy) NSString *cancelButtonLabel;
@property (nonatomic, copy) NSString *remindButtonLabel;
@property (nonatomic, copy) NSString *rateButtonLabel;

// Debugging and prompt overrides
@property (nonatomic, assign) BOOL useUIAlertControllerIfAvailable;
@property (nonatomic, assign) BOOL useAllAvailableLanguages;
@property (nonatomic, assign) BOOL promptForNewVersionIfUserRated;
@property (nonatomic, assign) BOOL onlyPromptIfLatestVersion;
@property (nonatomic, assign) BOOL onlyPromptIfMainWindowIsAvailable;
@property (nonatomic, assign) BOOL promptAtLaunch;
@property (nonatomic, assign) BOOL verboseLogging;
@property (nonatomic, assign) BOOL previewMode;

// Advanced properties for implementing custom behaviour
@property (nonatomic, strong) NSURL *ratingsURL;
@property (nonatomic, strong) NSDate *firstUsed;
@property (nonatomic, strong) NSDate *lastReminded;
@property (nonatomic, assign) NSUInteger usesCount;
@property (nonatomic, assign) NSUInteger eventCount;
@property (nonatomic, readonly) float usesPerWeek;
@property (nonatomic, assign) BOOL declinedThisVersion;
@property (nonatomic, readonly) BOOL declinedAnyVersion;
@property (nonatomic, assign) BOOL ratedThisVersion;
@property (nonatomic, readonly) BOOL ratedAnyVersion;
@property (nonatomic, weak_delegate) id<iRateDelegate> delegate;

// Manually control behaviour
- (BOOL)shouldPromptForRating;
- (void)promptForRating;
- (void)promptIfNetworkAvailable;
- (void)promptIfAllCriteriaMet;
- (void)openRatingsPageInAppStore;
- (void)logEvent:(BOOL)deferPrompt;

@end


#pragma clang diagnostic pop
