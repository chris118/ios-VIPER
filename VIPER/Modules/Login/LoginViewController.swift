//
//  LoginViewController.swift
//  VIPER
//
//  Created by Chris on 2018/4/13.
//  Copyright (c) 2018年 Chris. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class LoginViewController: UIViewController {
    // MARK: - Public properties -
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var password: UITextField!

    var presenter: LoginPresenterInterface!

    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
    }
	
    @IBAction func loginTap(_ sender: Any) {
        presenter.didSelectLoginAction(with: name.text, password: password.text)
    }
}

// MARK: - Extensions -

extension LoginViewController: LoginViewInterface {
    func updateUI(){
        
    }
}
