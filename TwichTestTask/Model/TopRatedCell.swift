//
//  TableViewCell.swift
//  TwichTestTask
//
//  Created by Максим Окунеев on 6/30/20.
//  Copyright © 2020 Максим Окунеев. All rights reserved.
//

import UIKit

class TopRatedCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var gameImage: UIImageView!
    @IBOutlet weak var chanals: UILabel!
    @IBOutlet weak var viewers: UILabel!
    
       func configure(game: TopRatedModel?, image: UIImage?) {
        name.text = game?.game?.name ?? ""
        gameImage.image = image
        chanals.text = "Chanals: \(game?.channels ?? 0)"
        viewers.text = "Viewers: \(game?.viewers ?? 0)"
       }
}
