//
//  AddViewViewController.swift
//  lecture3DemoSimpleApp
//
//  Created by Anelya on 1/20/21.
//

import UIKit

class AddViewViewController: UIViewController {

    @IBOutlet weak var itemDate: UITextField!
    @IBOutlet weak var itemText: UITextField!
    
    var addCollback: ((_ item: ToDoItem) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addItem(_ sender: Any) {
        guard let text = itemText.text, text != "" else {
            addCollback?(ToDoItem(id: -1, title: "Empty", deadLine: "Emty"))
            navigationController?.popViewController(animated: true)
            return
        }
        guard let date = itemDate.text, date != "" else {
            addCollback?(ToDoItem(id: -1, title: text, deadLine: "Emty"))
            navigationController?.popViewController(animated: true)
            return
        }
            addCollback?(ToDoItem(id: -1, title: text, deadLine: date))
            navigationController?.popViewController(animated: true)
            return
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
