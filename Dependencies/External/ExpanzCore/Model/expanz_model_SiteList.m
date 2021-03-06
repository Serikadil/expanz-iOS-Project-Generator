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

#import "expanz_model_SiteList.h"
#import "expanz_model_AppSite.h"
#import "expanz_SdkConfiguration.h"


@implementation expanz_model_SiteList

/* ================================================== Initializers ================================================== */
- (id) init {
    self = [super init];
    if (self) {
        _sites = [[NSMutableArray alloc] init];
    }
    return self;
}

/* ================================================ Interface Methods =============================================== */
- (NSArray*) sites {
    NSSortDescriptor* sorter = [NSSortDescriptor sortDescriptorWithKey:@"appSiteId" ascending:YES];
    return [_sites sortedArrayUsingDescriptors:[NSArray arrayWithObject:sorter]];
}

- (expanz_model_AppSite*) preferredSite {
    SdkConfiguration* configuration = [SdkConfiguration globalConfiguration];
    for (AppSite* site in _sites) {
        if ([[site appSiteId] isEqualToString:[configuration preferredSite]]) {
            return site;
        }
    }
    return nil;
}

- (void) addSite:(expanz_model_AppSite*)site {
    [_sites addObject:site];
}

/* ================================================== Utility Methods =============================================== */
- (NSString*) description {
    return [NSString stringWithFormat:@"SiteList: %@", _sites];
}


@end