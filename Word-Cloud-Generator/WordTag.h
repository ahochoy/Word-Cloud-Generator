//
//  WordTag.h
//  WordCloudGenerator
//
//  Created by Andrew HoChoy on 10/30/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WordTag : NSObject{
    
    NSString *keyword;
    NSUInteger count;
    NSMutableSet *sources;
    
}

@property (assign) NSString *keyword;
@property (assign) NSUInteger count;
@property (nonatomic, retain) NSMutableSet *sources;

+(WordTag *) tagWithWord: (NSString *)wrd Count: (NSUInteger)cnt andSources: (NSMutableSet*)src;


@end
