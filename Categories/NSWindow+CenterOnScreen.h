//
// NSWindow+CenterOnScreen.h
// Hyperspaces
//
// Created by Tony Arnold on 8/01/10.
// Copyright 2010 The CocoaBots. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface NSWindow (CenterOnScreen)

- (void)centerWindowOnScreen;
- (void)centerWindowOnScreen:(NSScreen *)screen;

@end
