//
// Color_Label_ButtonInspector.m
// Color Label Button
//
// Created by Tony Arnold on 20/12/06.
// Some rights reserved: <http://creativecommons.org/licenses/by/2.5/>
//

#import "Color_Label_ButtonInspector.h"
#import "ColorLabelButton.h"

@implementation Color_Label_ButtonInspector

- (id)init {
	self = [super init];
	[NSBundle loadNibNamed:@"Color_Label_ButtonInspector" owner:self];
	return self;
}

- (void)ok:(id)sender {
	/* Your code Here */
	[super ok:sender];
}

- (void)revert:(id)sender {
	/* Your code Here */
	[super revert:sender];
}

@end
