//
//  RESTResourceSpecifierTests.m
//  RESTinPieces
//
//  Created by Dennis Lewandowski on 8/17/12.
//  Copyright (c) 2012 Dennis Lewandowski. All rights reserved.
//

#import "RESTResourceSpecifierTests.h"
#import "RESTResourceSpecifier.h"

@implementation RESTResourceSpecifierTests

-(void)setUp
{
    testGenerator = [[RESTResourceSpecifier alloc] initWithController:@"testController"  method:@"testMethod" identifier:nil format:nil];
}

-(void)testURLGenerationWithoutFormat
{
    expectedPath = @"testController/testMethod";
    
    STAssertNoThrow((generatedPath = [testGenerator generatePath]), @"Generation of URL crashed");
    STAssertNotNil(generatedPath, @"URL should not be nil");
    STAssertEqualObjects(generatedPath, expectedPath, @"Should be the same");
}

-(void)testURLGenerationJSON
{
    expectedPath = @"testController/testMethod.json";
    testGenerator.format = @"json";
    
    STAssertNoThrow((generatedPath = [testGenerator generatePath]), @"Generation of URL crashed");
    STAssertNotNil(generatedPath, @"URL should not be nil");
    STAssertEqualObjects(generatedPath, expectedPath, @"Should be the same");
}

-(void)testURLGenerationJSONWithID
{
    expectedPath = @"testController/testMethod/1.json";
    testGenerator.format = @"json";
    testGenerator.identifier = @"1";
    
    STAssertNoThrow((generatedPath = [testGenerator generatePath]), @"Generation of URL crashed");
    STAssertNotNil(generatedPath, @"URL should not be nil");
    STAssertEqualObjects(generatedPath, expectedPath, @"Should be the same");
}

-(void)testURLGenerationJSONWithIDNoMethod
{
    expectedPath = @"testController/1.json";
    testGenerator.method = nil;
    testGenerator.format = @"json";
    testGenerator.identifier = @"1";
    
    STAssertNoThrow((generatedPath = [testGenerator generatePath]), @"Generation of URL crashed");
    STAssertNotNil(generatedPath, @"URL should not be nil");
    STAssertEqualObjects(generatedPath, expectedPath, @"Should be the same");
}

@end
