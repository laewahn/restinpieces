//
//  ServerRequestFactory.h
//  RESTinPieces
//
//  Created by Dennis Lewandowski on 8/17/12.
//  Copyright (c) 2012 Dennis Lewandowski. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ServerRequest;
@class RESTResourceSpecifier;

/// The JSONServerRequestFactory is an example factory to show the use of the RESTinPieces Framework. You may extend it using subclassing or writing a category.
/**
 
 This factory class shows some examples on how to use the RESTinPieces framework. It provides methods to create json requests for given resources. The server and timeout for the requests can be set for all generated requests.
 */
@interface JSONServerRequestFactory : NSObject

// Create a json GET request for the given resource with the specified arguments
-(ServerRequest *) JSONGetRequestForResource: (RESTResourceSpecifier *)resource arguments:(NSDictionary *)arguments;

// Create a json POST request for the given resource with the specified arguments
-(ServerRequest *) JSONPostRequestForResource: (RESTResourceSpecifier *)resource arguments:(NSDictionary *)arguments;

// Create a json PUT request for the given resource with the specified arguments
-(ServerRequest *) JSONPutRequestForResource: (RESTResourceSpecifier *)resource arguments:(NSDictionary *)arguments;

// Create a json DELETE request for the given resource with the specified arguments
-(ServerRequest *) JSONDeleteRequestForResource: (RESTResourceSpecifier *)resource arguments:(NSDictionary *)arguments;

// The URL for the resources server
@property NSURL* serverURL;

// Timeout for the requests
@property NSInteger timeout;


@end
