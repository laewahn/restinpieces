//
//  ServerRequestFactory.m
//  RESTinPieces
//
//  Created by Dennis Lewandowski on 8/17/12.
//  Copyright (c) 2012 Dennis Lewandowski. All rights reserved.
//

#import "JSONServerRequestFactory.h"
#import "RESTResourceSpecifier.h"
#import "RESTRequestGenerator.h"

#import "ServerRequest.h"

@implementation JSONServerRequestFactory

-(ServerRequest *) JSONGetRequestForResource: (RESTResourceSpecifier *)resource arguments:(NSDictionary *)arguments
{
    resource.format = @"json";
    
    RESTRequestGenerator* requestGenerator = [[RESTRequestGenerator alloc] initWithResource:resource serverURL:self.serverURL httpMethod:@"GET" arguments:arguments timeout:self.timeout];
    NSURLRequest* urlRequest = [requestGenerator generateRequest];
    ServerRequest* request = [[ServerRequest alloc] initWithURLRequest:urlRequest];
    
    return request;
}

-(ServerRequest *) JSONPostRequestForResource: (RESTResourceSpecifier *)resource arguments:(NSDictionary *)arguments
{
    resource.format = @"json";

    RESTRequestGenerator* requestGenerator = [[RESTRequestGenerator alloc] initWithResource:resource serverURL:self.serverURL httpMethod:@"POST" arguments:arguments timeout:self.timeout];
    
    NSURLRequest* urlRequest = [requestGenerator generateRequest];
    ServerRequest* request = [[ServerRequest alloc] initWithURLRequest:urlRequest];

    return request;
}

-(ServerRequest *) JSONPutRequestForResource: (RESTResourceSpecifier *)resource arguments:(NSDictionary *)arguments
{
    resource.format = @"json";
    
    RESTRequestGenerator* requestGenerator = [[RESTRequestGenerator alloc] initWithResource:resource serverURL:self.serverURL httpMethod:@"PUT" arguments:arguments timeout:self.timeout];
    
    NSURLRequest* urlRequest = [requestGenerator generateRequest];
    ServerRequest* request = [[ServerRequest alloc] initWithURLRequest:urlRequest];
    
    return request;
}

-(ServerRequest *) JSONDeleteRequestForResource: (RESTResourceSpecifier *)resource arguments:(NSDictionary *)arguments
{
    resource.format = @"json";
    
    RESTRequestGenerator* requestGenerator = [[RESTRequestGenerator alloc] initWithResource:resource serverURL:self.serverURL httpMethod:@"DELETE" arguments:arguments timeout:self.timeout];
    
    NSURLRequest* urlRequest = [requestGenerator generateRequest];
    ServerRequest* request = [[ServerRequest alloc] initWithURLRequest:urlRequest];
    
    return request;

}

@end
