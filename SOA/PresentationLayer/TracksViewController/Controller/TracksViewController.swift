//
//  TracksViewController.swift
//  SOA
//
//  Created by Петр Первухин on 14/01/2019.
//  Copyright © 2019 DropDead. All rights reserved.
//

import UIKit

class TracksViewController: UIViewController {
  
    // UI
    @IBOutlet weak var tableView: UITableView!
  
    // Dependencies
    private let presentationAssembly: IPresentationAssembly
    private let model: ITrackModel
    
    // DeisplayModel
    private var dataSource: [TrackCellDisplayModel] = []

    // MARK: - Initialization
    
    init(model: ITrackModel, presentationAssembly: IPresentationAssembly) {
        self.model = model
        self.presentationAssembly = presentationAssembly
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        update()
    }

    // MARK: - Setup methods

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "\(TrackTableViewCell.self)", bundle: nil), forCellReuseIdentifier: TrackTableViewCell.identifier)
    }
    
    // MARK: - Load
    
    func update(){
         model.fetchTopTracks()
    }

}


extension TracksViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TrackTableViewCell.identifier, for: indexPath) as! TrackTableViewCell
        cell.configureCell(data: dataSource[indexPath.row])
        return cell
    }
    
}

extension TracksViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 43
    }
}

extension TracksViewController : ITrackModelDelegate{
    func setup(dataSource: [TrackCellDisplayModel]) {
        self.dataSource = dataSource
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func show(error message: String) {
        
    }
    
    
}
