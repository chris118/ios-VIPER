//
//  HomeInterfaces.swift
//  VIPER
//
//  Created by Chris on 2018/4/13.
//  Copyright (c) 2018年 Chris. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

enum HomeNavigationOption {
}

protocol HomeWireframeInterface: WireframeInterface {
    func navigate(to option: HomeNavigationOption)
}

protocol HomeViewInterface: ViewInterface {
}

protocol HomePresenterInterface: PresenterInterface {
}

protocol HomeInteractorInterface: InteractorInterface {
}
