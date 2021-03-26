//
//  ViewController.swift
//  MAD Fitness
//
//  Created by Zaid Ali on 3/13/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
//5:20
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(UITableViewCell.self
                       , forCellReuseIdentifier: "cell")
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 100))
        header.backgroundColor = .secondarySystemBackground
        
        let imageView = UIImageView(image: UIImage(systemName: "bell"))
        imageView.tintColor = .systemBlue
        imageView.contentMode = .scaleAspectFit
        header.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: header.frame.size.height-50 , height: header.frame.size.height-50)
        
        let label = UILabel(frame: CGRect(x: 0 + imageView.frame.size.width, y: -10,
                                          width: header.frame.size.width - 10 - imageView.frame.size.width,
                                          height: header.frame.size.height-5))
        header.addSubview(label)
        label.text = "Custom Section Header: \(section)"
        label.font = .systemFont(ofSize: 20, weight: .thin)
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Exercise: method: \(indexPath.section) | count: \(indexPath.row)"
        return cell
    }}

