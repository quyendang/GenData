//
//  AppDelegate.swift
//  Gen Data
//
//  Created by QuyenDang on 12/03/2021.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    
    var activity: NSObjectProtocol?

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        
        activity = ProcessInfo().beginActivity(options: .userInitiatedAllowingIdleSystemSleep, reason: "Timer delay")
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

