//
//  ViewController.swift
//  snapkit-demo
//
//  Created by djing on 2020/7/21.
//  Copyright © 2020 djing. All rights reserved.
//

import UIKit
import SnapKit

struct Contact{
    var name: String
    var email: String
}

struct MultiContact {
    var position: String
    var person: [Contact]
}

// class

class ViewController: UIViewController {
    
    var group = [MultiContact(position: "Leader", person: [Contact(name: "Sophie Yang", email: "soyang@xogrp.com")]),
                 MultiContact(position: "Member", person: [Contact(name: "Ficow Shen", email: "fshen@xogrp.com"),
                                                           Contact(name: "Kary Huang", email: "khuang@xogrp.com"),
                                                           Contact(name: "Sue Mo", email: "smo@xogrp.com"),
                                                           Contact(name: "Wiley Wan", email: "wwan@theknotww.com"),
                                                           Contact(name: "Derek Jing", email: "djing@theknotww.com")]),
                 MultiContact(position: "Resign", person: [Contact(name: "Tank Tan", email: "tatan@xogrp.com")])]
    
//    let group = [
//        ("Leader", ["Sophie Yang"]),
//        ("Member", ["Ficow Shen", "Kary Huang", "Sue Mo", "Wiley Wan", "Derek Jing"]),
//        ("Resign", ["Tank Tan"])
//    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myTable = UITableView()
        myTable.delegate = self
        myTable.dataSource = self
        myTable.estimatedRowHeight = 190.0
        myTable.rowHeight = UITableView.automaticDimension
        myTable.register(MyTableViewCell.self, forCellReuseIdentifier: MyTableViewCell.identifier)
        myTable.backgroundColor = .white
        view.addSubview(myTable)
        myTable.snp.makeConstraints{ (make) in
//            make.top.leading.bottom.trailing.equalToSuperview()
            make.edges.equalToSuperview()
        }
        
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.94, green: 0.94, blue: 0.94, alpha: 0.5)
        let viewLabel = UILabel(frame: CGRect(x: 10, y: 0, width: UIScreen.main.bounds.size.width, height: 30))//(frame: CGRect(x: 10, y: 0, width: UIScreen.main.bounds.size.width, height: 30))
        viewLabel.text = group[section].position
        viewLabel.textColor = .black
        view.addSubview(viewLabel)
//        tableView.addSubview(view)
//        table view reuse 内存池
        return view
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
//        return group.count
        return group.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return group[section].1.count
        return group[section].person.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(group[indexPath.section].person[indexPath.row].name)
        let cell = tableView.cellForRow(at: indexPath) as! MyTableViewCell
        cell.popUp.isHidden = !cell.popUp.isHidden
        cell.setPop(with: group[indexPath.section].person[indexPath.row].email)
    }

}

extension ViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier, for: indexPath) as? MyTableViewCell else { return UITableViewCell()
        }
        cell.setupCell(with: group[indexPath.section].person[indexPath.row].name, layoutStyle: group[indexPath.section].position )//group[indexPath.section].person[indexPath.row].name, layoutStyle: group[indexPath.section].position
        return cell
    }
//    header
}


