//
//  ViewContr3.swift
//  14(Cell)
//
//  Created by Mark Goncharov on 24.01.2022.
//

import UIKit

class ViewContr3: UIViewController {

    let cellNewsView = "CellNewsView"
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ExtraNews"
        tableView.register(CellNewsView.self, forCellReuseIdentifier: "CellNewsView")
        self.tableView.rowHeight = 100
        tableView.dataSource = self
        tableView.delegate = self
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
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
}

extension ViewContr3: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models2.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellNewsView) as? CellNewsView
//        let datesModel = models2[indexPath.section]
//        cell?.configure(datesModel)
//        return cell ?? UITableViewCell()
        
        cell?.textLabel?.text = models2[indexPath.row].name
        return cell ?? UITableViewCell()
    }
}

extension ViewContr3: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewModel = models2[indexPath.row]
//        let controller = PopViewController(items: ["description: \(category.description)", "location: \(category.location)"])
//        let controller = PopViewController(eventDescription: viewModel.description, eventLocation: viewModel.location)
        self.navigationController?.pushViewController(CellCustomView(eventDescription: viewModel.description, eventLocation: viewModel.location), animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


//let startButton = UIButton()
//
//class ViewController3: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        title = "ExtraNews"
//        view.backgroundColor = .white
//
//
//        setupViews()
//        setupConstaints()
//    }
//    private func setupViews() {
//
//        startButton.setTitle("ExtraNews", for: .normal)
//        startButton.setTitleColor(.black, for: .normal)
//        startButton.addAction(UIAction(handler: {[ weak self ] _ in
//            self?.navigationController?.pushViewController(ViewController3(), animated: true)
//    }), for: .touchUpInside)
//        view.addSubview(startButton)
//        }
//
//    private func setupConstaints() {
//        startButton.translatesAutoresizingMaskIntoConstraints = false
//        startButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//        startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//    }
//    deinit {
//        print("deinit")
//    }
//}
//    extension ViewController3 {
//        override func viewWillAppear(_ animated: Bool) {
//            super.viewWillAppear(animated)
//            print("ViewController")
//        }
//        override func viewDidAppear(_ animated: Bool) {
//            super.viewDidAppear(animated)
//            print("viewDidAppear")
//    }
//        override func viewWillDisappear(_ animated: Bool) {
//                super.viewWillDisappear(animated)
//                print("viewWillDisappear")
//}
//
//        override func viewDidDisappear(_ animated: Bool) {
//            super.viewDidDisappear(animated)
//            print("viewDidDisappear")
//    }
//}

//import UIKit
//
//class SecondViewController: FirstViewController {
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        title = "Page 2"
//    }
//    override func viewDidLayoutSubviews() {
//        view.backgroundColor = .gray
//    }
//    override func setupViews() {
//        nextButton.setTitle("Forward", for: .normal)
//        nextButton.setTitleColor(.black, for: .normal)
//        nextButton.addAction(UIAction(handler: { [weak self] _ in
//            self?.navigationController?.pushViewController(SecondOfSecondViewController(), animated: true)
//        }), for: .touchUpInside)
//        view.addSubview(nextButton)
//    }
//}
//class SecondOfSecondViewController: FirstViewController {
//    override func viewDidLayoutSubviews() {
//        view.backgroundColor = .yellow
//    }
//    override func setupViews() {
//        nextButton.setTitle("Forward", for: .normal)
//        nextButton.setTitleColor(.black, for: .normal)
//        nextButton.addTarget(self, action: #selector(doAlert), for: .touchUpInside)
//        view.addSubview(nextButton)
//    }
//}
