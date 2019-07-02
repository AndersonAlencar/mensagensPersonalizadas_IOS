//
//  MessageColorViewController.swift
//  Mensagens
//
//  Copyright © 2017 Eric Brito. All rights reserved.
//

import UIKit

class MessageColorViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lbMessage.text = self.message.text
        self.lbMessage.textColor = self.message.textColor
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let messageViewController = segue.destination as! ScreenColorViewController
        messageViewController.message = self.message
    }
    
    override func changeColor(_ sender: UIButton) {
        
        let colorPicker = self.storyboard?.instantiateViewController(withIdentifier: "ColorPickerViewController") as! ColorPickerViewController
        colorPicker.modalPresentationStyle = .overCurrentContext
        colorPicker.delegate = self
        present(colorPicker, animated: true, completion: nil )
        
    }
    
    
    
    @IBAction func goNext(_ sender: Any) {
        
        performSegue(withIdentifier: "goScreenColor", sender: nil )
    }
    
}

extension MessageColorViewController: colorPickerDelegate{
    
    func applyColor(color: UIColor){
        self.lbMessage.backgroundColor = color
        self.message.backgroundColor = color
    }
    
}

