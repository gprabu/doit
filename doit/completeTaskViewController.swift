//
//  completeTaskViewController.swift
//  doit
//
//  Created by Ganesh Prabu on 11/27/17.
//  Copyright © 2017 Ganesh Prabu. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {
    
    
    var task = Task()
    var prevVC = TaskViewController()
    
    @IBOutlet weak var labelText: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelText.text = task.name
        // Do any additional setup after loading the view.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func deleteTasks(_ sender: Any) {
        print(prevVC.selectedTask)
        prevVC.tasks.remove(at: prevVC.selectedTask)
        
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
