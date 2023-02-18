//
//  SettingsViewController.swift
//  password-generator
//
//  Created by Hans Dulimarta on 1/25/23.
//

import UIKit

protocol SettingVCDelegate {
    func setttingChanged(length:Int, useNumeric: Bool, useSpecial: Bool)
}

class SettingsViewController: UIViewController {

    @IBOutlet weak var passwordLength: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var specialSwitch: UISwitch!
    @IBOutlet weak var numericSwitch: UISwitch!
    var delegate: SettingVCDelegate?
    var withNumeric: Bool = false
    var withSpecial: Bool = false
    var len:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.slider.value = Float(self.len)
        self.specialSwitch.setOn(self.withSpecial, animated: false)
        self.numericSwitch.setOn(self.withNumeric, animated: false)
        self.passwordLength.text = "Password Length \(self.len)"

    }
    
//    override func viewWillDisappear(_ animated: Bool) {
//        self.delegate?.setttingChanged(length: self.len, useNumeric: self.withNumeric, useSpecial: self.withSpecial)
//    }
    @IBAction func useSettings(_ sender: Any) {
        self.delegate?.setttingChanged(length: Int(self.slider.value), useNumeric: self.withNumeric, useSpecial: self.withSpecial)
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func cancelSettings(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func sliderChanged(_ sender: Any) {
        print("Changed")
        self.passwordLength.text = "Password Length \(Int(roundf(self.slider.value)))"
    }
    
    @IBAction func numericToggled(_ sender: Any) {
        self.withNumeric = !self.withNumeric
    }
    
    @IBAction func specialToggled(_ sender: Any) {
        self.withSpecial = !withSpecial
    }
    
}
