//
//  CharacterTableViewCell.swift
//  marvel-ios
//
//  Created by Marcio Alico on 12/28/21.
//

import Foundation
import UIKit
import SkeletonView

class CharacterTableViewCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var grayView: UIView!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var character: Character? {
        didSet {
            setUpUI()
        }
    }
    
    private func setUpUI() {
        setUpViews()
        setUpLabel()
        setUpImage()
        setUpSkeleton()
    }
    
    fileprivate func setUpViews() {
        containerView.roundCorners()
        containerView.addShadow(offsetX: 6, offsetY: 6, color: Constants.Colors.red.cgColor, opacity: 0.3)
        containerView.addBorder(color: Constants.Colors.red.cgColor, width: 0.8)
        grayView.roundCorners()
    }
    
    fileprivate func setUpLabel() {
        guard let character = character else { return }
        
        nameLabel.text = character.name
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont(name: Constants.Fonts.bold, size: 35)
        nameLabel.textColor = .white
    }
    
    fileprivate func setUpImage() {
        guard let character = character,
              let imgageUrl = character.thumbnail?.url else { return }
        
        thumbnailImageView.roundCorners()
        thumbnailImageView.downloaded(from: imgageUrl)
        thumbnailImageView.contentMode = .scaleAspectFill
    }
    
    private func setUpSkeleton() {
        isSkeletonable = true
        thumbnailImageView.isSkeletonable = true
        containerView.isSkeletonable = true
        
        thumbnailImageView.showAnimatedGradientSkeleton(usingGradient: .init(baseColor: Constants.Colors.gray),
                                                animation: nil, transition: .crossDissolve(0.1))
        
        containerView.showAnimatedGradientSkeleton(usingGradient: .init(baseColor: Constants.Colors.gray),
                                                animation: nil, transition: .crossDissolve(0.1))
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.thumbnailImageView.hideSkeleton()
            self.containerView.hideSkeleton()
        }
    }
}
