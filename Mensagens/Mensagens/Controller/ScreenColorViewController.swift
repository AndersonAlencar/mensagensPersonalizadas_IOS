//
//  ScreenColorViewController.swift
//  Mensagens
//
//  Copyright © 2017 Eric Brito. All rights reserved.
//

import UIKit

class ScreenColorViewController: BaseViewController {
    
    @IBOutlet weak var viBorder: UIView!
    @IBOutlet weak var swWhiteBorder: UISwitch!
    
    @IBOutlet weak var viBaixo: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lbMessage.text = self.message.text
        self.lbMessage.textColor = self.message.textColor
        self.lbMessage.backgroundColor = self.message.backgroundColor
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewController = segue.destination as! ResultViewController
        resultViewController.message = self.message
        resultViewController.useBorder = self.swWhiteBorder.isOn
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @IBAction func activateBorder(_ sender: UISwitch) {
        self.viBorder.backgroundColor = sender.isOn ? .white : .clear
    }
    
    
    @IBAction func goNext(_ sender: Any) {
        
        performSegue(withIdentifier: "goResultView", sender: nil )
    }
    
    
    
}

extension ScreenColorViewController: colorPickerDelegate{
    
    func applyColor(color: UIColor){
        self.view.backgroundColor = color
        self.message.screenColor = color
    }
    
}

