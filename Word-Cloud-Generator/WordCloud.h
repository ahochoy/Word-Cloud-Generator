//
//  WordCloud.h
//  WordCloudGenerator
//
//  Created by Andrew HoChoy on 10/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MPPPost.h"
#import "WordTag.h"


@interface WordCloud : NSObject{
    
    NSCountedSet *countStore;
    NSMutableDictionary *sourceStore;
    
}

-(NSArray *) createWordCloudFromPosts:(NSArray *)posts;
-(NSArray *) createWordCloudFromPosts:(NSArray *)posts withCategory:(NSString *) category;
-(NSArray *) createWordCloudFromPosts:(NSArray *)posts withTag:(NSString *) tag;

-(void) cleanProperties;
-(void) processPost:(MPPPost *) post;

-(NSArray *)renderWordCloud;


@end
