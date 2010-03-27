/*
 *  NSApplication+CBAdditions.h
 *  Created as part of Hyperspaces - http://thecocoabots.com/hyperspaces/
 *
 *  Created by Tony Arnold on 30/06/09.
 *  Copyright 2009 The CocoaBots. All rights reserved.
 *
 */

#import <Cocoa/Cocoa.h>


@interface NSApplication (CBAdditions)

+ (id)infoValueForKey:(NSString *)key;
- (BOOL)showsDockIcon;
- (void)setShowsDockIcon:(BOOL)flag;
- (void)relaunch;
+ (void)getSystemVersionMajor:(unsigned *)major minor:(unsigned *)minor bugFix:(unsigned *)bugFix;
- (NSString *)applicationName;
- (NSString *)applicationShortVersionString;
- (NSString *)applicationVersion;

@end
