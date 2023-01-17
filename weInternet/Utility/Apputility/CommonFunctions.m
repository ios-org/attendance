//
//  CommonFunctions.m
//  Service
//
//  Created by Ahmad Fouad on 08/09/17.
//  Copyright © 2017 Junaid. All rights reserved.
//

#import "CommonFunctions.h"
#include <CommonCrypto/CommonDigest.h>

@implementation CommonFunctions

+ (NSString*)sha1Encode:(NSString*)input {

    const char *cstr = [input cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:input.length];
    
    uint8_t digest[CC_SHA256_DIGEST_LENGTH];
    
    CC_SHA256(data.bytes, (int)data.length, digest);
    
    NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA256_DIGEST_LENGTH * 2];

    for(int i = 0; i < CC_SHA256_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return output;
}

@end
