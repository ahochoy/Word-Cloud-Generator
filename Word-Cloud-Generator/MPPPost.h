//
//  MPPPost.h
//  WordCloudGenerator
//
//  Created by Andrew HoChoy on 10/30/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MPPPost : NSObject{
        NSString *_content;
        NSString *_postID;
        NSArray *_categories;
        NSArray *_tags;
}

@property (assign) NSString* _content;
@property (assign) NSString* _postID; 
@property (nonatomic, retain) NSArray *_categories;
@property (nonatomic, retain) NSArray *_tags;

@end
