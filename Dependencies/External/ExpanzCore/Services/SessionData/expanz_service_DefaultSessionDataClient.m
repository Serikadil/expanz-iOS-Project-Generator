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

#import "expanz_service_SessionDataClientDelegate.h"
#import "expanz_service_SessionDataRequest.h"
#import "expanz_service_DefaultSessionDataClient.h"
#import "RXMLElement.h"
#import "RXMLElement+SessionData.h"


@implementation expanz_service_DefaultSessionDataClient

@synthesize serviceUrl = _serviceUrl;

/* ================================================== Initializers ================================================== */
- (id) initWithServiceUrl:(NSString*)serviceUrl {
    self = [super init];
    if (self) {
        _serviceUrl = serviceUrl;
    }
    return self;
}

/* ================================================ Interface Methods =============================================== */
- (void) retrieveSessionDataWith:(SessionDataRequest*)request
                        delegate:(id<expanz_service_SessionDataClientDelegate>)delegate {

    [self.httpTransport
        post:_serviceUrl payload:[request toXml] headers:[self requestHeaders] withBlock:^(LRRestyResponse* response) {

        if (response.status == 200) {
            LogDebug(@"Response: %@, ", [response asString]);
            RXMLElement* element = [RXMLElement elementFromXMLString:[response asString]];
            [delegate requestDidFinishWithMenu:[[element child:@"ExecXResult.ESA.Menu"] asMenu]];
        }
        else {
            [super dispatchErrorWith:delegate statusCode:response.status userInfo:[response asString]];
        }
    }];
}


@end
