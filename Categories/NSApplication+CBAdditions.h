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

+ (id)infoValueForKey:(NSString *)key;
- (BOOL)showsDockIcon;
- (void)setShowsDockIcon:(BOOL)flag;
- (void)relaunch;
+ (BOOL)systemIsLeopard;
+ (BOOL)systemIsLeopardOrHigher;
+ (BOOL)systemIsSnowLeopard;
+ (BOOL)systemIsSnowLeopardOrHigher;
+ (BOOL)systemIsLion;
- (NSString *)applicationCopyrightInformation;
- (NSString *)applicationName;
- (NSString *)applicationShortVersionString;
- (NSString *)applicationVersion;
- (NSString *)applicationIdentifier;

@end
