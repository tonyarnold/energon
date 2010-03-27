/*
 *  NSObject+SafeBind.m
 *  Created as part of Hyperspaces - http://thecocoabots.com/hyperspaces/
 *
 *  Created by Tony Arnold on 11/01/10.
 *  Copyright 2010 The CocoaBots. All rights reserved.
 *
 */

#import "NSObject+SafeBind.h"


@implementation NSObject (SafeBind)

- (void)safelyBindToObject:(id)sourceObject withKey:(NSString *)key options:(NSDictionary *)options {
	if ((sourceObject == nil) || (key == nil)) {
		return;
	}

	if ([self infoForBinding:key] != nil) {
		[self unbind:key];
	}

	[self bind:key toObject:sourceObject withKeyPath:key options:options];
}

@end
