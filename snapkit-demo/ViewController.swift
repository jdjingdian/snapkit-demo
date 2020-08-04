//
//  ViewController.swift
//  snapkit-demo
//
//  Created by djing on 2020/7/21.
//  Copyright © 2020 djing. All rights reserved.
//

import UIKit
import SnapKit
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
    public let myTable = UITableView()
    public let myButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        myTable.delegate = self
        myTable.dataSource = self
        myTable.estimatedRowHeight = 190.0
        myTable.rowHeight = UITableView.automaticDimension
        myTable.register(LeaderTableViewCell.self, forCellReuseIdentifier: LeaderTableViewCell.identifier1)
        myTable.register(MemberTableViewCell.self, forCellReuseIdentifier: MemberTableViewCell.identifier2)
        myTable.register(ResignTableViewCell.self, forCellReuseIdentifier: ResignTableViewCell.identifier3)
        myTable.backgroundColor = .white
        view.addSubview(myTable)
        myTable.snp.makeConstraints{ (make) in
            make.edges.equalToSuperview()
        }
        view.addSubview(myButton)
        myButton.setTitle("Reload Data", for: .normal)
        myButton.setTitleColor(.blue, for: .normal)
        myButton.backgroundColor = .white
        myButton.isEnabled = true
        myButton.layer.borderColor = UIColor.black.cgColor
        myButton.layer.borderWidth = 3
        myButton.snp.makeConstraints{(make) in
            make.bottom.equalToSuperview().inset(16)
            make.height.equalTo(80)
            make.width.equalTo(160)
            make.centerX.equalToSuperview()
        }
        myButton.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
    }
    @objc public func buttonClick(){
        print("tapped")
        group = [
            MultiContact(position: "Leader", person: [Contact(name: "Sophie Yang", email: "soyang@xogrp.com")]),
            MultiContact(position: "Member", person: [Contact(name: "Ficow Shen", email: "fshen@xogrp.com"),
                                                      Contact(name: "Kary Huang", email: "khuang@xogrp.com"),
                                                      Contact(name: "Sue Mo", email: "smo@xogrp.com"),
                                                      Contact(name: "Wiley Wan", email: "wwan@theknotww.com"),
                                                      Contact(name: "Derek Jing", email: "djing@theknotww.com")]),
            MultiContact(position: "Resign", person: [Contact(name: "Tank Tan", email: "tatan@xogrp.com")])
        ]
        myTable.reloadData()
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
        
        let position = Position(rawValue: group[indexPath.section].position)
        
        
        switch position {
        case .leader:
            let cell = tableView.cellForRow(at: indexPath) as! LeaderTableViewCell
            cell.popUp.isHidden = !cell.popUp.isHidden
        case .member:
            let cell = tableView.cellForRow(at: indexPath) as! MemberTableViewCell
            cell.popUp.isHidden = !cell.popUp.isHidden
        case .resign:
            let cell = tableView.cellForRow(at: indexPath) as! ResignTableViewCell
            cell.popUp.isHidden = !cell.popUp.isHidden
        case .none:
            print(group[indexPath.section].person[indexPath.row].name)
        }
        
    }//点击后显示邮件
    
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
            if(group[indexPath.section].person.count == 0){
                group.remove(at: indexPath.section)
            }
            tableView.reloadData()
        }
        
        
    }
}


