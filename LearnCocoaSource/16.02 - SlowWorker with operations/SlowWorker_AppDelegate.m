//
//  SlowWorker_AppDelegate.m
//  SlowWorker
//
//  Created by JN on 11/21/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "SlowWorker_AppDelegate.h"

#import "FoundationAdditions.h"

@implementation SlowWorker_AppDelegate

@synthesize fetchedData;
@synthesize processedData;
@synthesize firstResult;
@synthesize secondResult;
@synthesize isWorking;

- (void)fetchSomethingFromServer {
  sleep(1);
  self.fetchedData = @"Hi there";
}

- (void)processData {
  sleep(2);
  self.processedData = [self.fetchedData uppercaseString];
}

- (void)calculateFirstResult {
  sleep(3);
  self.firstResult = [NSString stringWithFormat:@"Number of chars: %d",
    [self.processedData length]];
}

- (void)calculateSecondResult {
  sleep(4);
  self.secondResult = [self.processedData stringByReplacingOccurrencesOfString:@"E"
                             withString:@"e"];
}

- (void)finishWorking {
  DISPATCH_ON_MAIN_THREAD
  NSString *resultsSummary = [NSString stringWithFormat:
                              @"First: [%@]\nSecond: [%@]",
                              self.firstResult, self.secondResult];
  [resultsTextView setString:resultsSummary];
  self.isWorking = NO;
  NSLog(@"done");
}

- (IBAction)doWork:(id)sender {
  NSLog(@"starting");
  self.isWorking = YES;
  
  NSOperationQueue *queue = [[NSOperationQueue alloc] init];
  NSOperation *fetch = 
    [self operationForSelector:@selector(fetchSomethingFromServer)];
  NSOperation *process = 
    [self operationForSelector:@selector(processData)];
  NSOperation *calculateFirst = 
    [self operationForSelector:@selector(calculateFirstResult)];
  NSOperation *calculateSecond = 
    [self operationForSelector:@selector(calculateSecondResult)];
  NSOperation *show = 
    [self operationForSelector:@selector(finishWorking)];

  [process addDependency:fetch];
  [calculateFirst addDependency:process];
  [calculateSecond addDependency:process];
  [show addDependency:calculateFirst];
  [show addDependency:calculateSecond];

  [queue addOperation:fetch];
  [queue addOperation:process];
  [queue addOperation:calculateFirst];
  [queue addOperation:calculateSecond];
  [queue addOperation:show];
}

@end
