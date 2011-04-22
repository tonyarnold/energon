//
// NSWindow+CenterOnScreen.m
// Hyperspaces
//
// Created by Tony Arnold on 8/01/10.
// Copyright 2010 The CocoaBots. All rights reserved.
//

#import "NSWindow+CenterOnScreen.h"


@implementation NSWindow (CenterOnScreen)

- (void)centerWindowOnScreen {
    [self centerWindowOnScreen:[self screen]];
}

- (void)centerWindowOnScreen:(NSScreen *)screen {
    if (screen == nil) {
        screen = [self screen];
    }

    NSRect windowFrame  = [self frame];
    NSRect visibleFrame = [screen visibleFrame];

    windowFrame.origin.x = visibleFrame.origin.x + (NSWidth(visibleFrame) - NSWidth(windowFrame)) * 0.5f;
    windowFrame.origin.y = visibleFrame.origin.y + (NSHeight(visibleFrame) - NSHeight(windowFrame)) * 0.8f;

    [self setFrameOrigin:windowFrame.origin];
}

@end
