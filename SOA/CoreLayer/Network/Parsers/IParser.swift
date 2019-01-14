//
//  IParser.swift
//  SOA
//
//  Created by Петр Первухин on 14/01/2019.
//  Copyright © 2019 DropDead. All rights reserved.
//

import Foundation

protocol IParser {
    associatedtype Model
    func parse(data: Data) -> Model?
}
