/*
 *  NSScreen+LocalizedName.m
 *  Created as part of Hyperspaces - http://thecocoabots.com/hyperspaces/
 *
 *  Created by Tony Arnold on 8/01/10.
 *  Copyright 2010 The CocoaBots. All rights reserved.
 *
 */

#import "NSScreen+LocalizedName.h"
#import <IOKit/IOKitLib.h>
#import <IOKit/graphics/IOGraphicsLib.h>

@implementation NSScreen (LocalizedName)

static void KeyArrayCallback(const void *key, const void *value, void *context) {
	CFArrayAppendValue(context, key);
}

@dynamic cb_localizedDisplayName;
- (NSString *)cb_localizedDisplayName {
	NSDictionary     *screenDictionary = [self deviceDescription];
	NSNumber         *screenID         = [screenDictionary objectForKey:@"NSScreenNumber"];
	CGDirectDisplayID aID              = [screenID unsignedIntValue];
	CFStringRef       localName        = NULL;
	io_connect_t      displayPort      = CGDisplayIOServicePort(aID);
	CFDictionaryRef   dict             = (CFDictionaryRef)IODisplayCreateInfoDictionary(displayPort, 0);
	CFDictionaryRef   names            = CFDictionaryGetValue(dict, CFSTR(kDisplayProductName));

	if (names) {
		CFArrayRef langKeys = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
		CFDictionaryApplyFunction(names, KeyArrayCallback, (void *)langKeys);
		CFArrayRef orderLangKeys = CFBundleCopyPreferredLocalizationsFromArray(langKeys);
		CFRelease(langKeys);

		if (orderLangKeys && CFArrayGetCount(orderLangKeys)) {
			CFStringRef langKey = CFArrayGetValueAtIndex(orderLangKeys, 0);
			localName = CFDictionaryGetValue(names, langKey);
			CFRetain(localName);
		}

		CFRelease(orderLangKeys);
	}

	CFRelease(dict);
	return [(NSString *)localName autorelease];
}

@end
