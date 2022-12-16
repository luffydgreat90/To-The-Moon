//
//  UINavigationController+Extension.swift
//  ToTheMoon
//
//  Created by Marlon Ansale on 11/27/22.
//

import UIKit.UINavigationController

public extension UINavigationController {

  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    navigationBar.topItem?.backButtonDisplayMode = .minimal
  }

}
