//
//  AllTasks.swift
//  Task Manager
//
//  Created by Aaron Fisher on 9/17/18.
//  Copyright © 2018 Aaron Fisher. All rights reserved.
//

import Foundation

// Tasks and their functions

class AllTasks  {
    
    var taskArray = [Task(yourTask: "Complete this code"), Task(yourTask: "Get a steady job"), Task(yourTask: "Play Cards")] // List of task
    
    func addTask() { // Adding a task
        print("Please enter the Task you would like to add?")
        var newTask = readLine()
        while newTask == nil { // Checks to see if the answer will work
            print("That is not a valid answer")
            newTask = readLine()
        }
        let theNewTask = Task(yourTask: newTask!)
        taskArray.append(theNewTask)
    }
    
    func deleteTask() {// Deletes a task
        for index in 0..<taskArray.count{
            print("\(index) - \(taskArray[index].yourTask)") // Goes through tasks and gives them a number
        }
        print("Please enter the number for the task you wish to delete:")
        
        var userInput = Int(readLine()!) // takes an imput that tells tells the computer what task is chosen
        let validTaskIndex = Array(0..<taskArray.count)
        
        while userInput == nil || !validTaskIndex.contains(userInput!){ // Checks to see if the answer will work
            print("Invalid response. Please enter a useable index")
            userInput = Int(readLine()!)
        }
        
        taskArray.remove(at: userInput!) // removes the task
    }
    
    func listAllTasks() { // lists all tasks
        for task in taskArray {
                print(task.yourTask)
        }
        print("\n\n")
    }
    
    func listCompletedTasks() {
        var complete = 0 // Numbers the tasks
        for task in taskArray {
            if task.completed { // For every task that is complete it will print it
                print(task.yourTask)
                complete += 1
            }
        }
        if complete == 0 { // checks to see if the tasks are complete or not
            print("There are no completed tasks.")
        }
        print("\n\n")
    }
    
    func listIncompletedTasks() {
        var incomplete = 0
        for task in taskArray {
            if !task.completed { // for every task that is not complete it will print it
                print(task.yourTask)
                incomplete += 1
            }
        }
        if incomplete == 0 { // checks to see if the tasks are complete or not
            print("There are no Incompleted tasks.")
        }
        print("\n\n")
    }
    
    func markTaskComplete() { // Marks the task complete
        var completed = 0
        if completed == taskArray.count {
            print("There are no tasks to complete.")
        }else{
            var counter = 1 // allows me to be able to put a numberr before each task
            print("What task would you like to mark complete?")
            for task in taskArray { // For every incomplete task that is in the array it will print
                if !task.completed { // if the task is not complete
                    print("\(counter): \(task.yourTask)") // prints out "1. (your task)"
                    counter += 1
                }

            }
            print("Please enter the number corresponding with the task you would like to mark Complete")
            var taskComplete = Int(readLine()!)
            while taskComplete == nil { // Checks to see if the answer will work
                print("That is not a valid answer")
                taskComplete = Int(readLine()!) // Anwer needs to equal an integer
            }
            if  taskComplete! <= 0 || taskComplete! > taskArray.count  { // this is checking to see if the number entered is an option in the Array
                    print("This is not a valid integer")
                    taskComplete = Int(readLine()!)
            }

            if taskArray[taskComplete!].completed == false { // This checks to see if Inc the task is not completed and tells you the task is completed if it is completed
                taskArray[taskComplete!].completed = true // this will mark the task complet
                completed += 1
            }else{
                print("This task is already marked 'Complete'")
            }
        }
        print("\n\n")
    }
    
    func markTaskIncomplete() { // Marks the task Incomplete
        var uncompleted = 0
        if uncompleted == taskArray.count {
            print("There are no tasks that are complete.")
        }else{
            var counter = 1
            print("What task would you like to mark Incomplete?")
            for task in taskArray { // For every  completed task that is in the array it will print
                if task.completed {// if the task is complete
                    print("\(counter): \(task.yourTask)")
                    counter += 1
                }
            }
            print("Please enter the number corresponding with the task you would like to mark Incomplete.")
            var taskIncomplete = Int(readLine()!)
            while taskIncomplete == nil { // Checks to see if the answer will work
                print("That is not a valid number")
                taskIncomplete = Int(readLine()!) // Answer needs to equal an integer
                if  taskIncomplete! <= 0 || taskIncomplete! > taskArray.count  { // this is checking to see if the number entered is an option in the Array
                    print("This is not a valid integer")
                     taskIncomplete = Int(readLine()!)
                }
            }
            if taskArray[taskIncomplete!].completed == true { // This checks to see if the task is  completetask and tells you the task is not completed if it is not completed
                taskArray[taskIncomplete!].completed = false // this will set the task to incomplete
                uncompleted += 1
            }else{
                print("This task is already marked 'Incomplete'")
            }
        }
        print("\n\n")
    }
    
    func yesNoInput() -> String{ // allows me to make a quick yes or no answer question
        let userInput = readLine()!
        if userInput.uppercased() == "YES"{
            return "yes" // returns the string yes
        }else if userInput.uppercased() == "NO"{
            return "no"// returns the string no
        }else{ // checks to see if its a yes or no question
            print("Please enter either yes or no.")
            return yesNoInput()
        }
    }
    
    func returnToMenu() { // takes a yes or no imput and decides what to do from there.
        let answer = yesNoInput()
        if answer == "no"{
           exit(0)
        }
        print("")
    }
}





