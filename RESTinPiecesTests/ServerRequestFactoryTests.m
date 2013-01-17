//
//  ServerRequestFactoryTests.m
//  RESTinPieces
//
//  Created by Dennis Lewandowski on 8/17/12.
//  Copyright (c) 2012 Dennis Lewandowski. All rights reserved.
//

#import "ServerRequestFactoryTests.h"
#import "JSONServerRequestFactory.h"
#import "RESTResourceSpecifier.h"
#import "ServerRequest.h"

@implementation ServerRequestFactoryTests

-(void) setUp
{
    testFactory = [[JSONServerRequestFactory alloc] init];
//    testFactory.serverURL = [NSURL URLWithString:@"http://137.226.56.196:3000"];
    testFactory.serverURL = [NSURL URLWithString:@"http://localhost:3000"];
    testFactory.timeout = 10;
}

// Expensive test, only use when needed.

-(void) testRequesting
{
    RESTResourceSpecifier* testSpecifier = [[RESTResourceSpecifier alloc] init];
//    testSpecifier.controller = @"communication";
//    testSpecifier.method = @"first_loginR";

    testSpecifier.controller = @"mice";
    testSpecifier.identifier = @"2";

    ServerRequest* testRequest = [testFactory JSONDeleteRequestForResource:testSpecifier arguments:nil];
    testRequest.delegate = self;
    [testRequest start];
    
    [self waitForDelegateCallback:3];
    
    STAssertTrue(requestDidFinish, @"Should have finished");
    STAssertFalse(requestDidFail, @"Should not fail");
    
    STAssertNotNil(responseData, @"Data should not be nil");
    NSString* responseDataString = [NSString stringWithUTF8String:[responseData bytes]];
    NSLog(@"Response data: %@", responseDataString);
}


# pragma mark -
# pragma mark Delegate methods

-(void)request:(ServerRequest *)request didFinishLoadingData:(NSData *)theData
{
    requestDidFinish = YES;
    responseData = theData;
}

-(void)request:(ServerRequest *)request didFailLoadingDataWithError:(NSError *)error
{
    requestDidFinish = YES;
    requestDidFail = YES;
}


# pragma mark -
# pragma mark Helper methods

-(void)waitForDelegateCallback:(NSTimeInterval)seconds
{
    // lets the runloop wait for a given time
	NSDate* nSecondsFromNow = [NSDate dateWithTimeIntervalSinceNow:seconds];
	[[NSRunLoop currentRunLoop] runUntilDate:nSecondsFromNow];
}

@end
