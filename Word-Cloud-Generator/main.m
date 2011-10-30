//
//  main.m
//  Word-Cloud-Generator
//
//  Created by andrew s hochoy on 10/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "WordCloud.h"

int main (int argc, const char * argv[])
{

    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    MPPPost *postOne = [[MPPPost alloc] init];
    postOne._content = @"This here rat has been following us up and down the Florida Turnpike all night.  We might have to fly to Washington, DC to enlist the assistance of the CIA.  Hopefully they can figure out what is going on.  Good thing we have a safe house in New York to stay in until the weather gets better.  Is it snowing?";
    postOne._postID = @"11";
    postOne._categories = [NSArray arrayWithObject: @"Breaking News"];
    postOne._tags = [NSArray arrayWithObjects: @"Rescue Plan", @"Safe House", nil];
    
    MPPPost *postTwo = [[MPPPost alloc] init];
    postTwo._content = @"Run chiken run.  The farmers got the gun.  The wife has the oven hot.  And your the one.  So run and run.  SO you dont get served with a bun.  Get out of the house.  Get in, get out...fly chiken fly.  New York is your safe destination.";
    postOne._postID = @"12";
    postOne._categories = [NSArray arrayWithObject: @"Silly Stories"];
    postOne._tags = [NSArray arrayWithObjects: @"Rescue Plan", @"Farm Animals", nil];
    
    NSArray *postList = [NSArray arrayWithObjects: postOne, postTwo, nil];
    
    WordCloud *myWordCloud = [[WordCloud alloc] init];
    
    NSArray *items = [myWordCloud createWordCloudFromPosts: postList];
    
    NSLog(@"%@/n", items);
    
    [pool drain];
    return 0;
}

