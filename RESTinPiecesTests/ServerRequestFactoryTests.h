//
//  ServerRequestFactoryTests.h
//  RESTinPieces
//
//  Created by Dennis Lewandowski on 8/17/12.
//  Copyright (c) 2012 Dennis Lewandowski. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "ServerRequestDelegate.h"

@class JSONServerRequestFactory;

@interface ServerRequestFactoryTests : SenTestCase<ServerRequestDelegate> {
    JSONServerRequestFactory* testFactory;
    
    BOOL requestDidFinish;
    BOOL requestDidFail;
    NSData* responseData;
    
}

@end
