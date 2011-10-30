//
//  WordTag.m
//  WordCloudGenerator
//
//  Created by Andrew HoChoy on 10/30/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "WordTag.h"

@implementation WordTag

@synthesize keyword, count, sources;

+(WordTag *) tagWithWord: (NSString *)wrd Count: (NSUInteger)cnt andSources: (NSMutableSet*)src{
    
    WordTag *newTag = [[WordTag alloc] init];
    
    newTag.keyword = wrd;
    newTag.count = cnt;
    newTag.sources = src;
    
    return newTag;
}

@end
