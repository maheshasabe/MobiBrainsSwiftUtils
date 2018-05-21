//
//  ViewController.swift
//  Example
//
//  Created by Mahesh Asabe on 17/05/18.
//  Copyright © 2018 Mahesh Asabe. All rights reserved.
//

import UIKit
import MobiBrainsSwiftUtils

class ViewController: UIViewController {

    @IBOutlet weak var themeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        printAppInfo()
        validateEmail()
        logging()
        themeCheck()
    }
    
    func printAppInfo() {
        print(AppInfo.version)
        print(AppInfo.name)
        print(AppInfo.buildNumber)
        print(AppInfo.deviceModel)
        print(AppInfo.systemVersion)
    }
    
    func validateEmail()  {
    
        let validator = Validator.init(fieldName: "Email", rules: [EmailValidator()])
        
        do {
            try validator.validate("maheshgmail.com")
        } catch let error as ValidationError {
            print("\(error.localizedDescription)")
        }catch {
            print("unexpected error")
        }
    }
    
    func logging() {
        
        Log.logLevel = .verbose
        
        Log.info("Hello world")
        Log.verbose("Ignore me")
        Log.error("Don't ignore me!")
    }
    
    func themeCheck() {
        Theme.shared.setupTheme(withThemeFileName: "DefaultTheme")
        
        themeLabel.attributedText = NSAttributedString(string: "Hey, This is Mahesh", attributes: Theme.shared.attributesForLabel("headerLabel"))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

