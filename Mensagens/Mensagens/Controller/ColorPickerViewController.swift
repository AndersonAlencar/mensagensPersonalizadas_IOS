//
//  ColorPickerViewController.swift
//  Mensagens
//
//  Created by Anderson Alencar on 19/06/19.
//  Copyright © 2019 Eric Brito. All rights reserved.
//

import UIKit

protocol colorPickerDelegate: class {
    func applyColor(color: UIColor)
    
    
}

class ColorPickerViewController: UIViewController {

    
    @IBOutlet weak var viColor: UIView!
    @IBOutlet weak var slRed: UISlider!
    @IBOutlet weak var slGreen: UISlider!
    @IBOutlet weak var slBlue: UISlider!
    
    
    weak var delegate: colorPickerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func chooseColor(_ sender: Any) {
        delegate?.applyColor(color: self.viColor.backgroundColor!)
        dismiss(animated: true, completion: nil)
        
    }
    
    
    @IBAction func changeColor(_ sender: Any) {
        
        self.viColor.backgroundColor = UIColor(red: CGFloat(self.slRed.value), green: CGFloat(self.slGreen.value), blue: CGFloat(self.slBlue.value  ), alpha: 1)
    }
    
}
