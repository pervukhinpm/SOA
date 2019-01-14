//
//  ServicesAssembly.swift
//  SOA
//
//  Created by Петр Первухин on 14/01/2019.
//  Copyright © 2019 DropDead. All rights reserved.
//

import Foundation

protocol IServicesAssembly {
    var tracksService: ITracksService { get }
}

class ServicesAssembly: IServicesAssembly {
    
    private let coreAssembly: ICoreAssembly
    
    init(coreAssembly: ICoreAssembly) {
        self.coreAssembly = coreAssembly
    }
    
    lazy var tracksService: ITracksService = TracksService(requestSender: self.coreAssembly.requestSender)

}
