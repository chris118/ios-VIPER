//
//  LoginInterfaces.swift
//  VIPER
//
//  Created by Chris on 2018/4/13.
//  Copyright (c) 2018年 Chris. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

enum LoginNavigationOption {
    case home
}

protocol LoginWireframeInterface: WireframeInterface {
    // 跳转操作
    func navigate(to option: LoginNavigationOption)
}

protocol LoginViewInterface: ViewInterface {
    //更新界面操作
    //例如
    func updateUI()
}

// Presenter 是View和Interactor的粘合剂，负责组织处理逻辑
protocol LoginPresenterInterface: PresenterInterface {
    //对界面操作进行处理
    func didSelectLoginAction(with email: String?, password: String?)
}

//Interactor实际对数据进行获取等
protocol LoginInteractorInterface: InteractorInterface {
    //模拟网络访问接口
    func loginUser(with email: String, password: String?, callback: ((Bool) ->())?)
}