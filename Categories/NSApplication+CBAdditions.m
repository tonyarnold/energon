//
// NSApplication+CBAdditions.m
// Hyperspaces
//
// Created by Tony Arnold on 30/06/09.
// Copyright 2009 The CocoaBots. All rights reserved.
//

#import "NSApplication+CBAdditions.h"
#import <Carbon/Carbon.h>

NSString *const kShowDockIconUserDefaultsKey = @"ShowDockIcon";

@implementation NSApplication (CBAdditions)

+ (id)infoValueForKey:(NSString *)key {
    if ([[[NSBundle mainBundle] localizedInfoDictionary] objectForKey:key]) {
        return [[[NSBundle mainBundle] localizedInfoDictionary] objectForKey:key];
    }

    return [[[NSBundle mainBundle] infoDictionary] objectForKey:key];
}

- (BOOL)showsDockIcon {
    return [[NSUserDefaults standardUserDefaults] boolForKey:kShowDockIconUserDefaultsKey];
}

- (void)setShowsDockIcon:(BOOL)flag {
    // this should be called from the application delegate's applicationDidFinishLaunching method or from some controller object's awakeFromNib method neat dockless hack using Carbon from <a href="http://codesorcery.net/2008/02/06/feature-requests-versus-the-right-way-to-do-it" title="http://codesorcery.net/2008/02/06/feature-requests-versus-the-right-way-to-do-it">http://codesorcery.net/2008/02/06/feature-requests-versus-the-right-way-...</a>
    if (flag) {
        ProcessSerialNumber psn = { 0, kCurrentProcess };
        // display dock icon
        TransformProcessType(&psn, kProcessTransformToForegroundApplication);
        // enable menu bar
        SetSystemUIMode(kUIModeNormal, 0);

        // switch to Dock.app
        if ([[NSWorkspace sharedWorkspace] launchAppWithBundleIdentifier:@"com.apple.dock" options:NSWorkspaceLaunchDefault additionalEventParamDescriptor:nil launchIdentifier:nil] == NO) {
            CBLog(@"Could not launch application with identifier 'com.apple.dock'.");
        }

        // switch back
        [[NSApplication sharedApplication] activateIgnoringOtherApps:YES];
    }
}

- (void)relaunch {
    NSString *executablePath = [[NSBundle mainBundle] pathForResource:@"RelaunchTool" ofType:@""];

    [NSTask launchedTaskWithLaunchPath:executablePath arguments:[NSArray arrayWithObjects:[[NSBundle mainBundle] bundlePath], [NSString stringWithFormat:@"%d", [[NSProcessInfo processInfo] processIdentifier]], nil]];
    [NSApp terminate:self];
}

+ (BOOL)systemIsLeopard {
    return (floor(NSAppKitVersionNumber) <= NSAppKitVersionNumber10_5);
}

+ (BOOL)systemIsLeopardOrHigher {
    return floor(NSAppKitVersionNumber) >= NSAppKitVersionNumber10_5;
}

+ (BOOL)systemIsSnowLeopard {
    return (floor(NSAppKitVersionNumber) <= NSAppKitVersionNumber10_6);
}

+ (BOOL)systemIsSnowLeopardOrHigher {
    return floor(NSAppKitVersionNumber) >= NSAppKitVersionNumber10_6;
}

+ (BOOL)systemIsLion {
    return floor(NSAppKitVersionNumber) > NSAppKitVersionNumber10_6;
}

- (NSString *)applicationCopyrightInformation {
    return [NSApplication infoValueForKey:@"NSHumanReadableCopyright"];
}

- (NSString *)applicationName {
    return [NSApplication infoValueForKey:@"CFBundleExecutable"];
}

- (NSString *)applicationShortVersionString {
    return [NSApplication infoValueForKey:@"CFBundleShortVersionString"];
}

- (NSString *)applicationVersion {
    return [NSApplication infoValueForKey:@"CFBundleVersion"];
}

- (NSString *)applicationIdentifier {
    return [NSApplication infoValueForKey:@"CFBundleIdentifier"];
}

@end
