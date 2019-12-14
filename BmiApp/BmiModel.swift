// File Name: BmiModel.swift
// Author's Name: Vishal Patel
// Student ID: 301090662
// Date: 2019-12-13.

class BmiModel{
    
    var name: String?
    var age: String?
    var gender: String?
    var height: String?
    
    var weight: String?
    var bmi: String?
    
        //function to initiate above variables
    init(name:String?,age:String?,gender:String?,height:String?,weight:String?,bmi:String?){
        
        self.name = name
        self.age = age
        self.gender = gender
        self.height = height
        
        self.weight = weight
        self.bmi = bmi
    }
}

