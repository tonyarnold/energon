/*
 *  NSObject+SafeBind.h
 *  Created as part of Hyperspaces - http://thecocoabots.com/hyperspaces/
 *
 *  Created by Tony Arnold on 11/01/10.
 *  Copyright 2010 The CocoaBots. All rights reserved.
 *
 */

#import <Cocoa/Cocoa.h>


@interface NSObject (SafeBind)

/* Binds a an object to a source object with a single key. If the target object has a binding for the key, it is removed first. */
- (void)cb_safelyBindToObject:(id)sourceObject withKey:(NSString *)key options:(NSDictionary *)options;

@end
