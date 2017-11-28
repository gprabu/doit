//
//  TaskViewController.swift
//  doit
//
//  Created by Ganesh Prabu on 11/16/17.
//  Copyright © 2017 Ganesh Prabu. All rights reserved.
//

import UIKit

class TaskViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
   
    var tasks :  [Task] = [];
    var selectedTask = 0;
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell();
        let task = tasks[indexPath.row]
        if (task.imp == true) {
            cell.textLabel?.text = "❗️ \(task.name)";
        } else {
            cell.textLabel?.text = task.name;
        }
        return cell;
        
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedTask = indexPath.row
        let task = tasks[selectedTask]
        performSegue(withIdentifier: "showCompleteTask", sender: task)
    }
    @IBOutlet weak var doit: UITableView!
   
    
    
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
        
        if (segue.identifier == "addSegue") {
            let nextVC  = segue.destination as! addTaskViewController;
            nextVC.prevVC = self
        }
        else if (segue.identifier == "showCompleteTask" ){
            let nextVC = segue.destination as! CompleteTaskViewController;
            nextVC.task = sender as! Task;
            nextVC.prevVC = self;
        }
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

