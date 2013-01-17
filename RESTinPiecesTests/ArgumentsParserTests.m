//
//  ArgumentsParserTests.m
//  RESTinPieces
//
//  Created by Dennis Lewandowski on 8/24/12.
//  Copyright (c) 2012 Dennis Lewandowski. All rights reserved.
//

#import "ArgumentsParserTests.h"

#import "ArgumentsParser.h"

@implementation ArgumentsParserTests

-(void)testInitialization
{
    ArgumentsParser* testParser;
    STAssertThrows((testParser = [[ArgumentsParser alloc] initWithArguments:nil]), @"Initialization should cause an exception");
    STAssertNil(testParser, @"There should be no parser");
}

@end
