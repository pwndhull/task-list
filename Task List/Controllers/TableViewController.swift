//
//  TableViewController.swift
//  Task List
//
//  Created by Pawan Dhull on 16/05/20.
//  Copyright © 2020 Pawan Dhull. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var taskStore : TaskStore!{
        didSet {
            taskStore.tasks = TaskUtility.fetch()  ?? [[Task](),[Task]()]
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
         
//        let todoTask = [Task.init(Name: "Demo note Make your own note by clicking the add button.")]
//       let doneTaks = [Task.init(Name: "You will see your complerted notes here.")]
//        taskStore.tasks = [todoTask,doneTaks]

    }

    @IBAction func addTasks(_ sender: UIBarButtonItem) {
        print("add task button pressed")
        // setup alert controller
        let alertController = UIAlertController(title: "Add Task", message: nil, preferredStyle: .alert)
        // alert actions
        let addaction = UIAlertAction(title: "Add", style: .default) {_ in
            guard let name = alertController.textFields?.first?.text else { return }
            let newTask = Task(Name: name)
            self.taskStore.add(newTask, at: 0)
            let indexPath = IndexPath(item: 0, section: 0)
            self.tableView.insertRows(at: [indexPath], with: .automatic)
            TaskUtility.save(self.taskStore.tasks)

        }
        addaction.isEnabled = false
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        //action added to alert controller
        alertController.addAction(addaction)
        alertController.addAction(cancelAction)
        
        alertController.addTextField { textField in
            textField.placeholder = "Enter Your task."
            textField.addTarget(self, action: #selector(self.handleTextChange(_:)), for: .editingChanged)
        }
        
        present(alertController, animated: true)
    }
    
    @objc func handleTextChange(_ sender: UITextField){
        guard let alertcontroller = presentedViewController as? UIAlertController,
            let addaction = alertcontroller.actions.first,
            let text = sender.text
            else { return }
        addaction.isEnabled  = !text.trimmingCharacters(in: .whitespaces).isEmpty
        
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return taskStore.tasks.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return taskStore.tasks[section].count
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0  ? "To-Do" : "Done"
    }
    
//    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
//        return section == 0 ? "Above task are remaining" : "These are the completed task."
//    }
//    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return 12
//    }
//
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        cell.label?.text =  taskStore.tasks[indexPath.section][indexPath.row].Name
        return cell
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
        }
    }
    //MARK: - Table View Delegate
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: nil) { (action, sourceView, completionHandler) in
            guard let isDone = self.taskStore.tasks[indexPath.section][indexPath.row].isDone else { return }
            self.taskStore.removeTask(at: indexPath.row, isdone: isDone)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            TaskUtility.save(self.taskStore.tasks)

            completionHandler(true)
        }
        deleteAction.image = UIImage(named: "delete")
        deleteAction.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let doneAction = UIContextualAction(style: .normal, title: nil) { (action, sourceView, complitionHandler) in
            self.taskStore.tasks[0][indexPath.row].isDone = true
            let doneTask = self.taskStore.removeTask(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            self.taskStore.add(doneTask, at: 0, isdone: true)
            tableView.insertRows(at: [IndexPath(row:0,section:1)], with: .automatic)
            TaskUtility.save(self.taskStore.tasks)

            complitionHandler(true)
        }
        doneAction.image = UIImage(named: "done")
        doneAction.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        return indexPath.section == 0 ? UISwipeActionsConfiguration(actions: [doneAction]) : nil
    }
}
