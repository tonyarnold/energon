//
// NSBezierPath.h
// Color Label Button
//
// Created by Tony Arnold on 20/12/06.
// Some rights reserved: <http://creativecommons.org/licenses/by/2.5/>
//

#import <Foundation/Foundation.h>

/*
 * @brief	Plate bezier path extension
 *
 * @note	NSBezierPath is based on an implementation found at
 *			http://www.harmless.de/cocoa.html
 *			by Andreas.
 */
@interface NSBezierPath (UIPlate)
+ (NSBezierPath *)bezierPathWithPlateInRect:(NSRect)aRect;
+ (NSBezierPath *)bezierPathForRoundedRect:(NSRect)aRect withRadius:(int)radius;
+ (NSBezierPath *)bezierPathForRoundedRect:(NSRect)aRect withRadius:(int)radius roundTop:(BOOL)roundingTop roundBottom:(BOOL)roundingBottom;
@end
