//
//  VideoCell.swift
//  UITableView-Programmatic
//
//  Created by Aslan Korkmaz on 16.04.2025.
//

import UIKit

class VideoCell: UITableViewCell {
    
    var videoImageView  = UIImageView()
    var videoTitleLabel = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(videoImageView)
        addSubview(videoTitleLabel)
        
        configureImageView()
        configureLabel()
        setImageConstraints()
        setTitleLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    func set(video: Video) {
        videoImageView.image    = video.image
        videoTitleLabel.text    = video.title
    }
    
    func configureImageView(){
        videoImageView.layer.cornerRadius   = 10
        videoImageView.clipsToBounds        = true
    }
    
    func configureLabel() {
        videoTitleLabel.numberOfLines             = 0
        videoTitleLabel.adjustsFontSizeToFitWidth = true
    }
    
    func setImageConstraints() {
        videoImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            videoImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            videoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            videoImageView.heightAnchor.constraint(equalToConstant: 80),
            videoImageView.widthAnchor.constraint(equalTo: videoImageView.heightAnchor, multiplier: 16/9)
        ])
    }
    
    func setTitleLabelConstraints() {
        videoTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            videoTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            videoTitleLabel.leadingAnchor.constraint(equalTo: videoImageView.trailingAnchor, constant: 20),
            videoTitleLabel.heightAnchor.constraint(equalToConstant: 80),
            videoTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12)
        ])
    }
    
}
