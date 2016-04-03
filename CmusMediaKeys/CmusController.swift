//
//  CommandRunner.swift
//  CmusMediaKeys
//
//  Created by Flo Vouin on 03/04/16.
//  Copyright © 2016 flo. All rights reserved.
//

import Foundation

class CmusController {
    static func playOrPause() {
        executeCommand("/usr/local/bin/cmus-remote", args: ["-u"])
    }

    static func next() {
        executeCommand("/usr/local/bin/cmus-remote", args: ["-n"])
    }

    static func prev() {
        executeCommand("/usr/local/bin/cmus-remote", args: ["-r"])
    }
}

func executeCommand(command: String, args: [String]) -> String {
    let task = NSTask()

    task.launchPath = command
    task.arguments = args

    let pipe = NSPipe()
    task.standardOutput = pipe
    task.launch()

    let data = pipe.fileHandleForReading.readDataToEndOfFile()
    let output: String = String(NSString(data: data, encoding: NSUTF8StringEncoding))

    return output
}
