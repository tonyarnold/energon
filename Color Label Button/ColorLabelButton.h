//
//  ColorLabelButton.h
//  Color Label Button
//
//  Created by Tony Arnold on 20/12/06.
//  Some rights reserved: <http://creativecommons.org/licenses/by/2.5/>
//

#import <Cocoa/Cocoa.h>
#import "ColorLabelButtonCell.h"

@interface ColorLabelButton : NSControl {
  NSMatrix*       mColorLabels;
	NSMutableArray*	mTrackingRects;
	BOOL            mDisplaysClearButton;
  NSColor*        mColorLabelColor;
}

#pragma mark -
#pragma mark Lifetime 
- (id) initWithFrame: (NSRect) frame; 
- (void) bootstrapView;
- (void) doAction: (id) sender;
- (void) dealloc; 

#pragma mark -
- (void) setLabelType: (ColorLabelButtonType) type; 
- (ColorLabelButtonType) labelType; 

#pragma mark -
- (NSControlSize) controlSize;
- (void) setControlSize: (NSControlSize) newControlSize;

#pragma mark -
- (void) setColorLabels: (NSArray*) Colors; 
- (NSArray*) colorLabels; 

#pragma mark -
- (void) setSelectedColorLabel: (NSColor*) Color; 
- (NSColor*) selectedColorLabel; 

#pragma mark -
- (void) setDisplaysClearButton: (BOOL) flag; 
- (BOOL) displaysClearButton; 

@end
