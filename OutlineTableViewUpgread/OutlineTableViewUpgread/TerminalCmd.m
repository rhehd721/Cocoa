//
//  TerminalCmd.m
//  OutlineTableViewUpgread
//
//  Created by bhPark on 2021/10/20.
//

#import "TerminalCmd.h"

@implementation TerminalCmd

-(void)killProcess:(NSString*)pid{
    NSLog(@"pid : %@", pid);
    NSPipe *pipe = [NSPipe pipe];
    NSFileHandle *file = pipe.fileHandleForReading;

    NSTask *task = [[NSTask alloc] init];
    task.launchPath = @"bin/kill";
    NSArray * arguments = [[NSArray alloc] initWithObjects:pid, nil];

    task.arguments = arguments;
    task.standardOutput = pipe;

    [task launch];

    NSData *data = [file readDataToEndOfFile];
    [file closeFile];

    NSString *grepOutput = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
    NSLog (@"kill : %@", grepOutput);
}

@end
