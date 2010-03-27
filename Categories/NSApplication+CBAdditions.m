/*
 *  NSApplication+CBAdditions.m
 *  Created as part of Hyperspaces - http://thecocoabots.com/hyperspaces/
 *
 *  Created by Tony Arnold on 30/06/09.
 *  Copyright 2009 The CocoaBots. All rights reserved.
 *
 */

#import "NSApplication+CBAdditions.h"
#import <Carbon/Carbon.h>


@implementation NSApplication (CBAdditions)

+ (id)infoValueForKey:(NSString *)key {
	if ([[[NSBundle mainBundle] localizedInfoDictionary] objectForKey:key]) {
		return [[[NSBundle mainBundle] localizedInfoDictionary] objectForKey:key];
	}

	return [[[NSBundle mainBundle] infoDictionary] objectForKey:key];
}

- (BOOL)showsDockIcon {
	return [[NSUserDefaults standardUserDefaults] boolForKey:HSShowDockIconUserDefaultsKey];
}

- (void)setShowsDockIcon:(BOOL)flag {
	/* this should be called from the application delegate's applicationDidFinishLaunching
	 * method or from some controller object's awakeFromNib method
	 * Neat dockless hack using Carbon from <a href="http://codesorcery.net/2008/02/06/feature-requests-versus-the-right-way-to-do-it" title="http://codesorcery.net/2008/02/06/feature-requests-versus-the-right-way-to-do-it">http://codesorcery.net/2008/02/06/feature-requests-versus-the-right-way-...</a>
	 */
	if (flag == YES) {
		ProcessSerialNumber psn = { 0, kCurrentProcess };
		/* display dock icon */
		TransformProcessType(&psn, kProcessTransformToForegroundApplication);
		/* enable menu bar */
		SetSystemUIMode(kUIModeNormal, 0);
		/* switch to Dock.app */
		[[NSWorkspace sharedWorkspace] launchAppWithBundleIdentifier:@"com.apple.dock" options:NSWorkspaceLaunchDefault additionalEventParamDescriptor:nil launchIdentifier:nil];
		/* switch back */
		[[NSApplication sharedApplication] activateIgnoringOtherApps:YES];
	}
}

- (void)relaunch {
	NSString *executablePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"RelaunchTool" ofType:@""];

	[NSTask launchedTaskWithLaunchPath:executablePath arguments:[NSArray arrayWithObjects:[[NSBundle mainBundle] bundlePath], [NSString stringWithFormat:@"%d", [[NSProcessInfo processInfo] processIdentifier]], nil]];
	[NSApp terminate:self];
}

+ (void)getSystemVersionMajor:(unsigned *)major minor:(unsigned *)minor bugFix:(unsigned *)bugFix {
	OSErr  err;
	SInt32 systemVersion, versionMajor, versionMinor, versionBugFix;

	if ((err = Gestalt(gestaltSystemVersion, &systemVersion)) != noErr) {
		goto fail;
	}

	if (systemVersion < 0x1040) {
		if (major) {
			*major = ((systemVersion & 0xF000) >> 12) * 10 + ((systemVersion & 0x0F00) >> 8);
		}

		if (minor) {
			*minor = (systemVersion & 0x00F0) >> 4;
		}

		if (bugFix) {
			*bugFix = (systemVersion & 0x000F);
		}
	} else {
		if ((err = Gestalt(gestaltSystemVersionMajor, &versionMajor)) != noErr) {
			goto fail;
		}

		if ((err = Gestalt(gestaltSystemVersionMinor, &versionMinor)) != noErr) {
			goto fail;
		}

		if ((err = Gestalt(gestaltSystemVersionBugFix, &versionBugFix)) != noErr) {
			goto fail;
		}

		if (major) {
			*major = versionMajor;
		}

		if (minor) {
			*minor = versionMinor;
		}

		if (bugFix) {
			*bugFix = versionBugFix;
		}
	}

	return;

 fail:
	NSLog(@"Unable to obtain system version: %ld", (long)err);

	if (major) {
		*major = 10;
	}

	if (minor) {
		*minor = 0;
	}

	if (bugFix) {
		*bugFix = 0;
	}
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

@end
