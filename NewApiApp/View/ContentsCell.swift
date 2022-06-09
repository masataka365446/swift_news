//
//  ContentsCell.swift
//  NewApiApp
//
//  Created by 福原雅隆 on 2021/10/25.
//

import UIKit
import SDWebImage

class ContentsCell: UITableViewCell {

    
    @IBOutlet weak var publishedAtLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentsImageView: UIImageView!
    
    static var identifire = "ContentsCell"
    
    func configure(newsContents:NewsContentsModel){
        titleLabel.text = newsContents.title
        authorLabel.text = newsContents.author
        publishedAtLabel.text = newsContents.publishedAt
        contentsImageView.sd_setImage(with: URL(string: newsContents.urlImage!), completed: nil)
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        //imageViewを角丸にする
        contentsImageView.layer.cornerRadius = contentsImageView.frame.width/2
        
        //画面からViewがはみ出ないようにする
        contentsImageView.clipsToBounds = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
