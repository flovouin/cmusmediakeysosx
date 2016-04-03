//
//  AppDelegate.swift
//  CmusMediaKeys
//
//  Created by Flo Vouin on 29/03/16.
//  Copyright © 2016 flo. All rights reserved.
//

import Cocoa
import Foundation

class CmusDelegate: MediaKeysDelegate {
    func didPressPlay() {
        CmusController.playOrPause()
    }

    func didPressNext() {
        CmusController.next()
    }

    func didPressPrev() {
        CmusController.prev()
    }
}
