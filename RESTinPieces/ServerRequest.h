//
//  ServerRequest.h
//  RESTinPieces
//
//  Created by Dennis Lewandowski on 8/17/12.
//  Copyright (c) 2012 Dennis Lewandowski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServerRequestDelegate.h"

@class ServerRequest;

/// The server request encapsulates a NSURLConnection.
/**
 
 The server request performs a NSURLRequest and handles the URLConnections delegation concerns. After the NSURLConnection succeeded, the loaded data is handed over by the ServerRequests delegate method, or can be requested from the ServerRequest itself.
 
 */
@interface ServerRequest : NSObject

// Initialize a new ServerRequest with a given NSURLRequest.
-(id) initWithURLRequest:(NSURLRequest *)aRequest;

// Start the request.
-(void) start;

// The delegate, that gets informed about the outcome of the request.
@property(weak) id<ServerRequestDelegate> delegate;

// The loaded data.
@property(readonly) NSData* data;


@end
