//
//  ServerRequest.m
//  RESTinPieces
//
//  Created by Dennis Lewandowski on 8/17/12.
//  Copyright (c) 2012 Dennis Lewandowski. All rights reserved.
//

#import "ServerRequest.h"

@interface ServerRequest() {
    NSURLConnection *theConnection;
    NSURLRequest *theRequest;
    NSMutableData *responseData;
}

@end


@implementation ServerRequest

@synthesize data = _data;

-(id) initWithURLRequest:(NSURLRequest *)aRequest
{
    self = [super init];
    
    if(self) {
        theRequest = aRequest;
    }
    
    return self;
}

-(void) start
{
    theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    [theConnection start];
}


# pragma mark -
# pragma mark NSURLConnection delegate methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    responseData = nil;
    responseData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [responseData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    [self.delegate request:self didFailLoadingDataWithError:error];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    _data = [NSData dataWithData:responseData];
    [self.delegate request:self didFinishLoadingData:self.data];
}

@end
