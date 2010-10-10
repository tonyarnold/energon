//
// CBLog.m
//
// Created by Tony on 24/01/07. Copyright 2007-2010 The CocoaBots.
// Some rights reserved: <http://creativecommons.org/licenses/by/2.5/>
//

#import <Foundation/Foundation.h>

@interface CBLog : NSObject {}

+ (void)file:(char *)sourceFile function:(char *)functionName lineNumber:(NSInteger)lineNumber format:(NSString *)format, ...;
+ (void)file:(char *)sourceFile function:(char *)functionName lineNumber:(NSInteger)lineNumber error:(NSError *)error;
+ (void)file:(char *)sourceFile function:(char *)functionName lineNumber:(NSInteger)lineNumber statusCode:(OSStatus)status;

#if DEBUG
	#define CBLog(s, ...)          [CBLog file:__FILE__ function:(char *)__FUNCTION__ lineNumber:__LINE__ format:(s), ## __VA_ARGS__]
	#define CBLogError(e)          [CBLog file:__FILE__ function:(char *)__FUNCTION__ lineNumber:__LINE__ error:(e)]
	#define CBLogOSStatus(o)       [CBLog file:__FILE__ function:(char *)__FUNCTION__ lineNumber:__LINE__ statusCode:(o)]
	#define CBLogAssert(s, ...)    [[NSAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithCString:__PRETTY_FUNCTION__ encoding:NSUTF8StringEncoding] file:[NSString stringWithCString:__FILE__ encoding:NSUTF8StringEncoding] lineNumber:__LINE__ description:(s), ## __VA_ARGS__]
#else
	#define CBLog(s, ...)          do { } while (0)
	#define CBLogError(e)          do { } while (0)
	#define CBLogOSStatus(o)       do { } while (0)
	#ifndef NS_BLOCK_ASSERTIONS
		#define NS_BLOCK_ASSERTIONS
	#endif

	#define CBLogAssert(s, ...)       [CBLog file:__FILE__ function:(char *)__FUNCTION__ lineNumber:__LINE__ format:(s), ## __VA_ARGS__]
#endif

#define CBAssert(condition, ...)    do { if (!(condition)) {         \
																					 CBLogAssert(__VA_ARGS__); \
																				 }                           \
} while (0)


@end
