//
//  MediaApplication.swift
//  CmusMediaKeys
//
//  Created by Flo Vouin on 29/03/16.
//  Copyright © 2016 flo. All rights reserved.
//

import Foundation
import Cocoa

let kMediaKeysPlay: Int32 = 16
let kMediaKeysNext: Int32 = 19
let kMediaKeysPrev: Int32 = 20

protocol MediaKeysDelegate {
    func didPressPlay()
    func didPressPrev()
    func didPressNext()
}

class MediaApplication: NSApplication {
    var mediaKeysDelegate: MediaKeysDelegate?

    override init() {
        super.init()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func sendEvent(event: NSEvent) {
        if (event.type == .SystemDefined && event.subtype.rawValue == 8) {
            let keyCode = ((event.data1 & 0xFFFF0000) >> 16)
            let keyFlags = (event.data1 & 0x0000FFFF)
            let keyState = (((keyFlags & 0xFF00) >> 8)) == 0xA
            let keyRepeat = (keyFlags & 0x1)
            mediaKeyEvent(Int32(keyCode), state: keyState, keyRepeat: Bool(keyRepeat))
        }

        super.sendEvent(event)
    }

    func mediaKeyEvent(key: Int32, state: Bool, keyRepeat: Bool) {
        if !state { return }

        switch(key) {
        case kMediaKeysPlay:
            self.mediaKeysDelegate?.didPressPlay()
            break
        case kMediaKeysNext:
            self.mediaKeysDelegate?.didPressNext()
            break
        case kMediaKeysPrev:
            self.mediaKeysDelegate?.didPressPrev()
            break
        default:
            break
        }
    }
}
