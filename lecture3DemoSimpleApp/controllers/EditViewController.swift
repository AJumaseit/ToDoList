//
//  EditViewController.swift
//  lecture3DemoSimpleApp
//
//  Created by Anelya on 1/20/21.
//

import UIKit

class EditViewController: UIViewController {

    @IBOutlet weak var itemDate: UITextField!
    @IBOutlet weak var itemText: UITextField!
    
    var editCallback: ((_ text: String, _ date: String)-> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func editItem(_ sender: Any) {
        guard let text = itemText.text, text != "" else {
            editCallback?("Empty", "Empty")
            navigationController?.popViewController(animated: true)
            return
        }
        guard let date = itemDate.text, text != "" else {
            editCallback?(text, "Empty")
            navigationController?.popViewController(animated: true)
            return
    }
            editCallback?(text, date)
        navigationController?.popViewController(animated: true)
        
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
