//
//  Photo.m
//  Cats
//
//  Created by Kyla  on 2018-08-16.
//  Copyright © 2018 Kyla . All rights reserved.
//

#import "Photo.h"

@implementation Photo






+ (void)getPhotos:(void (^)(NSMutableArray *))completion {
    //get url from browser
    NSURL *url = [NSURL URLWithString:@"https:api.imgur.com/3/gallery/search?q=cats"];
    ///make request
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setValue:@"Client-ID 24757e26de9bf67" forHTTPHeaderField:@"Authorization"];
    NSLog(@"creating task");
     // shortcut if we're just sending a GET request & don't actually need to configure the NSURLRequest
    NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSLog(@"Completed request: %@", response);
        
         // this is checking if there was an error making the request on the iOS networking level so use an if statement
        if (error !=nil) {
            ///indicating the error
            NSLog(@"Error making the request: %@", error.localizedDescription);
            abort();
        }
         // ..but we still need to check if the request was properly understood by the server -- there could be no NSError set, but the response from the server was like "400 - that was some garbage"
        NSInteger statusCode = [(NSHTTPURLResponse *)response statusCode];
        if (statusCode < 200 || statusCode >= 300) {
             // ^ we need to cast the response to an HTTPURLResponse, because  this method is general enough that it can work with non-HTTP urls, hence we have a more general response object (because URLs can be used for protocols other than HTTP & statusCode is an HTTP-specific thing
            // what this is here is "casting" which is *not* "converting" the object -- it's telling XCode "you think it's this type, but I know it's actually this other type"
            ///indicate failure somehow
            NSLog(@"non-ok error code: %@", response);
            abort();
        }
        //         // now, we have the NSData with our information
        //         /* Just for demo purposes, look at our data
        //          NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        //          NSLog(@"Got data: %@", string);
        //          */
        NSError *jsonError = nil;
        NSDictionary *info = [NSJSONSerialization
                              JSONObjectWithData:data
                              options:0
                              error:&jsonError];
        if (jsonError != nil) {
            NSLog(@"Error parsing JSON %@", jsonError.localizedDescription);
            abort();
        }
//        NSLog(@"Meta data: %@", info[@"meta"]);
        NSMutableArray *cats = [@[] mutableCopy];
        for (NSDictionary *cat in info[@"data"])
        {
            NSLog(@"getting the info data %@", request);
            [cats addObject:[[Cat alloc] initWithInfo:cat]];
        }
        completion(cats);
    }];
    NSLog(@"Createed task");
    [task resume];
    NSLog(@"Resumed task");    
}








@end
