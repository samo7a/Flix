//
//  MovieCell.swift
//  Flix
//
//  Created by Ahmed  Elshetany  on 9/4/21.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var overview: UILabel!
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var title: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
