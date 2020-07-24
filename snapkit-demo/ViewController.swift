//
//  ViewController.swift
//  snapkit-demo
//
//  Created by djing on 2020/7/21.
//  Copyright © 2020 djing. All rights reserved.
//

import UIKit
import SnapKit

// model
// mvvm-mvc
//view model test
//struct Contact{
//    var name: String
//    var email: String
//}
//
//struct MultiContact {
//    var position: String
//    var person: [Contact]
//}

// class
// life cycle


class ViewController: UIViewController {
    var group = [
        MultiContact(position: "Leader", person: [Contact(name: "Sophie Yang", email: "soyang@xogrp.com")]),
        MultiContact(position: "Member", person: [Contact(name: "Ficow Shen", email: "fshen@xogrp.com"),
                                                  Contact(name: "Kary Huang", email: "khuang@xogrp.com"),
                                                  Contact(name: "Sue Mo", email: "smo@xogrp.com"),
                                                  Contact(name: "Wiley Wan", email: "wwan@theknotww.com"),
                                                  Contact(name: "Derek Jing", email: "djing@theknotww.com")]),
        MultiContact(position: "Resign", person: [Contact(name: "Tank Tan", email: "tatan@xogrp.com")])
    ]
    
//    override func viewWillAppear(_ animated: Bool) {
//
//    }
//    override func viewDidAppear(_ animated: Bool) {
//        <#code#>
//    }
//    override func viewDidAppear(_ animated: Bool) {
//        <#code#>
//    }
//    override func viewWillDisappear(_ animated: Bool) {
//        <#code#>
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let myTable = UITableView()
        myTable.delegate = self
        myTable.dataSource = self
        myTable.estimatedRowHeight = 190.0
        myTable.rowHeight = UITableView.automaticDimension
        //        myTable.register(MyTableViewCell.self, forCellReuseIdentifier: MyTableViewCell.identifier)
        myTable.register(LeaderTableViewCell.self, forCellReuseIdentifier: LeaderTableViewCell.identifier1)
        myTable.register(MemberTableViewCell.self, forCellReuseIdentifier: MemberTableViewCell.identifier2)
        myTable.register(ResignTableViewCell.self, forCellReuseIdentifier: ResignTableViewCell.identifier3)
        myTable.backgroundColor = .white
        view.addSubview(myTable)
        myTable.snp.makeConstraints{ (make) in
            //            make.top.leading.bottom.trailing.equalToSuperview()
            make.edges.equalToSuperview()
        }
        
    }
}

extension ViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return group.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return group[section].person.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(group[indexPath.section].person[indexPath.row].name)
//        let cell = tableView.cellForRow(at: indexPath.section) as! LeaderTableViewCell||MemberTableViewCell||ResignTableViewCell
        switch group[indexPath.section].position{
        case "Leader":
            let cell = tableView.cellForRow(at: indexPath) as! LeaderTableViewCell
            cell.popUp.isHidden = !cell.popUp.isHidden
        case "Member":
            let cell = tableView.cellForRow(at: indexPath) as! MemberTableViewCell
            cell.popUp.isHidden = !cell.popUp.isHidden
        case "Resign":
            let cell = tableView.cellForRow(at: indexPath) as! ResignTableViewCell
            cell.popUp.isHidden = !cell.popUp.isHidden
        default:
            print(group[indexPath.section].person[indexPath.row].name)
        }
        
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
          return true
      }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return UITableViewCell.EditingStyle.delete
    }
    
}

extension ViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch group[indexPath.section].position{
        //            true false
        case "Leader":
            guard let cell = tableView.dequeueReusableCell(withIdentifier: LeaderTableViewCell.identifier1, for: indexPath) as? LeaderTableViewCell else { return UITableViewCell()
            }
            
            cell.setupCell(with: group[indexPath.section].person[indexPath.row].name, layoutStyle: group[indexPath.section].position )
            cell.setPop(with: group[indexPath.section].person[indexPath.row].email)
            return cell
            
        case "Member":
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MemberTableViewCell.identifier2, for: indexPath) as? MemberTableViewCell else { return UITableViewCell()
            }
            cell.setupCell(with: group[indexPath.section].person[indexPath.row].name, layoutStyle: group[indexPath.section].position )
            cell.setPop(with: group[indexPath.section].person[indexPath.row].email)
            return cell
        case "Resign":
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ResignTableViewCell.identifier3, for: indexPath) as? ResignTableViewCell else { return UITableViewCell()
            }
            cell.setupCell(with: group[indexPath.section].person[indexPath.row].name, layoutStyle: group[indexPath.section].position )
            cell.setPop(with: group[indexPath.section].person[indexPath.row].email)
            return cell
            
        default:
            return UITableViewCell()
            
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return group[section].position
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == .delete){
            group[indexPath.section].person.remove(at: indexPath.row)
            tableView.reloadData()
        }
        
     
    }
    
    
    
}


