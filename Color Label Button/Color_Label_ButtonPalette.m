//
// Color_Label_ButtonPalette.m
// Color Label Button
//
// Created by Tony Arnold on 20/12/06.
// Some rights reserved: <http://creativecommons.org/licenses/by/2.5/>
//

#import "ColorLabelButton.h"
#import "Color_Label_ButtonPalette.h"

@implementation Color_Label_ButtonPalette

- (void)finishInstantiate {
	/* `finishInstantiate' can be used to associate non-view objects with
	 * a view in the palette's nib.  For example:
	 *   [self associateObject:aNonUIObject ofType:IBObjectPboardType
	 *                withView:aView];
	 */
	NSArray *Colors = [NSArray arrayWithObjects:
										 [NSColor redColor],
										 [NSColor orangeColor],
										 [NSColor yellowColor],
										 [NSColor greenColor],
										 [NSColor blueColor],
										 [NSColor magentaColor],
										 [NSColor grayColor],
										 nil];

	[mColorLabelButton setDisplaysClearButton:YES];
	[mColorLabelButton setColorLabels:Colors];

	[super finishInstantiate];
}

@end
