//
//  ViewController.swift
//  Mensagens
//
//  Copyright © 2017 Eric Brito. All rights reserved.
//

import UIKit

class MessageViewController: BaseViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.message = Message()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let messageViewController = segue.destination as! MessageColorViewController
        messageViewController.message = self.message
    }
    
    @IBAction func goNext(_ sender: Any) {
        performSegue(withIdentifier: "goMessageColor", sender: nil)
    }
    
    override func changeColor(_ sender: UIButton) {
        
        let colorPicker = self.storyboard?.instantiateViewController(withIdentifier: "ColorPickerViewController") as! ColorPickerViewController
        colorPicker.modalPresentationStyle = .overCurrentContext
        colorPicker.delegate = self
        present(colorPicker, animated: true, completion: nil )
        
    }
    
    
}

extension MessageViewController: UITextFieldDelegate {
    
    //Essa funçao diz o que deve ser feito quando o usuário apertar retorno no teclado
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.message.text = textField.text!
        self.lbMessage.text = textField.text!
        textField.resignFirstResponder()
        
        return true
        
    }
    
    
}

extension MessageViewController: colorPickerDelegate{
    
    func applyColor(color: UIColor){
        self.lbMessage.textColor = color
        self.message.textColor = color
    }
}


