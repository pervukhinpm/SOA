//
//  TrackTableViewCell.swift
//  SOA
//
//  Created by Петр Первухин on 14/01/2019.
//  Copyright © 2019 DropDead. All rights reserved.
//

import UIKit
import Kingfisher

class TrackTableViewCell: UITableViewCell {

    static let identifier = "TrackTableViewCellID"
    
    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var trackNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(data: TrackCellDisplayModel){
        trackNameLabel.text = data.songName
        artistNameLabel.text = data.artistName

        let url = URL(string: data.imageUrl) 
        
        albumImageView.kf.setImage(with: url,
                              placeholder: UIImage(named: "placeholder"),
                              options: nil,
                              progressBlock: nil,
                              completionHandler: nil)
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        trackNameLabel.text = ""
        artistNameLabel.text = ""
        albumImageView.image = nil
    }
}
