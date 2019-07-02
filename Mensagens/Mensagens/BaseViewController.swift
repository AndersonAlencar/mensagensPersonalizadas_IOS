//
//  BaseViewController.swift
//  Mensagens
//
//  Created by Anderson Alencar on 19/06/19.
//  Copyright © 2019 Eric Brito. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    @IBOutlet weak var lbMessage: UILabel!
    var message: Message!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func changeColor(_ sender: UIButton){
        
        if let reference = self as? colorPickerDelegate {
            let colorPicker = self.storyboard?.instantiateViewController(withIdentifier: "ColorPickerViewController") as! ColorPickerViewController
            colorPicker.modalPresentationStyle = .overCurrentContext
            colorPicker.delegate = reference
            present(colorPicker, animated: true, completion: nil )
        }
        
    }
}
