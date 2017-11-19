//
//  TaskViewController.swift
//  doit
//
//  Created by Ganesh Prabu on 11/16/17.
//  Copyright © 2017 Ganesh Prabu. All rights reserved.
//

import UIKit

class TaskViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell();
        let task = tasks[indexPath.row]
        if (task.imp == true) {
            cell.textLabel?.text = "❗️"+task.name;

        } else {
            cell.textLabel?.text = task.name;

        }
        return cell;
        
        
    }


    @IBOutlet weak var doit: UITableView!
    var tasks :  [Task] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tasks = makeTasks();
        
        doit.delegate = self
        doit.dataSource = self;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func addItem(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC  = segue.destination as! addTaskViewController;
        nextVC.prevVC = self
    }
    
    func makeTasks() -> [Task] {
        let task1 = Task()
        task1.name = "Get Egg"
        task1.imp = false
        
        let task2 = Task()
        task2.name = "Get Milk"
        task2.imp = false
        
        let task3 = Task()
        task3.name = "Get Chicken"
        task3.imp = true
        
        let return_tasks = [task1, task2, task3]
        return return_tasks;
    
    }
}

