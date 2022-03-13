//
//  ViewContrTwo.swift
//  14(Cell)
//
//  Created by Mark Goncharov on 20.01.2022.
//

import UIKit
import SwiftUI

class ViewContrTwo: UIViewController {
    
    let cellWithTwoNext = "CellWithTwoNext"
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
//        tableView.separatorStyle = .singleLine
//        tableView.tableHeaderView = headerView
//        tableView.allowsSelection = false
        return tableView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "News"
        tableView.register(CellWithTwoNext.self, forCellReuseIdentifier: "CellWithTwoNext")
            //CellWithTwoNext.self, forCellReuseIdentifier: "CellWithTwoNext"
        self.tableView.rowHeight = 100
        tableView.dataSource = self
        tableView.delegate = self
        setupView()
        setupConstraints()
        setupDates()

    }
    private func setupView() {
        view.addSubview(tableView)
    }
    private func setupConstraints() {
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant:
            0).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant:
            0).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant:
            0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant:
            0).isActive = true
    }
    private func setupDates() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.sssZ"
        datesFromModels = models.map { DatesRecordModel(title: ($0.title), publishedAt: dateFormatter.date(from: ($0.publishedAt)) ?? Date()) }
                
        dateFormatter.dateFormat = "dd-MM-yyyy"

        let groupDic = Dictionary(grouping: datesFromModels, by: { (element: DatesRecordModel) -> Date in
        let components = Calendar.current.dateComponents([.day, .month, .year], from: element.publishedAt)
        let date = Calendar.current.date(from: components)
        return date ?? Date()
    })
        datesFromDictionary = groupDic.map { DictionaryRecordModel(nameSection: dateFormatter.string(from: $0.key), cells: $0.value
        )}
        datesFromDictionary.sort {
        $0.nameSection > $1.nameSection
    }
}
}

extension ViewContrTwo: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return datesFromDictionary[section].nameSection
        }
    func numberOfSections(in tableView: UITableView) -> Int {
        return datesFromDictionary.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datesFromDictionary[section].cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellWithTwoNext) as? CellWithTwoNext
        
        let datesModel = datesFromDictionary[indexPath.section].cells[indexPath.row]
        
        cell?.configure(datesModel)
        return cell ?? UITableViewCell()
    }
}


extension ViewContrTwo: UITableViewDelegate {}

