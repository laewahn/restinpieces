//
//  ServerRequestDelegate.h
//  RESTinPieces
//
//  Created by Dennis Lewandowski on 8/22/12.
//  Copyright (c) 2012 Dennis Lewandowski. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ServerRequest;

/// The ServerRequestDelegate will be informed about the outcome of the ServerRequest.
@protocol ServerRequestDelegate <NSObject>

// The request succeeded and the loaded data is passed to the delegate.
-(void)request:(ServerRequest *)request didFinishLoadingData:(NSData *)theData;

// The request failed, the corresponding error is passed to the delegate.
-(void)request:(ServerRequest *)request didFailLoadingDataWithError:(NSError *)error;


@end
