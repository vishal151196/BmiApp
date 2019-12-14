// File Name: DetailViewController.swift
// Author's Name: Vishal Patel
// Student ID: 301090662
// Date: 2019-12-14.


import UIKit
import Firebase

class DetailViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource,UITabBarControllerDelegate {
    
    var refData: DatabaseReference!
    var DataList = [BmiModel]()
    
       
    @IBOutlet weak var dataTableView: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DataView
           
        let BMI: BmiModel
        BMI = DataList[indexPath.row]
        cell.lblBmi.text = BMI.bmi
        cell.lblWeight.text = BMI.weight
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        dataTableView.delegate = self
        dataTableView.dataSource = self
        
        //calling load function for fetching and storing data from firebase
        load()
    }
    func numberOfSections(in tableView: UITableView) -> Int {
      return 1
    }
    
    func load(){
   
        //storing reference of firebase database using key: bmi
//        refData = Database.database().reference().child("bmi")
    refData = Database.database().reference(withPath: "bmi")
        //this method will be called whenever there is change in Firebase Database
        refData.observe(DataEventType.value, with: {(snapshot) in
            
            if snapshot.childrenCount>0{
                self.DataList.removeAll()
                
                for bmi in snapshot.children.allObjects as! [DataSnapshot]{
                    let bmiObject = bmi.value as? [String: AnyObject]
                    
                    let Dname = bmiObject?["name"]
                    let Dage = bmiObject?["age"]
                    let Dgender = bmiObject?["gender"]
                    let Dheight = bmiObject?["height"]
                    let Dweight = bmiObject?["weight"]
                    let Dbmi_value = bmiObject?["bmi_value"]
                    
                    let bmiData = BmiModel(name:Dname as! String?,age: Dage as! String?,gender:Dgender as! String?,height:Dheight as! String?,weight:Dweight as! String?,bmi:Dbmi_value as! String?)
                    
                    self.DataList.append(bmiData)
                    
                }
            
                self.dataTableView.reloadData()
            }
            
            })
            
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
