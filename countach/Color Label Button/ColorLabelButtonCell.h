//
//  ColorLabelButtonCell.h
//  Color Label Button
//
//  Created by Tony Arnold on 20/12/06.
//  Some rights reserved: <http://creativecommons.org/licenses/by/2.5/>
//

#import <Cocoa/Cocoa.h>

typedef enum {
	ClearLabelType	= 0, 
	ColorLabelType	= 1, 
} ColorLabelButtonType; 

@interface ColorLabelButtonCell : NSActionCell {
  NSColor*	mColor;
	NSImage*	mImage;
	
	ColorLabelButtonType	mType;
	
	BOOL		mMouseInside;
	BOOL		mSelected;
}

#pragma mark -
- (id) init; 
- (void) dealloc; 

#pragma mark -
#pragma mark Attributes 
- (void) setColor: (NSColor*) color; 
- (NSColor*) color; 

#pragma mark -
- (void) setLabelType: (ColorLabelButtonType) type; 
- (ColorLabelButtonType) labelType; 

#pragma mark -
- (void) setSelected: (BOOL) flag; 
- (BOOL) selected; 

#pragma mark -
- (void) mouseEntered: (NSEvent*) event;
- (void) mouseExited: (NSEvent*) event;

@end
