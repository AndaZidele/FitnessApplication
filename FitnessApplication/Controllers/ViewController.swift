//
//  ViewController.swift
//  FitnessApplication
//
//  Created by anda.zidele on 23/11/2021.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var imageThird: UIImageView!
    
    @IBOutlet weak var nameThird: UILabel!
    
    @IBOutlet weak var lostkcalThird: UILabel!
    @IBOutlet weak var durationTView: UITextField!
    
    var activityThird: activityFileSecond!
    
    var managedObjectCont: NSManagedObjectContext?
    
    //var lostKc = [LostKcal]()
    //var managedObjectCont: NSManagedObjectContext?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if activityThird != nil{
            imageThird.image = UIImage(named: activityThird.imageS)
            nameThird.text = "Activity: \(activityThird.nameS)"
            lostkcalThird.text = activityThird.kcalS
        }
        
        
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        managedObjectCont = appDelegate.persistentContainer.viewContext
        
      //  loadData()
        
    }
    
    
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.view.endEditing(true)
//    }
    
    
    
    
   /*
    
    func loadData(){
        let request: NSFetchRequest<LostKcal> = LostKcal.fetchRequest()
        do{
            let result = try managedObjectCont?.fetch(request)
            lostKc = result!
            //lostkcalThird.reloadData()
            
        }catch{
            fatalError("error is in loading core item")
        }
    }
    
    func saveData(){
        do{
            try managedObjectCont?.save()
        }catch{
            fatalError("error is in saving core item")
        }
        loadData()
    }
    */
    
    
    
//    let addActionButton = UIAlertAction(title: "Add", style: .default) { action in
//        
//        self.tableView.reloadData()
//    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    
    func saveData(){
        do{
            try managedObjectCont?.save()
        }catch{
            fatalError("error is in saving core item")
        }
//        loadData()
    }

    
    var lostKc = [Lost]()
    @IBAction func addActivity(_ sender: Any) {
        print("Add activity!")
//        HomeTableViewController().addNewLost(newLost: "newnew")
        
        
        let request: NSFetchRequest<Lost> = Lost.fetchRequest()
        do {
            let result = try managedObjectCont?.fetch(request)
            lostKc = result!
        } catch {
            //
        }
//        let addActionButton = UIAlertAction(title: "Add", style: .default) { action in
//            let textField = alertController.textFields?.first
        
        let textToSave = durationTView.text
        
        
            let entity = NSEntityDescription.entity(forEntityName: "Lost", in: self.managedObjectCont!)
            let shop = NSManagedObject(entity: entity!, insertInto: self.managedObjectCont)
        
        
        let kcalTotal = (Int(activityThird.kcalS) ?? 0) * (Int(textToSave ?? "0") ?? 0)/60
//        shop.setValue(textToSave, forKey: "lost")
        shop.setValue(String(kcalTotal), forKey: "lost")
            //self.shopping.append(textField!.text!)
        
        
        
        let allEntity = NSEntityDescription.entity(forEntityName: "Today", in: self.managedObjectCont!)
        let all = NSManagedObject(entity: allEntity!, insertInto: self.managedObjectCont)
        all.setValue("0", forKey: "eaten")
        all.setValue(String(kcalTotal), forKey: "lost")
        
            self.saveData()
        durationTView.text = ""
        
        
        
        
        
        let alertController = UIAlertController(title: "Done", message: "\(activityThird.nameS)'s duration time is added!", preferredStyle: .alert)
        
       // let addActionButton = UIAlertAction(title: "Add", style: .default) { action in
            //let textField = alertController.textFields?.first
       // }
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        //alertController.addAction(cancelButton)
        //alertController.addAction(addActionButton)
        alertController.addAction(cancelButton)
        present(alertController, animated: true, completion: nil)
        
//            self.tableView.reloadData()
//        }
        
        
        
        
//        let alertController = UIAlertController(title: "Shopping Item", message: "What do You want to add?", preferredStyle: .alert)
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
//        let addActionButton = UIAlertAction(title: "Add", style: .default) { action in
//            let textField = alertController.textFields?.first
//            let entity = NSEntityDescription.entity(forEntityName: "Lost", in: self.managedObjectCont!)
//            let shop = NSManagedObject(entity: entity!, insertInto: self.managedObjectCont)
//            shop.setValue(textField?.text, forKey: "lost")
//            //self.shopping.append(textField!.text!)
//            self.saveData()
//
//        }
//            let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//
//            alertController.addAction(addActionButton)
//            alertController.addAction(cancelButton)
//            present(alertController, animated: true, completion: nil)
        
        
        
       // let textField = Int(durationTView.text!)
       // let entity = NSEntityDescription.entity(forEntityName: "LostKcal", in: self.managedObjectCont!)
       // let kcal = NSManagedObject(entity: entity!, insertInto: self.managedObjectCont)
     //   kcal.setValue(textField, forKey: "lostKcal")
        //self.shopping.append(textField!.text!)
      //  self.saveData()
 //       print(textField!)
//        HomeTableViewController().lostKcalTableView.reloadData()
        
        
        
        
        
        
        
        
        
//        let ilgums: String = durationTView.text!
//        saveData()
//        print(ilgums)
//       // lostKc = ilgums
//
//
//
//        let entity = NSEntityDescription.entity(forEntityName: "LostKcal", in: self.managedObjectCont!)
//        let lkcal = NSManagedObject(entity: entity!, insertInto: self.managedObjectCont)
//        lkcal.setValue(Int((durationTView?.text)!), forKey: "lostKcal")
//        self.saveData()
        
        /*
        let addActionButton = UIAlertAction(title: "Add", style: .default) { action in
            let textField = alertController.textFields?.first
            let entity = NSEntityDescription.entity(forEntityName: "Shopping", in: self.managedObjectContext!)
            let shop = NSManagedObject(entity: entity!, insertInto: self.managedObjectContext)
            shop.setValue(textField?.text, forKey: "item")
            //self.shopping.append(textField!.text!)
            self.saveData()
            self.tableView.reloadData()
        }
        */
        
        
        
        
        //durationTView.text = ""
        
      //  let alertController = UIAlertController(title: "Done", message: "\(activityThird.nameS)'s duration time is added!", preferredStyle: .alert)
        
       /* let alertController = UIAlertController(title: "LostKcal", message: "How long were You doing this activity?", preferredStyle: .alert)
        alertController.addTextField { textField in
            print("textField: ", textField)
        }*/
        /*let addActionButton = UIAlertAction(title: "Add", style: .default) { action in
            let textField = alertController.textFields?.first
            
           // self.lostKc.append(textField!.text!)
            //self.view.reloadInputViews()//nez par so
            
        }*/
     //   let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
    //    alertController.addAction(cancelButton)
        
      //  alertController.addAction(addActionButton)
      //
   // present(alertController, animated: true, completion: nil)
        
    }
    
}

