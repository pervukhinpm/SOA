//
//  PresentationAssembly.swift
//  SOA
//
//  Created by Петр Первухин on 14/01/2019.
//  Copyright © 2019 DropDead. All rights reserved.
//

import Foundation

import UIKit

protocol IPresentationAssembly {
    func tracksViewCotnroller() -> TracksViewController    
}

class PresentationAssembly: IPresentationAssembly {
    
    private let serviceAssembly: IServicesAssembly
    
    init(serviceAssembly: IServicesAssembly) {
        self.serviceAssembly = serviceAssembly
    }
    
    // MARK: - TracksViewController
    
    func tracksViewCotnroller() -> TracksViewController {
        let model = makeModel()
        let trackVC = TracksViewController(model: model, presentationAssembly: self)
        model.delegate = trackVC
        return trackVC
    }

    // MARK: - Model

    private func makeModel() -> ITrackModel {
        return TrackModel(tracksService: serviceAssembly.tracksService)
    }
    
    // MARK: - DetailViewController
    //.....

}
