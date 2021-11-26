//
//  FoodViewController.swift
//  FitnessApplication
//
//  Created by anda.zidele on 25/11/2021.
//

import UIKit
import CoreData

class FoodViewController: UIViewController {

    
    @IBOutlet weak var foodImg: UIImageView!
    @IBOutlet weak var foodName: UILabel!
    
    @IBOutlet weak var foodKcal: UILabel!
    @IBOutlet weak var foodProte: UILabel!
    @IBOutlet weak var foodCarboh: UILabel!
    @IBOutlet weak var foodFat: UILabel!
    
    @IBOutlet weak var foodWeight: UITextField!
    
    var nutritionList = [Nutrit]()
    
    /**
     
     
     foodProte
     add poga ievilkta no main storyboard
     
     gramus no textview
     protein daudzums (grami * 100g attiecigo int
     let protein =
     
     
     
         let entity = NSEntityDescription.entity(forEntityName: "Nutrit", in: self.managedObjectCont!)
         let shop = NSManagedObject(entity: entity!, insertInto: self.managedObjectCont)
         shop.setValue(proteinaDaudzums, forKey: "proteins")
     shop.setValue(textToSave, forKey: "fat")
     shop.setValue(textToSave, forKey: "kcal")
     shop.setValue(textToSave, forKey: "lost")
         //self.shopping.append(textField!.text!)
         self.saveData()
     durationTView.text = "" iztuksosi gramu text view
     */
    
    var activityFood: activityFileSecondForFood!
    
    var managedObjectCont: NSManagedObjectContext?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       if activityFood != nil{
           foodImg.image = UIImage(named: activityFood.imageS)
            foodName.text = activityFood.nameS
            foodKcal.text = "Nutrition: \(activityFood.kcal) kcal"
            foodProte.text = "Protein: \(activityFood.prot) g"
            foodCarboh.text = "Carbohydrates: \(activityFood.carbs) g"
            foodFat.text = "Fat: \(activityFood.fat) g"
        }
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        managedObjectCont = appDelegate.persistentContainer.viewContext
        
    }
    
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
    
    //Talak vel nav!!!
    var nutrit = [Nutrit]()
    @IBAction func addFood(_ sender: Any) {
        let request: NSFetchRequest<Nutrit> = Nutrit.fetchRequest()
        do{
            let result = try managedObjectCont?.fetch(request)
            nutrit = result!
        } catch {
            //
        }
        
        let gramsToSave = foodWeight.text
        
        let entity = NSEntityDescription.entity(forEntityName: "Nutrit", in: self.managedObjectCont!)
        let nutr = NSManagedObject(entity: entity!, insertInto: self.managedObjectCont)
        nutr.setValue(gramsToSave, forKey: "kcal")
        nutr.setValue(gramsToSave, forKey: "protein")
        nutr.setValue(gramsToSave, forKey: "carbohydrates")
        nutr.setValue(gramsToSave, forKey: "fat")
        
        //print("\(String(describing: nutr.value(forKey: "kcal")))" )
       
        var eatenKcal: Float = 0
        if let gTS = Float(gramsToSave ?? ""), let actF = Float(activityFood.kcal){
            eatenKcal = Float(gTS * actF / 100)
            print(eatenKcal)
        }
        var eatenProt: Float = 0
        if let gTSP = Float(gramsToSave ?? ""), let actFP = Float(activityFood.prot){
            eatenProt = Float(gTSP * actFP / 100)
            print(eatenProt)
        }
        var eatenCarbs: Float = 0
        if let gTSC = Float(gramsToSave ?? ""), let actFC = Float(activityFood.carbs){
            eatenCarbs = Float(gTSC * actFC / 100)
            print(eatenCarbs)
        }
        var eatenFats: Float = 0
        if let gTSF = Float(gramsToSave ?? ""), let actFF = Float(activityFood.fat){
            eatenFats = Float(gTSF * actFF / 100)
            print(eatenFats)
        }
        
        let entityNumeric = NSEntityDescription.entity(forEntityName: "Nutrition", in: self.managedObjectCont!)
        let nutri = NSManagedObject(entity: entityNumeric!, insertInto: self.managedObjectCont)
        
        
        
        
        nutri.setValue((nutri.value(forKey: "kcal") as! Float + eatenKcal), forKey: "kcal")
        nutri.setValue((nutri.value(forKey: "protein") as! Float + eatenProt), forKey: "protein")
        nutri.setValue((nutri.value(forKey: "carbohydrates") as! Float + eatenCarbs), forKey: "carbohydrates")
        nutri.setValue((nutri.value(forKey: "fat") as! Float + eatenFats), forKey: "fat")
        //print(nutri.value(forKey: "protein")
        
        let allEntity = NSEntityDescription.entity(forEntityName: "Today", in: self.managedObjectCont!)
        let all = NSManagedObject(entity: allEntity!, insertInto: self.managedObjectCont)
        all.setValue(String(eatenKcal), forKey: "eaten")
        all.setValue("0", forKey: "lost")
        
        
        
        let alertController = UIAlertController(title: "Done", message: "\(activityFood.nameS)'s weight is added!", preferredStyle: .alert)
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelButton)
        present(alertController, animated: true, completion: nil)
        
        self.saveData()
        foodWeight.text = ""
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
