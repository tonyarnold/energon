//
// CBLog.m
//
// Created by Tony on 24/01/07. Copyright 2007-2010 The CocoaBots.
// Some rights reserved: <http://creativecommons.org/licenses/by/2.5/>
//


#import "CBLog.h"


@implementation CBLog

+ (void)file:(char *)sourceFile function:(char *)functionName lineNumber:(NSInteger)lineNumber format:(NSString *)format, ...{
	va_list   ap;
	NSString *print, *file, *function;

	va_start(ap, format);
	file     = [[NSString alloc] initWithBytes:sourceFile length:strlen(sourceFile) encoding:NSUTF8StringEncoding];
	function = [NSString stringWithCString:functionName encoding:NSUTF8StringEncoding];
	print    = [[NSString alloc] initWithFormat:format arguments:ap];
	va_end(ap);

	NSLog(@"%@:%ld %@; %@", [file lastPathComponent], lineNumber, function, print);

	[print release];
	[file release];
}

+ (void)file:(char *)sourceFile function:(char *)functionName lineNumber:(NSInteger)lineNumber error:(NSError *)error {
	if ((error == nil) || ![error isKindOfClass:[NSError class]]) {
		[CBLog file:sourceFile function:functionName lineNumber:lineNumber format:[NSString stringWithString:@"An error was received, but it was empty."]];
		return;
	}

	[CBLog file:sourceFile function:functionName lineNumber:lineNumber format:[NSString stringWithFormat:@"Unexpected Error: %@", [error localizedDescription]]];

	NSArray *detailedErrors = [[error userInfo] objectForKey:NSDetailedErrorsKey];

	if ((detailedErrors != nil) && ([detailedErrors count] > 0)) {
		for (NSError *detailedError in detailedErrors) {
			[CBLog file:sourceFile function:functionName lineNumber:lineNumber format:[NSString stringWithFormat:@"Domain: %@", [error domain]]];
			[CBLog file:sourceFile function:functionName lineNumber:lineNumber format:[NSString stringWithFormat:@"Code: %i", [error code]]];
			[CBLog file:sourceFile function:functionName lineNumber:lineNumber format:[NSString stringWithFormat:@"  DetailedError: %@", [detailedError userInfo]]];
		}
	}	else {
		[CBLog file:sourceFile function:functionName lineNumber:lineNumber format:[NSString stringWithFormat:@"  %@", [error userInfo]]];
	}
}

+ (void)file:(char *)sourceFile function:(char *)functionName lineNumber:(NSInteger)lineNumber statusCode:(OSStatus)status {
	// Get the string and description
	const char *statusName        = GetMacOSStatusErrorString(status);
	const char *statusDescription = GetMacOSStatusCommentString(status);

	NSString *statusNameString        = [NSString stringWithUTF8String:statusName];
	NSString *statusDescriptionString = [NSString stringWithUTF8String:statusDescription];

	[CBLog file:sourceFile function:functionName lineNumber:lineNumber format:[NSString stringWithFormat:@"%@: %@", statusNameString, statusDescriptionString]];
}

@end
