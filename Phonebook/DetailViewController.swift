//
//  DetailViewController.swift
//  Phonebook
//
//  Created by 임성준 on 2020/01/22.
//  Copyright © 2020 임성준. All rights reserved.
//

import UIKit

protocol DetailDelegate{
    func didNameDetailDone(_ controller: DetailViewController, message: String)
    func didPnumDetailDone(_ controller: DetailViewController, message: String)
    func didWorksDetailDone(_ controller: DetailViewController, message: String)
}

class DetailViewController: UIViewController, EditDelegate {

    var receiveName = ""
    var receivePnum = ""
    var receiveWorks = ""
    //var receiveCell : UITableViewCell!
    //var receiveIndexPath : IndexPath = []
    var delegate : DetailDelegate?
    
    @IBOutlet var lblPic: UIImageView!
    @IBOutlet var lblName: UILabel!
    @IBOutlet var lblPnum: UILabel!
    @IBOutlet var lblWorks: UILabel!
    
    @IBAction func showEdit(_ sender: UIBarButtonItem) {
    }
    @IBAction func backPbook(_ sender: UIBarButtonItem) {
        if delegate != nil{
            delegate?.didNameDetailDone(self, message: lblName.text!)
            delegate?.didPnumDetailDone(self, message: lblPnum.text!)
            delegate?.didWorksDetailDone(self, message: lblWorks.text!)
        }
        _ = navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblName.text = receiveName
        lblPnum.text = receivePnum
        lblWorks.text = receiveWorks
    }
    
    func receiveName(_ name: String){
        receiveName = name
    }
    func receivePnum(_ Pnum: String){
        receivePnum = Pnum
    }
    func receiveWorks(_ Works: String){
        receiveWorks = Works
    }
    /*
    func receiveCell(_ Cell: UITableViewCell){
        receiveCell = Cell
    }
    func receiveIndexPath(_ IndexPath: NSIndexPath){
        receiveIndexPath = IndexPath as IndexPath
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "sgEdit"{
            let editViewController = segue.destination as! EditViewController
            editViewController.reName = lblName.text!
            editViewController.rePnum = lblPnum.text!
            editViewController.reWorks = lblWorks.text!
            editViewController.delegate = self
        }
        else if segue.identifier == "sgPbook"{
            let tableViewController = segue.destination as! TableViewController
            tableViewController.tmpname = lblName.text!
            tableViewController.tmppnum = lblPnum.text!
            tableViewController.tmpworks = lblWorks.text!
            tableViewController.delegate = (self as! DetailDelegate)
        }
        
    }
    
    
    func didNameEditDone(_ controller: EditViewController, message: String) {
        lblName.text = message
    }
    
    func didPnumEditDone(_ controller: EditViewController, message: String) {
        lblPnum.text = message
    }
    
    func didWorksEditDone(_ controller: EditViewController, message: String) {
        lblWorks.text = message
    }

}
