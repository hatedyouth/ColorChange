//
//  StartViewController.swift
//  ChangeColor
//
//  Created by Тимур Турлыкин on 21.05.2023.
//

import Foundation
import UIKit

final class StartViewController: UIViewController {
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let colorVC = segue.destination as? ColorViewController else {return}
        colorVC.delegate = self
        colorVC.startViewColor = view.backgroundColor
    }
    
}


extension StartViewController: ColorViewControllerDelegate {
    
    func changeColor (_ color: UIColor) {
        view.backgroundColor = color
    }
    
}
