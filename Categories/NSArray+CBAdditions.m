//
// NSArray+CBAdditions.m
// Hyperspaces
//
// Created by Tony Arnold on 10/08/10.
// Copyright 2010 The CocoaBots. All rights reserved.
//

#import "NSArray+CBAdditions.h"


@implementation NSArray (CBAdditions)

- (id)firstObject {
    return [self count] > 0 ? [self objectAtIndex:0] : nil;
}

@end
