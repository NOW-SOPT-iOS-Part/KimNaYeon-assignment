//
//  ChannelCollectionViewCell.swift
//  assignment
//
//  Created by 김나연 on 4/30/24.
//

import UIKit

import SnapKit

final class ChannelCollectionViewCell: UICollectionViewCell {
    static let identifier = "ChannelCollectionViewCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .gray1
        imageView.layer.cornerRadius = 3
        return imageView
    }()
    
    private let rankLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .font(ofSize: 19, weight: .w700)
        return label
    }()
    
    private let channelLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .font(ofSize: 10, weight: .w400)
        return label
    }()
    
    private let programLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray2
        label.font = .font(ofSize: 10, weight: .w400)
        return label
    }()
    
    private let viewershipLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray2
        label.font = .font(ofSize: 10, weight: .w400)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setHierarchy()
        setLayout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setHierarchy() {
        contentView.addSubviews(imageView, rankLabel, channelLabel, programLabel, viewershipLabel)
    }
    
    func setLayout() {
        imageView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
        }
        
        rankLabel.snp.makeConstraints {
            $0.height.equalTo(30)
            $0.top.equalTo(imageView.snp.bottom).offset(8)
            $0.leading.equalToSuperview().inset(9)
        }
        
        channelLabel.snp.makeConstraints {
            $0.height.equalTo(16)
            $0.top.equalTo(imageView.snp.bottom).offset(11)
            $0.leading.equalTo(rankLabel.snp.trailing).offset(7)
        }
        
        programLabel.snp.makeConstraints {
            $0.height.equalTo(16)
            $0.top.equalTo(channelLabel.snp.bottom).offset(-1)
            $0.leading.equalTo(channelLabel)
        }
        
        viewershipLabel.snp.makeConstraints {
            $0.height.equalTo(16)
            $0.top.equalTo(programLabel.snp.bottom)
            $0.leading.equalTo(channelLabel)
            $0.bottom.equalToSuperview()
        }
    }
}

extension ChannelCollectionViewCell {
    
    func configure(
        image: UIImage? = nil,
        rank: Int,
        channel: String,
        program: String,
        viewership: Float
    ) {
        imageView.image = image
        rankLabel.text = "\(rank)"
        channelLabel.text = channel
        programLabel.text = program
        viewershipLabel.text = "\(viewership)%"
    }
}
