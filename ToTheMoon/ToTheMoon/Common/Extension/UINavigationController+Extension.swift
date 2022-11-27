//
//  UINavigationController+Extension.swift
//  ToTheMoon
//
//  Created by Marlon Ansale on 11/27/22.
//

import UIKit.UINavigationController

extension UINavigationController {

  open override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    navigationBar.topItem?.backButtonDisplayMode = .minimal
  }

}
