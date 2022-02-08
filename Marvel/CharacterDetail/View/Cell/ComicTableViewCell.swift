//
//  ComicTableViewCell.swift
//  Marvel
//
//  Created by Marcio Alico on 1/4/22.
//

import SkeletonView
import Foundation
import UIKit

class ComicTableViewCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var comicImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var bottomLabel: UILabel!
    
    let kNoPriceDefaultMessage: String = "No price information"
    
    var comic: ComicDetail? {
        didSet {
            setUpUI()
        }
    }
    
    func setUpUI() {
        setUpViews()
        setImage()
        setTitleLabel()
        setBottomLabel()
        setSekeltonView()
    }
    
    private func setUpViews() {
        containerView.roundCorners()
        containerView.addBorder(color: Constants.Colors.gray.cgColor, width: 1)
        
        bottomView.clipsToBounds = true
        bottomView.layer.cornerRadius = 5
        bottomView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        bottomView.backgroundColor = Constants.Colors.red
    }
    
    private func setImage() {
        guard let url = comic?.images?.first?.url else { return }
        comicImageView.addBorder(color: Constants.Colors.gray.cgColor, width: 1)
        comicImageView.downloaded(from: url, contentMode: .scaleAspectFill)
        
        comicImageView.clipsToBounds = true
        comicImageView.layer.cornerRadius = 8
        comicImageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
    }
    
    private func setTitleLabel() {
        guard let title = comic?.title else { return }
        titleLabel.text = title
        titleLabel.font = UIFont(name: Constants.Fonts.boldItalic, size: 30.0)
    }
    
    private func setBottomLabel() {
        var detailString: String = ""
        
        if let pageCounts = comic?.pageCount, pageCounts != 0 {
            detailString.append(" Pages amount: \(pageCounts) ")
        }
        
        if let prices = comic?.prices,
           let printPrice = prices.first?.price,
           printPrice != 0 {
            detailString.append(" Price $\(printPrice) ")
        }
        
        setBottomText(detailString)
    }
    
    private func setBottomText(_ text: String) {
        if text.count > 0 {
            bottomLabel.text = text
        } else {
            bottomLabel.text = kNoPriceDefaultMessage
        }
        
        bottomLabel.textAlignment = .center
        bottomLabel.font = UIFont(name: Constants.Fonts.italic, size: 16.0)
        bottomLabel.textColor = .white
    }
    
    private func setSekeltonView() {
        comicImageView.isSkeletonable = true
        
        comicImageView.showAnimatedGradientSkeleton(usingGradient: .init(baseColor: Constants.Colors.red,
                                                                         secondaryColor: Constants.Colors.blue),
                                                    animation: nil,
                                                    transition: .crossDissolve(0.1))
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.comicImageView.hideSkeleton()
        }
    }
}
