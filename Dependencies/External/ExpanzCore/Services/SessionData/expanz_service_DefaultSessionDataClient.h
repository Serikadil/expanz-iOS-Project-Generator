////////////////////////////////////////////////////////////////////////////////
//
//  EXPANZ
//  Copyright 2008-2011 EXPANZ
//  All Rights Reserved.
//
//  NOTICE: Expanz permits you to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////

#import <Foundation/Foundation.h>
#import "expanz_service_AbstractServiceClient.h"
#import "ExpanzSessionDataClient.h"

@interface expanz_service_DefaultSessionDataClient : AbstractServiceClient<ExpanzSessionDataClient>
- (id) initWithServiceUrl:(NSString*)serviceUrl;


@property (nonatomic, strong, readonly) NSString* serviceUrl;



@end

/* ================================================================================================================== */
@compatibility_alias DefaultSessionDataClient expanz_service_DefaultSessionDataClient;
