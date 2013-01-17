//
//  RESTRequestGeneratorTests.m
//  RESTinPieces
//
//  Created by Dennis Lewandowski on 8/20/12.
//  Copyright (c) 2012 Dennis Lewandowski. All rights reserved.
//

#import "RESTRequestGeneratorTests.h"

#import "RESTRequestGenerator.h"
#import "RESTResourceSpecifierStub.h"

@implementation RESTRequestGeneratorTests

-(void) testGenerateGETRequestNoArguments
{
    NSURL* expectedURL = [NSURL URLWithString:@"http://testServer/StubPath"];
    
    RESTRequestGenerator* testGenerator = [[RESTRequestGenerator alloc] init];
    testGenerator.resource = [[RESTResourceSpecifierStub alloc] init];
    testGenerator.serverURL = [NSURL URLWithString:@"http://testServer"];
    testGenerator.httpMethod = @"GET";

    NSURLRequest* generatedRequest;
    STAssertNoThrow(generatedRequest = [testGenerator generateRequest], @"Should not crash");
    STAssertNotNil(generatedRequest, @"Should not be nil");
    STAssertEqualObjects([generatedRequest HTTPMethod], @"GET", @"Should be GET");
    STAssertEqualObjects([generatedRequest URL], expectedURL, @"Unexpected URL");
    
}

-(void) testGenerateGETRequestWithOneArgument
{
    NSURL* expectedURL = [NSURL URLWithString:@"http://testServer/StubPath?foo=bar"];
    NSDictionary* testArguments = @{@"foo":@"bar"};
    
    RESTRequestGenerator* testGenerator = [[RESTRequestGenerator alloc] init];
    testGenerator.resource = [[RESTResourceSpecifierStub alloc] init];
    testGenerator.serverURL = [NSURL URLWithString:@"http://testServer"];
    testGenerator.httpMethod = @"GET";
    testGenerator.arguments = testArguments;
    
    
    NSURLRequest* generatedRequest;
    STAssertNoThrow(generatedRequest = [testGenerator generateRequest], @"Should not crash");
    STAssertNotNil(generatedRequest, @"Should not be nil");
    STAssertEqualObjects([generatedRequest HTTPMethod], @"GET", @"Should be GET");
    STAssertEqualObjects([generatedRequest URL], expectedURL, @"Unexpected URL");

}

-(void) testGenerateGETRequestWithSeveralArguments
{
    NSURL* expectedURL = [NSURL URLWithString:@"http://testServer/StubPath?foo=bar&bla=blaah"];
    NSDictionary* testArguments = @{@"foo":@"bar", @"bla":@"blaah"};
    
    RESTRequestGenerator* testGenerator = [[RESTRequestGenerator alloc] init];
    testGenerator.resource = [[RESTResourceSpecifierStub alloc] init];
    testGenerator.serverURL = [NSURL URLWithString:@"http://testServer"];
    testGenerator.httpMethod = @"GET";
    testGenerator.arguments = testArguments;
    
    
    NSURLRequest* generatedRequest;
    STAssertNoThrow(generatedRequest = [testGenerator generateRequest], @"Should not crash");
    STAssertNotNil(generatedRequest, @"Should not be nil");
    STAssertEqualObjects([generatedRequest HTTPMethod], @"GET", @"Should be GET");
    STAssertEqualObjects([generatedRequest URL], expectedURL, @"Unexpected URL");
    
}

-(void) testGeneratePOSTRequestNoArguments
{
    NSURL* expectedURL = [NSURL URLWithString:@"http://testServer/StubPath"];

    RESTRequestGenerator* testGenerator = [[RESTRequestGenerator alloc] init];
    testGenerator.resource = [[RESTResourceSpecifierStub alloc] init];
    testGenerator.serverURL = [NSURL URLWithString:@"http://testServer"];
    testGenerator.httpMethod = @"POST";
    
    NSURLRequest* generatedRequest;
    STAssertNoThrow(generatedRequest = [testGenerator generateRequest], @"Should not crash");
    STAssertNotNil(generatedRequest, @"Should not be nil");
    STAssertEqualObjects([generatedRequest HTTPMethod], @"POST", @"Should be GET");
    STAssertEqualObjects([generatedRequest URL], expectedURL, @"Unexpected URL");
    STAssertNil([generatedRequest HTTPBody], @"Body should be empty");
}

-(void) testGeneratePOSTRequestWithArguments
{
    NSURL* expectedURL = [NSURL URLWithString:@"http://testServer/StubPath"];
    NSDictionary* testArguments = @{@"foo":@"bar", @"bla":@"blaah"};
    
    RESTRequestGenerator* testGenerator = [[RESTRequestGenerator alloc] init];
    testGenerator.resource = [[RESTResourceSpecifierStub alloc] init];
    testGenerator.serverURL = [NSURL URLWithString:@"http://testServer"];
    testGenerator.httpMethod = @"POST";
    testGenerator.arguments = testArguments;
    
    NSURLRequest* generatedRequest;
    STAssertNoThrow(generatedRequest = [testGenerator generateRequest], @"Should not crash");
    STAssertNotNil(generatedRequest, @"Should not be nil");
    STAssertEqualObjects([generatedRequest HTTPMethod], @"POST", @"Should be GET");
    STAssertEqualObjects([generatedRequest URL], expectedURL, @"Unexpected URL");
    STAssertNotNil([generatedRequest HTTPBody], @"Body should not be empty");
}

@end
