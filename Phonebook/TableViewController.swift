//
//  TableViewController.swift
//  Phonebook
//
//  Created by 임성준 on 2020/01/22.
//  Copyright © 2020 임성준. All rights reserved.
//

import UIKit

var name : [String] = ["강희선", "김도민", "백수영"]
var pnum : [String] = ["0103480440", "01038325821", "01064849708"]
var works : [String] = ["대구", "김해", "부산"]
var cell : UITableViewCell!
var indexPath : IndexPath = []


class TableViewController: UITableViewController, DetailDelegate{
    
    var tmpname : String = ""
    var tmppnum : String = ""
    var tmpworks : String = ""
    var delegate : DetailDelegate?

    @IBOutlet var Searchname: UISearchBar!
    @IBOutlet var numberListView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }

    override func viewWillAppear(_ animated: Bool){
        numberListView.reloadData()
    }
    
    // MARK: - Table view data source

    //처음에 몇개의 파티션으로 나뉘어 있는지
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    //name의 수 만큼의 cell을 만듬
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return name.count
    }

    //name에 저장되어 있는 데이터를 보여줌
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        cell.textLabel?.text = name[(indexPath as NSIndexPath).row]

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    //목록 삭제 구현
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            name.remove(at: (indexPath as NSIndexPath).row)
            pnum.remove(at: (indexPath as NSIndexPath).row)
            works.remove(at: (indexPath as NSIndexPath).row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    //delete 버튼 삭제 로 이름 변경
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "삭제"
    }
    

    
    //목록 순서 바꾸기
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let nameToMove = name[(fromIndexPath as NSIndexPath).row]
        let pnumToMove = pnum[(fromIndexPath as NSIndexPath).row]
        let worksToMove = works[(fromIndexPath as NSIndexPath).row]
        name.remove(at: (fromIndexPath as NSIndexPath).row)
        pnum.remove(at: (fromIndexPath as NSIndexPath).row)
        works.remove(at: (fromIndexPath as NSIndexPath).row)
        name.insert(nameToMove, at: (to as NSIndexPath).row)
        pnum.insert(pnumToMove, at: (to as NSIndexPath).row)
        works.insert(worksToMove, at: (to as NSIndexPath).row)
    }
    

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "sgDetail"{
            cell = (sender as! UITableViewCell)
            indexPath = self.numberListView.indexPath(for: cell)!
            let detailView = segue.destination as! DetailViewController
            detailView.receiveName(name[((indexPath as NSIndexPath).row)])
            detailView.receivePnum(pnum[((indexPath as NSIndexPath).row)])
            detailView.receiveWorks(works[((indexPath as NSIndexPath).row)])
            //detailView.receiveCell(cell)
            //detailView.receiveIndexPath(indexPath as NSIndexPath)
        }
    }
    
        func didNameDetailDone(_ controller: DetailViewController, message: String) {
            tmpname = message
            name[((indexPath as NSIndexPath).row)] = tmpname
        }
       
        func didPnumDetailDone(_ controller: DetailViewController, message: String) {
            tmppnum = message
            pnum[((indexPath as NSIndexPath).row)] = tmppnum
        }
       
        func didWorksDetailDone(_ controller: DetailViewController, message: String) {
            tmpworks = message
            works[((indexPath as NSIndexPath).row)] = tmpworks
        }
    
}
