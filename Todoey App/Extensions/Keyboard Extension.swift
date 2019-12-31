//
//  Keyboard Extension.swift
//  Todoey App
//
//  Created by Tobi Adejumo on 12/29/19.
//  Copyright © 2019 Tobi Adejumo. All rights reserved.
//

import UIKit


extension ViewController: UITextFieldDelegate{
    @objc func adjustForKeyboard(notification: Notification) {
        print(notification.name)
        if notification.name == UIResponder.keyboardWillShowNotification {
            if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                footer.frame.origin.y = keyboardSize.minY - 50
            }
        }
        if notification.name == UIResponder.keyboardWillHideNotification {
            footer.frame.origin.y = body.frame.maxY
        }
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        addNewElementToList()
        textField.text = ""
        footerElement.buttonText.resignFirstResponder()
        return true
    }
}
