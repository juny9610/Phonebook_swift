//
//  AddViewController.swift
//  Phonebook
//
//  Created by 임성준 on 2020/01/22.
//  Copyright © 2020 임성준. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet var picAdd: UIImageView!
    @IBOutlet var nameAdd: UITextField!
    @IBOutlet var pnumAdd: UITextField!
    @IBOutlet var worksAdd: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func closeAdd(_ sender: UIBarButtonItem) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func finAdd(_ sender: UIBarButtonItem) {
        name.append(nameAdd.text!)
        nameAdd.text = ""
        pnum.append(pnumAdd.text!)
        pnumAdd.text = ""
        works.append(worksAdd.text!)
        worksAdd.text = ""
        _ = navigationController?.popViewController(animated: true)
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
