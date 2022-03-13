//
//  ViewController.swift
//  14(Cell)
//
//  Created by Mark Goncharov on 16.01.2022.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    
    let cellOneImageOneLabel = "cellOneImageOneLabel"
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .singleLine
//        tableView.tableHeaderView = headerView
        tableView.allowsSelection = true
        return tableView
    }()
//    private lazy var headerView: UILabel = {
//        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
//        label.text = "Country"
//        return label
//    }()
//
//
//    let country: [CellOneLabelOneImageView] = [
//        CellOneLabelOneImageView(labelOneText: "Austria"),
//        CellOneLabelOneImageView(labelOneText: "Belgium"),
//        CellOneLabelOneImageView(labelOneText: "France"),
//        CellOneLabelOneImageView(labelOneText: "Germany"),
//        CellOneLabelOneImageView(labelOneText: "Greece")
//        ]
//
    let dataWithImages: [CellOneImageOneLabelView] = [
        CellOneImageOneLabelView(text: "Austria", image: Constants.Image.austria ?? UIImage()),
        CellOneImageOneLabelView(text: "Belgium", image: Constants.Image.belgium ?? UIImage()),
        CellOneImageOneLabelView(text: "France", image: Constants.Image.france ?? UIImage()),
        CellOneImageOneLabelView(text: "Germany", image: Constants.Image.germany ?? UIImage()),
        CellOneImageOneLabelView(text: "Greece", image: Constants.Image.greece ?? UIImage())
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Coutry"
//        navigationItem.title = "Coutry"
//        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(CellOneImageOneLabel.self, forCellReuseIdentifier: "cellOneImageOneLabel")
        tableView.dataSource = self
        tableView.delegate = self
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        view.addSubview(tableView)
    }
    private func setupConstraints() {
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    
      func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          let viewModel = dataWithImages[indexPath.row]
          
          let alertController = UIAlertController(title: "You`ve chosen \(viewModel.text)!", message: "Ready to travel to \(viewModel.text)?", preferredStyle: .alert)
          
          let dismissAction = UIAlertAction(title: "Ok", style: .default, handler: { action in tableView.deselectRow(at: indexPath, animated: true)
          })
          
          alertController.addAction(dismissAction)
          present(alertController, animated: true, completion: nil)
      }
      
      func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
          return 100
      }


}
    extension ViewController: UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            dataWithImages.count
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellOneImageOneLabel) as? CellOneImageOneLabel
            let viewModel = dataWithImages[indexPath.row]
            cell?.configure(viewModel)
//            cell?.labelOne.text = viewModel.labelOneText
            return cell ?? UITableViewCell()
        }
//        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//            let currentImage = image[indexPath.row]
//        }
    }
extension ViewController: UITableViewDelegate {}

