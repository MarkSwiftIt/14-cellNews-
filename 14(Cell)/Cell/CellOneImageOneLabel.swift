//
//  CellOneImageOneLabel.swift
//  14(Cell)
//
//  Created by Mark Goncharov on 16.01.2022.
//

import UIKit
import SwiftUI

class CellOneImageOneLabel: UITableViewCell {
    private lazy var label1: UILabel = {
        let label = UILabel()
        label.textColor = Constants.Colors.blackIos
        label.font = Constants.Fonts.systemHeading
        return label
    }()
    private lazy var image: UIImageView = {
       let image = UIImageView()
        image.contentMode = .scaleAspectFill
//        imageView?.clipsToBounds = true
//        image.resizableImage(withCapInsets: <#T##UIEdgeInsets#>)
//        image.contentMode = .frame(forAlignmentRect: <#T##CGRect#>)
//.frame(width: 50, height: 100)
//imageView.image = Constants.image.norway
        return image
    }()

//    private lazy var stackView: UIStackView = {
//       let stackView = UIStackView()
//        stackView.axis = .horizontal
//        stackView.alignment = .center
//        stackView.spacing = 20
//
//        stackView.addArrangedSubview(image)
//        stackView.addArrangedSubview(label1)
//        return stackView
//    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super .init(style: style, reuseIdentifier: reuseIdentifier)

 //       stackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(image)
        contentView.addSubview(label1)
//        setupConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//
    override func prepareForReuse() {
        image.image = nil
    }
    func configure(_ viewModel: CellOneImageOneLabelView){
        label1.text = viewModel.text
        image.image = viewModel.image
    }
    override func layoutSubviews() {
            super.layoutSubviews()
            image.frame = CGRect(x: 5, y: 5, width: 100, height: contentView.frame.size.height-10)
            label1.frame = CGRect(x: 250, y: 0, width: contentView.frame.size.width - 10, height: contentView.frame.size.height-10)
      }
//
//    private func setupConstraints()  {
//        stackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//        stackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
//
//        stackView.widthAnchor.constraint(equalToConstant: 250).isActive = true
//    }
}
