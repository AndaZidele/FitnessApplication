//
//  HistoryViewController.swift
//  FitnessApplication
//
//  Created by anda.zidele on 26/11/2021.
//

import UIKit
import CoreData

class HistoryViewController: UIViewController {
    
    @IBOutlet weak var lostKcalTextView: UILabel!
    @IBOutlet weak var fatTextView: UILabel!
    @IBOutlet weak var carbohidratesTextView: UILabel!
    @IBOutlet weak var proteinTextView: UILabel!
    @IBOutlet weak var kcalTextView: UILabel!
    var nutritionList = [Nutrition]()
    var activityList = [Lost]()
    
    var context: NSManagedObjectContext?
    var managedObjectCont: NSManagedObjectContext?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        managedObjectCont = appDelegate.persistentContainer.viewContext
        self.loadData()
        kcalTextView.text = calculateEatenKcal()
        fatTextView.text = calculateEatenFats()
        lostKcalTextView.text = calculateLostKcal()
        proteinTextView.text = calculateEatenProtein()
        carbohidratesTextView.text = calculateEatenCarbohidrates()
        // Do any additional setup after loading the view.
    }
    
    
    func loadData(){
        let request: NSFetchRequest<Nutrition> = Nutrition.fetchRequest()
        do{
            let resulta = try managedObjectCont?.fetch(request)
            nutritionList = resulta!
        }catch{
            fatalError("error is in loading core item")
        }
        let requestA: NSFetchRequest<Lost> = Lost.fetchRequest()
        do{
            let result = try managedObjectCont?.fetch(requestA)
            activityList = result!
        }catch{
            fatalError("error is in loading core item")
        }
    }
    
    func calculateEatenKcal() -> String {
        var kcalTogether = ""
        var kcalInt = 0
        for nutrition in nutritionList {
            kcalInt += Int(nutrition.kcal)
        }
        kcalTogether = "Today I have eaten " + String(kcalInt) + " kcal"
        return kcalTogether
    }
    func calculateEatenProtein() -> String {
        var kcalTogether = ""
        var kcalInt = 0
        for nutrition in nutritionList {
            kcalInt += Int(nutrition.protein)
        }
        kcalTogether = "Today I have eaten " + String(kcalInt) + " g of protein"
        return kcalTogether
    }
    func calculateEatenCarbohidrates() -> String {
        var kcalTogether = ""
        var kcalInt = 0
        for nutrition in nutritionList {
            kcalInt += Int(nutrition.carbohydrates)
        }
        kcalTogether = "Today I have eaten " + String(kcalInt) + " g of carbohydrates"
        return kcalTogether
    }
    func calculateEatenFats() -> String {
        var kcalTogether = ""
        var kcalInt = 0
        for nutrition in nutritionList {
            kcalInt += Int(nutrition.fat)
//            kcalInt += Int(nutrition.protein)
        }
        kcalTogether = "Today I have eaten " + String(kcalInt) + " g of fats"
        return kcalTogether
    }
    func calculateLostKcal() -> String {
        var kcalTogether = ""
        var kcalInt = 0
        for nutrition in activityList {
            kcalInt += Int(nutrition.lost!)  ?? 0
        }
        kcalTogether = "Today I have lost " + String(kcalInt) + " kcal by doing exercises"
        return kcalTogether
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
