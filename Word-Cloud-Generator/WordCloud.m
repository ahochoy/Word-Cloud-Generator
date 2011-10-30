//
//  WordCloud.m
//  WordCloudGenerator
//
//  Created by Andrew HoChoy on 10/24/11.
//

#import "WordCloud.h"

@implementation WordCloud

-(NSArray *) createWordCloudFromPosts:(NSArray *)posts{
    
    [self cleanProperties];
    
    for (MPPPost *post in posts) {
        [self processPost: post];
    }
    
    return [self renderWordCloud];
}

-(NSArray *) createWordCloudFromPosts:(NSArray *)posts withCategory:(NSString *) category{
    
    [self cleanProperties];
    
    for (MPPPost *post in posts) {
        if([post._categories containsObject: category])
            [self processPost: post];
    }
    
    return [self renderWordCloud];
}

-(NSArray *) createWordCloudFromPosts:(NSArray *)posts withTag:(NSString *) tag{
    
    [self cleanProperties];
    
    for (MPPPost *post in posts) {
        if([post._tags containsObject: tag])
            [self processPost: post];
    }
    
    return [self renderWordCloud];
}

-(void) processPost:(MPPPost *) post{

    NSLinguisticTagger *tagger = [[NSLinguisticTagger alloc] 
                                  initWithTagSchemes:
                                    [NSArray arrayWithObjects:
                                     NSLinguisticTagSchemeNameType,
                                     NSLinguisticTagSchemeLexicalClass, nil]
                                  options:0];
    
    [tagger setString: post._content];
    
    NSRange textRange = NSMakeRange(0, [post._content length]);
    
    [tagger enumerateTagsInRange:textRange 
                          scheme:NSLinguisticTagSchemeNameTypeOrLexicalClass
                         options:NSLinguisticTaggerJoinNames 
                      usingBlock:^(NSString *tag, NSRange tokenRange, NSRange sentenceRange, BOOL *stop) {
                         
                          NSArray *acceptableTags = [NSArray arrayWithObjects: NSLinguisticTagPlaceName, NSLinguisticTagPersonalName, NSLinguisticTagNoun, NSLinguisticTagOrganizationName, nil];
                          
                          if([acceptableTags containsObject: tag]){
                              
                              NSString *keyword = [post._content substringWithRange: tokenRange];
                              
                              [countStore addObject: keyword];
                              
                              if([sourceStore objectForKey: keyword] == nil){
                                  
                                  NSMutableSet *sources = [NSMutableSet setWithObject: post._postID];
                                  [sourceStore setObject: sources forKey: keyword];
                                  
                              } else {
                                  
                                  NSMutableSet *sources = [sourceStore objectForKey: keyword];
                                  [sources addObject: post._postID];
                                  [sourceStore setObject: sources forKey: keyword];
                                  
                              }
                          }
                      }];
    
}

-(NSArray *)renderWordCloud{
    
    NSMutableArray *wordsInOrder = [[NSMutableArray alloc] init];
    
    NSSortDescriptor* sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"count" ascending:NO];
    
    for (NSString *word in countStore) {
        
        WordTag *tag = [WordTag tagWithWord:word 
                                      Count:[countStore countForObject:word]
                                 andSources:[sourceStore objectForKey:word]];
        
        [wordsInOrder addObject: tag];
    }
    
    [wordsInOrder sortUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]];
    
    return wordsInOrder;
}

-(void) cleanProperties {
    
    [countStore removeAllObjects];
    [sourceStore removeAllObjects];
    
}


@end
