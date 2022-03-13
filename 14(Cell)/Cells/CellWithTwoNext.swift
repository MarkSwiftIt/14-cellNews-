//
//  CellWithTwoNext.swift
//  14(Cell)
//
//  Created by Mark Goncharov on 20.01.2022.
//

import UIKit

class CellWithTwoNext: UITableViewCell {
    public lazy var title: UILabel = {
        let label = UILabel()
        label.textColor = Constants.Colors.blackIos
        label.font = Constants.Fonts.systemHeading
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.font = UIFont(name: label.font.fontName, size: 15)

        //        label.font = label.font.fontWithSize(20)
//        label.contentMode = .frame(width: 50, height: 100)
        return label
    }()
    public lazy var publishedAt: UILabel = {
        let label = UILabel()
        label.textColor = Constants.Colors.blackIos
        label.font = Constants.Fonts.systemHeading
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.font = UIFont(name: label.font.fontName, size: 25)
//        label.alignment = .bottomTrailing
        return label
    }()
    private lazy var stackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 5
        stackView.addArrangedSubview(title)
        stackView.addArrangedSubview(publishedAt)
        return stackView
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
//        contentView.addSubview(publishedAt)
//        contentView.addSubview(title)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stackView)

        setupConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure(_ datesModel: DatesRecordModel) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.sssZ"
            dateFormatter.dateFormat = "dd-MM-yyyy"
            
            title.text = datesModel.title
            publishedAt.text = "\(dateFormatter.string(from: datesModel.publishedAt))"
    }
//    func configure(_ viewModelTwo: CellOneImageOneLabelView){
//        publishedAt.text = viewModelTwo.text
//        labelOne.text = viewModelTwo.text
//    }
//
    
    private func setupConstraints()  {
        stackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        stackView.distribution = .fillProportionally
        stackView.widthAnchor.constraint(equalToConstant: 250).isActive = true
    }
}


//
//override func layoutSubviews() {
//        super.layoutSubviews()
//        image.frame = CGRect(x: 5, y: 5, width: 100, height: contentView.frame.size.height-10)
//        label1.frame = CGRect(x: 250, y: 0, width: contentView.frame.size.width - 10, height: contentView.frame.size.height-10)
//  }
