//
//  main.swift
//  Caca2
//
//  Created by Flo Vouin on 29/03/16.
//  Copyright © 2016 flo. All rights reserved.
//

import Foundation
import AppKit

let mediaApplication = MediaApplication()
mediaApplication.mediaKeysDelegate = CmusDelegate()
mediaApplication.run()
