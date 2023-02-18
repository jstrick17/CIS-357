//
//  ViewController.swift
//  password-generator
//
//  Created by Hans Dulimarta on 1/25/23.
//

import UIKit

class PasswordViewController: UIViewController, SettingVCDelegate {

    @IBOutlet weak var password: UILabel!
    
    var includeNumeric = false
    var includeSpecial = false
    var len = 8
    let alpha =
      "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    var charSet:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        charSet = alpha + alpha.lowercased()
        self.password.text = "---"
    }
    
    @IBAction func doGenerate(_ sender: Any) {
        var str = ""
        for _ in 1...self.len {
            str += String(charSet.randomElement()!)
        }
        self.password.text = str
    }
    
    @IBAction func doClear(_ sender: Any) {
        self.password.text = "---"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSettings" {
            if let destination = segue.destination as? SettingsViewController {
                destination.delegate = self
                destination.len = self.len
                destination.withNumeric = self.includeNumeric
                destination.withSpecial = self.includeSpecial

            }
        }
    }
}

extension PasswordViewController  {
    func setttingChanged(length: Int, useNumeric: Bool, useSpecial: Bool) {
        self.len = length
        self.charSet = self.alpha + self.alpha.lowercased()
        if self.includeNumeric != useNumeric {
            self.charSet += "0123456789"
            self.includeNumeric = useNumeric
        }
        if self.includeSpecial != useSpecial {
            self.charSet += "!@#$%^&*()_+-=[]{}\\|;':\",./<>?`~"
            self.includeSpecial = useSpecial
        }
    }
    
    
}
