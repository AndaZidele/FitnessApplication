//
//  HomeTableViewController.swift
//  FitnessApplication
//
//  Created by anda.zidele on 25/11/2021.
//

import UIKit
import CoreData

class HomeTableViewController: UITableViewController {

    var context: NSManagedObjectContext?
    @IBOutlet var lostKcalTableView: UITableView!
    
    
    var lostKc = [Lost]()
    var eatenKc = [Nutrit]()
    var allKc = [Today]()
    var managedObjectCont: NSManagedObjectContext?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lostKcalTableView.delegate = self
        lostKcalTableView.dataSource = self
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        managedObjectCont = appDelegate.persistentContainer.viewContext
        
//        loadData()
    }
    
    func deleteAllDataToday(){
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Today")
        let delete: NSBatchDeleteRequest = NSBatchDeleteRequest(fetchRequest: request)
        do{
            try managedObjectCont?.execute(delete)
            saveData()
        }catch let err{
            print(err.localizedDescription)
        }
    }
    func deleteAllDataNutrit(){
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Nutrit")
        let delete: NSBatchDeleteRequest = NSBatchDeleteRequest(fetchRequest: request)
        do{
            try managedObjectCont?.execute(delete)
            saveData()
        }catch let err{
            print(err.localizedDescription)
        }
    }
    func deleteAllDataNutrition(){
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Nutrition")
        let delete: NSBatchDeleteRequest = NSBatchDeleteRequest(fetchRequest: request)
        do{
            try managedObjectCont?.execute(delete)
            saveData()
        }catch let err{
            print(err.localizedDescription)
        }
    }
    func deleteAllDataLost(){
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Lost")
        let delete: NSBatchDeleteRequest = NSBatchDeleteRequest(fetchRequest: request)
        do{
            try managedObjectCont?.execute(delete)
            saveData()
        }catch let err{
            print(err.localizedDescription)
        }
    }
    
    @IBAction func deleteB(_ sender: Any) {
        let alertController = UIAlertController(title: "Delete All Todays Data?", message: "By clicking Delete You will delete all data about today!", preferredStyle: .actionSheet)
        let addActionButton = UIAlertAction(title: "Delete", style: .destructive) { action in
            self.deleteAllDataToday()
            self.deleteAllDataNutrit()
            self.deleteAllDataNutrition()
            self.deleteAllDataLost()
        }
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(addActionButton)
        alertController.addAction(cancelButton)
        
        present(alertController, animated: true, completion: nil)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        loadData()
    }
    
    func loadData(){
        let request: NSFetchRequest<Today> = Today.fetchRequest()
        do{
            let resulta = try managedObjectCont?.fetch(request)
            allKc = resulta!
            
        }catch{
            fatalError("error is in loading core item")
        }
        
        
        tableView.reloadData()
    }
    func saveData(){
        do{
            try managedObjectCont?.save()
        }catch{
            fatalError("error is in saving core item")
        }
        loadData()
    }
    
    
    
    
    @IBAction func AddNew(_ sender: Any) {
        //addNew()
        
        print("Add activity!")
        
        let alertController = UIAlertController(title: "Shopping Item", message: "What do You want to add?", preferredStyle: .alert)
        alertController.addTextField { textField in
            print("textField: ", textField)
    
        }
        let request: NSFetchRequest<Lost> = Lost.fetchRequest()
        do {
            let result = try managedObjectCont?.fetch(request)
            lostKc = result!
        } catch {
            //
        }
        let addActionButton = UIAlertAction(title: "Add", style: .default) { action in
            let textField = alertController.textFields?.first
            let entity = NSEntityDescription.entity(forEntityName: "Lost", in: self.managedObjectCont!)
            let shop = NSManagedObject(entity: entity!, insertInto: self.managedObjectCont)
            shop.setValue(textField?.text, forKey: "lost")
            //self.shopping.append(textField!.text!)
            self.saveData()
            self.tableView.reloadData()
        }
            let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
            alertController.addAction(addActionButton)
            alertController.addAction(cancelButton)
            present(alertController, animated: true, completion: nil)
    }
    func addNewLost(newLost: String) {
        print("Add activity!")
        
        let alertController = UIAlertController(title: "Shopping Item", message: "What do You want to add?", preferredStyle: .alert)
//        alertController.addTextField { textField in
//            print("textField: ", textField)
//
//        }
//        let request: NSFetchRequest<Lost> = Lost.fetchRequest()
//        do {
//            let result = try managedObjectCont?.fetch(request)
//            lostKc = result!
//        } catch {
//            //
//        }
        let addActionButton = UIAlertAction(title: "Add", style: .default) { action in
//            let textField = alertController.textFields?.first
            let entity = NSEntityDescription.entity(forEntityName: "Lost", in: self.managedObjectCont!)
            let shop = NSManagedObject(entity: entity!, insertInto: self.managedObjectCont)
            shop.setValue(newLost, forKey: "lost")
            //self.shopping.append(textField!.text!)
            self.saveData()
            self.tableView.reloadData()
        }
            let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
            alertController.addAction(addActionButton)
            alertController.addAction(cancelButton)
            present(alertController, animated: true, completion: nil)
    }
    /*
        func addNew() {
        let request: NSFetchRequest<LostKcal> = LostKcal.fetchRequest()
        do{
            let result = try context?.fetch(request)
//            lostKc = result!
//            print(result!.count)
            //lostkcalThird.reloadData()
            
        }catch{
            fatalError("error is in loading core item")
        }
        
        let entity = NSEntityDescription.entity(forEntityName: "LostKcal", in: self.managedObjectCont!)
        let kcal = NSManagedObject(entity: entity!, insertInto: self.managedObjectCont)
        kcal.setValue("900", forKey: "lostKcal")
        //self.shopping.append(textField!.text!)
        self.saveData()
        
        
        
        
        
//        lostKcalTableView.reloadData()
    }*/
   /*/*/
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        loadData()
        
    }*/
    
 /*   func loadData(){
        let request: NSFetchRequest<LostKcal> = LostKcal.fetchRequest()
        do{
            let result = try managedObjectCont?.fetch(request)
            lostKc = result!
            tableView.reloadData()
//            print(result!.count)
            //lostkcalThird.reloadData()
            
        }catch{
            fatalError("error is in loading core item")
        }
        //lostKcalTableView.reloadData()
        
    }*/
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return lostKc.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "lostKcalCell", for: indexPath)
        let lost = lostKc[indexPath.row]
        let kcal = lost.value(forKey: "lostKcal") as? Int64
        cell.textLabel?.text = String(kcal!)

        // Configure the cell...

        return cell
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
*/
    
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return allKc.count //+ eatenKc.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "lostKcalCell", for: indexPath)

        // Configure the cellb...

        //cell.textLabel?.text = shopping[indexPath.row]
        
        
        let shop = allKc[indexPath.row]
        
        if shop.value(forKey: "eaten") as! String != "0" {
            let stringKcal = (shop.value(forKey: "eaten") as? String)!
            let stringK = stringKcal + " kcal"
            cell.detailTextLabel?.text = stringK
            cell.textLabel?.text = "Eaten"//shop.value(forKey: "lost") as? String
        } else {
            let stringKcal = (shop.value(forKey: "lost") as? String)!
            let stringK = stringKcal + " kcal"
            cell.detailTextLabel?.text = stringK
            cell.textLabel?.text = "Lost"//shop.value(forKey: "lost") as? String
        }
        
        
        return cell
    }
}
