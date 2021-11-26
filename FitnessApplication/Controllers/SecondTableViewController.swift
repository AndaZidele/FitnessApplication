//
//  SecondTableViewController.swift
//  FitnessApplication
//
//  Created by anda.zidele on 23/11/2021.
//

import UIKit

class SecondTableViewController: UITableViewController {

    
    var activityFilesS = activityFileSecond.createCell()
    //var activityFilesSFood = activityFileSecond.createCellFood()

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    /*override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
*/
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 10//cik vajag
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "secondCell", for: indexPath) as? STableViewCell else {return UITableViewCell()}
        
        
        
            
       // print(FTableViewCell().fCell)
            
       // cell.lostKcal?.text = activityFileS.kcalS
        
       /* if FTableViewCell().self.fCellLabel?.text == "2"{
             print("10000000")
            let activityFileSF = activityFilesSFood[indexPath.row]
            cell.secondImage?.image = UIImage(named: activityFileSF.imageS)
            cell.secondName?.text = activityFileSF.nameS
            cell.lostKcal?.text = activityFileSF.kcalS
        } else {*/
            let activityFileS = activityFilesS[indexPath.row]
            cell.secondImage?.image = UIImage(named: activityFileS.imageS)
            cell.secondName?.text = activityFileS.nameS
            cell.lostKcal?.text = activityFileS.kcalS
       // }
      /*  if indexPath.row == 1 {
            
        }
        */
       /* else {
       
        }*/
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 80 //par so neesmu drosa???
    }

    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
     */
     
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if let indexPath = tableView.indexPathForSelectedRow{
             print("indexPath: ", indexPath)
         
         // Get the new view controller using segue.destination.
             let actCell = segue.destination as! ViewController
         // Pass the selected object to the new view controller.
             actCell.activityThird = activityFilesS[indexPath.row]
         }
     }
    
     /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
