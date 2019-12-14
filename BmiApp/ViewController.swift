// File Name: ViewController.swift
// Author's Name: Vishal Patel
// Student ID: 301090662
// Date: 2019-12-12.

import UIKit
import Firebase

class ViewController: UIViewController {

    private var user_height: Double = 0.0
    private var user_weight: Double = 0.0
    private var user_bmi: Double = 0.0
    
    
    var reference_to_data: DatabaseReference!
    
    @IBOutlet weak var uName: UITextField!
    @IBOutlet weak var uAge: UITextField!
    @IBOutlet weak var uWeight: UITextField!
    @IBOutlet weak var uHeight: UITextField!
    @IBOutlet weak var uGender: UITextField!
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var bmi_criteria_msg: UILabel!
    
    @IBAction func ResetFunc(_ sender: UIButton) {
        uName.text = ""
        uGender.text = ""
        uAge.text = ""
        uHeight.text = ""
        uWeight.text = ""
    }
    @IBAction func bmiCalculator(_ sender: UIButton){
        user_weight = Double(uWeight.text!)!
        user_height = Double(uHeight.text!)!
        //let Bmi = w!/((h!/100)*(h!/100))
        user_bmi = (user_weight*703)/(user_height*user_height)
        
        if(user_bmi < 16)
        {
            bmi_criteria_msg.text = String("Severe Thinness")
        }
        if(user_bmi >= 16 && user_bmi <= 17)
        {
            bmi_criteria_msg.text = String("Moderate Thiness")
        }
        if(user_bmi >= 17 && user_bmi <= 18.5 )
        {
             bmi_criteria_msg.text = String("Mild Thiness")
        }
        if(user_bmi >= 18.5 && user_bmi <= 25 )
        {
            bmi_criteria_msg.text = String("Normal")
        }
        if(user_bmi >= 25 && user_bmi <= 30 )
        {
            bmi_criteria_msg.text = String("OverWeight")
        }
        if(user_bmi >= 30 && user_bmi <= 35 )
        {
            bmi_criteria_msg.text = String("Obese class 1")
        }
        if(user_bmi >= 35 && user_bmi <= 40 )
        {
            bmi_criteria_msg.text = String("Obese class 2")
        }
        if(user_bmi > 40 )
        {
            bmi_criteria_msg.text = String("Obese class 3")
        }
        
        bmiLabel.text = String(format: "%.2f", user_bmi)
        
        if(uName.text != "" || uGender.text != "" || uAge.text != "" || uHeight.text != "" || uWeight.text != ""){
            self.saveDetails()
        }

    }
    
   //function for saving user details
   func saveDetails() {
    reference_to_data = Database.database().reference().child("bmi")
    let key = reference_to_data.childByAutoId().key!
    let details = ["weight":uWeight.text,"bmi_value": bmiLabel.text]
    reference_to_data.child(key).setValue(details)
    
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        reference_to_data = Database.database().reference().child("bmi")
        
//        ref.observeSingleEvent(of: .value, with: { (snapshot) in
//            if snapshot.hasChild("bmi"){
                //self.setValues()
            }
}

