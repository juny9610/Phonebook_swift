//
//  EditViewController.swift
//  Phonebook
//
//  Created by 임성준 on 2020/01/30.
//  Copyright © 2020 임성준. All rights reserved.
//

import UIKit

protocol EditDelegate{
    func didNameEditDone(_ controller: EditViewController, message: String)
    func didPnumEditDone(_ controller: EditViewController, message: String)
    func didWorksEditDone(_ controller: EditViewController, message: String)
}


class EditViewController: UIViewController {
    
    var reName: String = ""
    var rePnum : String = ""
    var reWorks : String = ""
    var delegate : EditDelegate?
    
    @IBOutlet var picEdit: UIImageView!
    @IBOutlet var nameEdit: UITextField!
    @IBOutlet var pnumEdit: UITextField!
    @IBOutlet var worksEdit: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nameEdit.text = reName
        pnumEdit.text = rePnum
        worksEdit.text = reWorks
        
    }
    
    @IBAction func closeEdit(_ sender: UIBarButtonItem) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func finEdit(_ sender: UIBarButtonItem) {
        if delegate != nil{
            delegate?.didNameEditDone(self, message: nameEdit.text!)
            delegate?.didPnumEditDone(self, message: pnumEdit.text!)
            delegate?.didWorksEditDone(self, message: worksEdit.text!)
        }
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    func reName(_ name: String){
        reName = name
    }
    func rePnum(_ Pnum: String){
        rePnum = Pnum
    }
    func reWorks(_ Works: String){
        reWorks = Works
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
