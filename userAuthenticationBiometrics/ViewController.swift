//
//  ViewController.swift
//  userAuthenticationBiometrics
//
//  Created by Neil Shah on 3/29/19.
//  Copyright © 2019 Neil Shah. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    
    @IBAction func didTapAuthenticate(_ sender: Any) {
        self.userAuthenticationWithBiometrics()
    }
    
    func userAuthenticationWithBiometrics(){
        let context: LAContext = LAContext()
        let authMessage = "Authorization needed for app!"
        var authError: NSError?
        
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &authError){
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: authMessage, reply: { (success, error) in
                
                if(success){
                    DispatchQueue.main.async {
                        print("User Authenticated!")
                        self.view.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
                    }
                } else {
                    DispatchQueue.main.async {
                        self.view.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
                    }
                    if let error = error {
                        print(error.localizedDescription)
                    }
                    
                }
            })
        }
    }
    

}

