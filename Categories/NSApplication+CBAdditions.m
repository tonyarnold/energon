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

+ (id)cb_infoValueForKey:(NSString *)key {
    if ([[[NSBundle mainBundle] localizedInfoDictionary] objectForKey:key]) {
        return [[[NSBundle mainBundle] localizedInfoDictionary] objectForKey:key];
    }

    return [[[NSBundle mainBundle] infoDictionary] objectForKey:key];
}

- (BOOL)cb_showsDockIcon {
    return [[NSUserDefaults standardUserDefaults] boolForKey:kShowDockIconUserDefaultsKey];
}

- (void)cb_setShowsDockIcon:(BOOL)flag {
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

+ (BOOL)cb_systemIsLeopard {
    return (floor(NSAppKitVersionNumber) <= NSAppKitVersionNumber10_5);
}

+ (BOOL)cb_systemIsLeopardOrHigher {
    return floor(NSAppKitVersionNumber) >= NSAppKitVersionNumber10_5;
}

+ (BOOL)cb_systemIsSnowLeopard {
    return (floor(NSAppKitVersionNumber) <= NSAppKitVersionNumber10_6);
}

+ (BOOL)cb_systemIsSnowLeopardOrHigher {
    return floor(NSAppKitVersionNumber) >= NSAppKitVersionNumber10_6;
}

+ (BOOL)cb_systemIsLion {
    return floor(NSAppKitVersionNumber) > NSAppKitVersionNumber10_6;
}

- (NSString *)applicationCopyrightInformation {
    return [NSApplication infoValueForKey:@"NSHumanReadableCopyright"];
}

- (NSString *)cb_applicationName {
    return [NSApplication infoValueForKey:@"CFBundleExecutable"];
}

- (NSString *)cb_applicationShortVersionString {
    return [NSApplication infoValueForKey:@"CFBundleShortVersionString"];
}

- (NSString *)cb_applicationVersion {
    return [NSApplication infoValueForKey:@"CFBundleVersion"];
}

- (NSString *)cb_applicationIdentifier {
    return [NSApplication infoValueForKey:@"CFBundleIdentifier"];
}

@end
