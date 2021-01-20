//
//  SecondViewController.swift
//  lecture3DemoSimpleApp
//
//  Created by admin on 06.01.2021.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var arr = [ToDoItem]()
    let cellId = "TableViewCell"
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Main page"
        self.configureTableView()
    }

    
    func configureTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
        tableView.tableFooterView = UIView()
        
    }
    
    @IBAction func add(_ sender: UIBarButtonItem) {
        //change this method
        //Alert manager with two fields
        let vc = storyboard?.instantiateViewController(identifier: "AddViewViewController") as! AddViewViewController
        vc.addCollback = { item in
            self.arr.append(item)
            self.tableView.reloadData()
        }
        navigationController?.pushViewController(vc, animated: true)
        tableView.reloadData()
    }
    
}

extension SecondViewController: UITableViewDelegate, UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TableViewCell
        let item = arr[indexPath.row]
//        cell.delegate = self
        cell.id = item.id ?? 0
        cell.titleLabel.text = item.title
        cell.subTitleLabel.text = item.deadLine

        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let vc = storyboard?.instantiateViewController(identifier: "EditViewController") as! EditViewController
        let delete = UIContextualAction(style: .destructive, title: "Delete") {
            [weak self] (action, view, completionHandler) in
            self!.arr.remove(at: indexPath.row)
            self!.tableView.deleteRows(at: [indexPath], with: .automatic)
            completionHandler(true)
        }
        delete.backgroundColor = .systemRed
        
        let edit = UIContextualAction(style: .normal, title: "Edit") {
            [weak self] (action, view, completionHandler) in
            vc.editCallback = {text, date in
                self!.arr[indexPath.row].title = text
                self!.arr[indexPath.row].deadLine = date
                self!.tableView.reloadData()
            }
            self?.navigationController?.pushViewController(vc, animated: true)
            completionHandler(true)
            
        }
        
        let conf = UISwipeActionsConfiguration(actions: [delete, edit])
        return conf
    }
    
}
