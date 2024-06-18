//
//  TopicsTableViewCell.swift
//  Math-AI
//
//  Created by Fatih on 13.06.2024.
//

import UIKit
 
protocol TopicsTableViewCellProtocol {
    func didTappedFavoriteButton(topicType: SubjectItemType)
}

class TopicsTableViewCell: UITableViewCell {
    
    var delegate: TopicsTableViewCellProtocol?
    var topicType: SubjectItemType?
    static let identifier = "TopicsTableViewCell"
    
    private let iconContainer: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        return view
    }()
    
     let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
     let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .black)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkText
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 10, weight: .light)
        return label
    }()
    
     let favoriteButton: UIButton = {
        let button = UIButton()
        button.setImage(.iconsMathSolverFavorite, for: .normal)
        button.tintColor = .lightGray
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
        contentView.addSubview(iconContainer)
        iconContainer.addSubview(iconImageView)
        contentView.clipsToBounds = true
        contentView.addSubview(favoriteButton)
        setupTargets()
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupConstrains()
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        subtitleLabel.text = nil
        titleLabel.text = nil
        iconContainer.backgroundColor = nil
    }
    
    public func configure(with model: SubjectItem) {
        titleLabel.text = model.title
        subtitleLabel.text = model.subTitle
        iconImageView.image = model.image
        iconContainer.backgroundColor = model.iconBackroundColor
        
    }
    
    func setupTargets() {
        favoriteButton.addTarget(self, action: #selector(favoriteButtonClicked), for: .touchUpInside)
    }
    
    @objc func favoriteButtonClicked() {
        guard let topicType else { return }
        delegate?.didTappedFavoriteButton(topicType: topicType)
    }
    
    
    
    func setupConstrains() {
        NSLayoutConstraint.activate([
            iconContainer.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            iconContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 10),
            iconContainer.heightAnchor.constraint(equalToConstant: 50),
            iconContainer.widthAnchor.constraint(equalToConstant: 50),
            
            iconImageView.centerXAnchor.constraint(equalTo: iconContainer.centerXAnchor),
            iconImageView.centerYAnchor.constraint(equalTo: iconContainer.centerYAnchor),
            iconImageView.heightAnchor.constraint(equalTo: iconContainer.heightAnchor, multiplier: 0.9),
            iconImageView.widthAnchor.constraint(equalTo: iconContainer.widthAnchor, multiplier: 0.9),
            
            titleLabel.topAnchor.constraint(equalTo: iconContainer.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: iconContainer.trailingAnchor,constant: 10),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor,constant: -30),
            titleLabel.heightAnchor.constraint(equalToConstant: 30),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            subtitleLabel.leadingAnchor.constraint(equalTo: iconContainer.trailingAnchor,constant: 10),
            subtitleLabel.trailingAnchor.constraint(equalTo:contentView.trailingAnchor),
            subtitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            favoriteButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor,constant: 155),
            favoriteButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor,constant: -10),
            favoriteButton.heightAnchor.constraint(equalToConstant: 30),
            favoriteButton.widthAnchor.constraint(equalToConstant: 30)
        ])
    }
    
}
