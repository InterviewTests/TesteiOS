////
////  ViewController.swift
////  SantanderApp
////
////  Created by Andre Nogueira on 24/04/18.
////  Copyright © 2018 Andre Nogueira. All rights reserved.
////
//
//import UIKit
//import Eureka
//
//class ViewController: FormViewController {
//
//    override func viewDidLoad() {
//        
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//        print("test")
//        SantanderInteractor().fetchCellEntity { (cell, error) in
//            print(cell)
//        }
//        
//        form
//            +++ Section("")
//            <<< SantanderCustomerRow(){ row in
//                row.validationOptions = .validatesOnChange
//                var rules = RuleSet<String>()
//                rules.add(rule: RuleEmail())
//        }
//   
//        
//       <<< TextRow() {
//            $0.title = "Email Rule"
//            var rules = RuleSet<String>()
//            rules.add(rule: RuleRequired())
//            rules.add(rule: RuleEmail())
//            $0.add(ruleSet: rules)
//            $0.validationOptions = .validatesOnChange
//        }
//        .cellUpdate { cell, row in
//            if !row.isValid {
//                cell.titleLabel?.textColor = .red
//            }
//        }
//    }
//        
//               
////                let rulere = RuleRequired()
//                // This could also have been achieved using a closure that returns nil if valid, or a ValidationError otherwise.
//                
////                 let ruleRequiredViaClosure = RuleClosure<String> { rowValue in
////                 return (rowValue == nil || rowValue!.isEmpty) ? ValidationError(msg: "Field required!") : nil
////                 }
////                 row.add(ruleSet: ruleRequiredViaClosure)
////
////
////                row.add(rule:RuleRequired())
////            }
//       
////            <<< NameRow(){
////                $0.title = "Phone Row"
////                $0.placeholder = "And numbers here"
////            }
////            +++ Section("Section2")
////            <<< DateRow(){
////                $0.title = "Date Row"
////                $0.value = Date(timeIntervalSinceReferenceDate: 0)
////        }
//    
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
//
//}
//
