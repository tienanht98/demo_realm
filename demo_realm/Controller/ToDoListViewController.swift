//
//  ToDoListViewController.swift
//  demo_realm
//
//  Created by Tran Tien Anh on 3/22/20.
//  Copyright © 2020 Tran_Tien_Anh. All rights reserved.
//

import UIKit
import RealmSwift

class ToDoListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let realm = RealmManager.getInstance().realm
    var todoList: Results<TodoItem> { // [2]
        get {
            return realm.objects(TodoItem.self)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        setup()
        hideKeyboard()
        // Do any additional setup after loading the view.
    }
    func setup(){
        self.tableView.register(UINib(nibName: "ToDoListTableViewCell", bundle: nil), forCellReuseIdentifier: "ToDoListTableViewCell")
    }


    @IBAction func btnAddDidTap(_ sender: Any) {
        let todoItem = TodoItem() // [1]
        todoItem.detail = "please input"
        todoItem.status = 0
        DispatchQueue.main.async {
            try! self.realm.write({ // [2]
                self.realm.add(todoItem)
                self.tableView.reloadData()
            })

        }

    }


}
extension ToDoListViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.todoList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoListTableViewCell", for: indexPath) as! ToDoListTableViewCell
        cell.tfContent.text = todoList[indexPath.row].detail
        cell.completion = { result in
             DispatchQueue.main.async {
                try! self.realm.write({ // [2]
                    self.todoList[indexPath.row].detail = result ?? ""
                    self.tableView.reloadData()
                })
            }
        }
        return cell
    }


}
extension UIViewController
{
    func hideKeyboard()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard))

        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
}
