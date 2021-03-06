//
//  ViewContr2.swift
//  14(Cell)
//
//  Created by Mark Goncharov on 16.01.2022.
//

//import Foundation
//import UIKit
//
//class ViewContr2: UIViewController {
//    
//    let viewContr2 =
//    
//    private lazy var tableView: UITableView = {
//            let tableView = UITableView(frame: CGRect.zero, style: .grouped)
//            tableView.translatesAutoresizingMaskIntoConstraints = false
//            tableView.tableHeaderView = section
//            return tableView
//        }()
//        
//        private lazy var section: UILabel = {
//            let label = UILabel()
//            label.text = "Table header"
//            return label
//        }()
//        
//        override func viewDidLoad() {
//            super.viewDidLoad()
//            title = "Задание 2"
//            // Do any additional setup after loading the view.
//            tableView.register(SecondCustomTableViewCell.self, forCellReuseIdentifier: "secondCustomTableViewCell")
//            self.tableView.rowHeight = 100
//            tableView.dataSource = self
//            tableView.delegate = self
//            setupViews()
//            setupConstraints()
//            setupDates()
//            
//        }
//        
//        private func setupDates() {
//            // Объявляем экземпляр класса DateFormatter()
//            let dateFormatter = DateFormatter()
//            // Устанавливаем локаль
//            dateFormatter.locale = Locale(identifier: "ru_RU")
//            // Устанавливаем часовой пояс
//            dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
//            // Устанавливаем формат даты
//            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.sssZ"
//            
//            // Объявляем массив с типом данных Date и добавляем в нее сконвертированные данные со свойством publishedAt из массива models. Если получаем пустое значение возвращаем текущую дату
//            datesFromModels = models.map { DatesRecordModel(publishedAt: dateFormatter.date(from: ($0.publishedAt)) ?? Date()) }
//            // Устанавливаем новый формат даты для преобразования в строку
//            dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
//            // Преобразуем данные из массива дат array в новый массив stringFromDates
//            stringFromDates = datesFromModels.map { StringRecordModel(publishedAt: dateFormatter.string(from: $0.publishedAt)) }
//            // На основе массива дат datesFromModels создаем словарь который разбивает массив по датам. В качестве ключа выступает дата, в качестве значения выступает массив элементов publishedAt
//            
//            let groupDic = Dictionary(grouping: datesFromModels, by: { (element: DatesRecordModel) -> Date in
//                let components = Calendar.current.dateComponents([.day, .month, .year], from: element.publishedAt)
//                let date = Calendar.current.date(from: components)
//                return date ?? Date()
//            })
//    //        print(groupDic.values)
//            
//            dictionaryFromDates = groupDic.map { DictionaryRecordModel(nameSection: dateFormatter.string(from: $0.key), cells: $0.value )}
//            dictionaryFromDates.sort {
//                $0.nameSection > $1.nameSection
//            }
//            print(dictionaryFromDates)
//        }
//        
//        private func setupViews() {
//            view.addSubview(tableView)
//        }
//        private func setupConstraints() {
//            tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant:
//                0).isActive = true
//            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant:
//                0).isActive = true
//            tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant:
//                0).isActive = true
//            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant:
//                0).isActive = true
//        }
//    
//    
//Dictionary<title, [NewModel]>(grouping: newArray, by: Dictionary)


//}
