//
//  addTaskViewController.swift
//  doit
//
//  Created by Ganesh Prabu on 11/17/17.
//  Copyright © 2017 Ganesh Prabu. All rights reserved.
//

import UIKit

class addTaskViewController: UIViewController {

    var prevVC = TaskViewController()
    
    @IBOutlet weak var taskName: UITextField!
    
    @IBOutlet weak var importantornot: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addtask(_ sender: Any) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext;
        //Create the task from the form
        
        let task = Task(context: context)
        
        task.name = taskName.text!;
        task.imp = importantornot.isOn
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        //Now add it to the task from other vi
        
        prevVC.tasks.append(task)
        prevVC.doit.reloadData()
        navigationController?.popViewController(animated: true)

    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
