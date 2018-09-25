//
//  Menu.swift
//  Task Manager
//
//  Created by Aaron Fisher on 9/17/18.
//  Copyright © 2018 Aaron Fisher. All rights reserved.
//

import Foundation

class Menu {

    let allTaskFunc = AllTasks()
    var shouldQuit = false

    func printMenu() {
        print("1. List All Tasks\n2. List Completed Tasks\n3. List Incomplete Tasks\n4. Mark Task Incomplete\n5. Mark Task Complete\n6. Delete Task\n7. Add task\n8. Quit")
    }

    func quit() { // This function will be callled when user is ready to quit
        shouldQuit = true // since the user is ready to quit we set the shouldQuit function to true to break it out of the while loop
        print("Thank you for using the Task Manager!")
    }


    func go() {
        // this function is going to handle making the menu run. It willdisplay the menu ans take user input until the user wishes to quit the application
        while !shouldQuit {
            printMenu()
            getInput()
        }
    }

    func getInput() { // gets an integer that will choose the action they want to do
        print("\nWhat would you like to do? (Enter a number 1-8)")
        var userInput = Int(readLine()!)
        while userInput == nil {
            print("That is not a valid answer")
            userInput = Int(readLine()!)
        }
        
        switch userInput { // tells the computer what to do and when/if to do it
        case 1:
            print("Listing All Tasks...")
            print("")
            sleep(1)
            allTaskFunc.listAllTasks()
            print("Would you like to return to the menu?")
            allTaskFunc.returnToMenu()
            go()
        case 2:
            print("Listing Completed Tasks...")
            print("")
            sleep(1)
            allTaskFunc.listCompletedTasks()
            print("Would you like to return to the menu?")
            allTaskFunc.returnToMenu()
            go()
        case 3:
            print("Listing Incompleted Tasks..")
            print("")
            sleep(1)
            allTaskFunc.listIncompletedTasks()
            print("Would you like to return to the menu?")
            allTaskFunc.returnToMenu()
            go()
        case 4:
            print("")
            sleep(1)
            allTaskFunc.MarkTaskIncomplete()
            print("Would you like to return to the menu?")
            allTaskFunc.returnToMenu()
            go()
        case 5:
            print("")
            sleep(1)
            allTaskFunc.MarkTaskComplete()
            print("Would you like to return to the menu?")
            allTaskFunc.returnToMenu()
            go()
        case 6:
            print("")
            sleep(1)
            allTaskFunc.deleteTask()
            print("Would you like to return to the menu?")
            allTaskFunc.returnToMenu()
            go()
        case 7:
            print("")
            sleep(1)
            allTaskFunc.addTask()
            print("Would you like to return to the menu?")
            allTaskFunc.returnToMenu()
            go()
        case 8:
            print("Quitting...")
            sleep(1)
            quit()
        case 777: // Fun extra easteregg
            print("Seven is the best number you should probably create at leat seven tasks")
            print("Would you like to return to the menu?")
            allTaskFunc.returnToMenu()
            go()
        case 77:
            for _ in "pineapple" {
                print("PINEAPPLE!!")
            }
            print("Would you like to return to the menu?")
            allTaskFunc.returnToMenu()
            go()
        default:
            print("This is not a valid number")
            getInput()
        }
    }
}

