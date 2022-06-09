//
//  HeaderContentCell.swift
//  NewApiApp
//
//  Created by 福原雅隆 on 2021/10/25.
//

import UIKit
import SDWebImage

class HeaderContentCell: UITableViewCell {

    
    @IBOutlet weak var contentnsImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var publishedAtLabel: UILabel!
    
    static let identifire = "HeaderContentCell"
    
    func configure(newsContents:NewsContentsModel){
        titleLabel.text = newsContents.title
        authorLabel.text = newsContents.author
        publishedAtLabel.text = newsContents.publishedAt
        contentnsImageView.sd_setImage(with: URL(string: newsContents.urlImage!), completed: nil)
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
