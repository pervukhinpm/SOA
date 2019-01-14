//
//  IRequest.swift
//  SOA
//
//  Created by Петр Первухин on 14/01/2019.
//  Copyright © 2019 DropDead. All rights reserved.
//

import Foundation

protocol IRequest {
    var urlRequest: URLRequest? { get }
}
