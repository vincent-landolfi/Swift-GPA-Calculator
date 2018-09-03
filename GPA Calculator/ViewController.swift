//
//  ViewController.swift
//  GPA Calculator
//
//  Created by Vincent Landolfi on 2017-04-19.
//  Copyright © 2017 Vincent Landolfi. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet var course1: UITextField!
    @IBOutlet var course2: UITextField!
    @IBOutlet var course3: UITextField!
    @IBOutlet var course4: UITextField!
    @IBOutlet var course5: UITextField!
    
    
    @IBOutlet var gpa: UILabel!
    var total = 0.0
    var holder = 0
    var count = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        course1.delegate = self
        course2.delegate = self
        course3.delegate = self
        course4.delegate = self
        course5.delegate = self
        course1.keyboardType = UIKeyboardType.decimalPad
        course2.keyboardType = UIKeyboardType.decimalPad
        course3.keyboardType = UIKeyboardType.decimalPad
        course4.keyboardType = UIKeyboardType.decimalPad
        course5.keyboardType = UIKeyboardType.decimalPad
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    @IBAction func calcGPA(_ sender: AnyObject) {
        while count < 6 {
            if count == 1 {
                holder = Int(course1.text!)!
            } else if count == 2 {
                holder = Int(course2.text!)!
            } else if count == 3 {
                holder = Int(course3.text!)!
            } else if count == 4 {
                holder = Int(course4.text!)!
            } else if count == 5{
                holder = Int(course5.text!)!
            }
            if holder >= 85 {
                total += 4
            } else if holder >= 80 && holder < 85 {
                total += 3.7
            } else if holder >= 77 && holder < 80 {
                total += 3.3
            } else if holder >= 73 && holder < 77 {
                total += 3
            } else if holder >= 70 && holder < 73 {
                total += 2.7
            } else if holder >= 67 && holder < 70 {
                total += 2.3
            } else if holder >= 63 && holder < 67 {
                total += 2
            } else if holder >= 60 && holder < 63 {
                total += 1.7
            } else if holder >= 57 && holder < 60 {
                total += 1.3
            } else if holder >= 53 && holder < 57 {
                total += 1
            } else if holder >= 50 && holder < 53 {
                total += 0.7
            } else {
                total += 0
            }
            count += 1
        }
    course1.text = ""
    course2.text = ""
    course3.text = ""
    course4.text = ""
    course5.text = ""
    gpa.text = "GPA is: " + String(round((total/5)*10)/10)
    count = 0
    }

}

