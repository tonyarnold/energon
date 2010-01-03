//
// ColorLabelButton.h
// Color Label Button
//
// Created by Tony Arnold on 20/12/06.
// Some rights reserved: <http://creativecommons.org/licenses/by/2.5/>
//

#import <Cocoa/Cocoa.h>
#import "ColorLabelButtonCell.h"
#define LABEL_NONE       0
#define LABEL_RED        6
#define LABEL_ORANGE     7
#define LABEL_YELLOW     5
#define LABEL_GREEN      2
#define LABEL_BLUE       4
#define LABEL_MAGENTA    3
#define LABEL_GRAY       1

@interface ColorLabelButton : NSControl {
	NSMatrix       *mColorLabels;
	NSMutableArray *mTrackingRects;
	BOOL            mDisplaysClearButton;
	NSColor        *mColorLabelColor;
	id              target;
	SEL             action;
}

#pragma mark -
#pragma mark Lifetime
- (id)initWithFrame:(NSRect)frame;
- (void)bootstrapView;
- (void)doAction:(id)sender;
- (void)dealloc;

#pragma mark -
- (void)setLabelType:(ColorLabelButtonType)type;
- (ColorLabelButtonType)labelType;

#pragma mark -
- (NSControlSize)controlSize;
- (void)setControlSize:(NSControlSize)newControlSize;

#pragma mark -
- (void)setColorLabels:(NSArray *)Colors;
- (NSArray *)colorLabels;

#pragma mark -
- (void)setSelectedColorLabel:(NSColor *)Color;
- (NSColor *)selectedColorLabel;

#pragma mark -
- (void)setDisplaysClearButton:(BOOL)flag;
- (BOOL)displaysClearButton;

- (void)setTarget:(id)anObject;
- (void)setAction:(SEL)aSelector;
- (SEL)action;
- (int)numberForColor:(NSColor *)color;
- (NSColor *)colorForNumber:(int)number;
- (void)setSelectedColorNumber:(int)number;
- (int)selectedColorNumber;
- (id)objectValue;
- (void)setObjectValue:(id)object;

@end
