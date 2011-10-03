//
// NSApplication+CBAdditions.h
// Hyperspaces
//
// Created by Tony Arnold on 30/06/09.
// Copyright 2009 The CocoaBots. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#ifndef NSAppKitVersionNumber10_6
#define NSAppKitVersionNumber10_6 1038
#endif

extern NSString *const kShowDockIconUserDefaultsKey;

@interface NSApplication (CBAdditions)

+ (id)cb_infoValueForKey:(NSString *)key;
- (BOOL)cb_showsDockIcon;
- (void)cb_setShowsDockIcon:(BOOL)flag;
+ (BOOL)cb_systemIsLeopard;
+ (BOOL)cb_systemIsLeopardOrHigher;
+ (BOOL)cb_systemIsSnowLeopard;
+ (BOOL)cb_systemIsSnowLeopardOrHigher;
+ (BOOL)cb_systemIsLion;
- (NSString *)cb_applicationCopyrightInformation;
- (NSString *)cb_applicationName;
- (NSString *)cb_applicationShortVersionString;
- (NSString *)cb_applicationVersion;
- (NSString *)cb_applicationIdentifier;

@end
