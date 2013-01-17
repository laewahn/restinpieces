//
//  RESTRequestGenerator.h
//  RESTinPieces
//
//  Created by Dennis Lewandowski on 8/17/12.
//  Copyright (c) 2012 Dennis Lewandowski. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RESTResourceSpecifier;

/// The RESTRequestGenerator creates a NSURLRequest for access to a given resource
/**
 
 The RESTRequestGenerator encapsulates the creation of a NSURLRequest for a given resource. You need to specify the serverURL of the server that hosts the resource, as well as the http method used to access the resource (GET, POST, PUT, DELETE). Additionally, you can provide a dictionary of arguments used for the request, which will be rendered into the request.
 
 */
@interface RESTRequestGenerator : NSObject

// Initialize a RESTRequestGenerator, given the resource, serverURL, the http method (GET, POST, PUT, DELETE) and an optional dictionary of arguments.
-(id)initWithResource:(RESTResourceSpecifier *)resource serverURL:(NSURL *)serverURL httpMethod:(NSString *)httpMethod arguments:(NSDictionary *)arguments timeout:(NSInteger) timeout;

// Generate the NSURLRequest for the specified resource.
-(NSURLRequest *)generateRequest;

// The resource for which the NSURLRequest will be created.
@property RESTResourceSpecifier* resource;

// The URL of the server that's hosting the resource.
@property NSURL* serverURL;

// Timeout for the request.
@property NSInteger timeout;

// The http method to access the resource
@property NSString* httpMethod;

// Optional: A dictionary of arguments for the request.
@property NSDictionary* arguments;


@end
