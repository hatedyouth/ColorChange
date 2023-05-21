//
//  ViewController.swift
//  ChangeColor
//
//  Created by Тимур Турлыкин on 28.04.2023.
//
import Foundation
import UIKit


protocol ColorViewControllerDelegate {
    func changeColor (_ color: UIColor)
}


final class ColorViewController: UIViewController {
    
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redValueView: UILabel!
    @IBOutlet weak var greenValueView: UILabel!
    @IBOutlet weak var blueValueView: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    
    var delegate: ColorViewControllerDelegate!
    var startViewColor: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView.layer.cornerRadius = 15
        colorView.backgroundColor = startViewColor
        
        setSliders()
        setLabelValue(for: redValueView, greenValueView, blueValueView)
        setTextfieldsValue(textfields: redTextField, greenTextField, blueTextField)
        
        
    }
    
    @IBAction func moveSlider(_ sender: UISlider) {
        changeColor()
        switch sender.tag {
        case 0 : setLabelValue(for: redValueView)
            setTextfieldsValue(textfields: redTextField)
        case 1 : setLabelValue(for: greenValueView)
            setTextfieldsValue(textfields: greenTextField)
        default : setLabelValue(for: blueValueView)
            setTextfieldsValue(textfields: blueTextField)
        }
        changeColor()
    }
    
    @IBAction func doneButtonTap() {
        delegate?.changeColor(colorView.backgroundColor ?? .white)
        dismiss(animated: true)
    }
    
    private func changeColor() {
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value) ,
                                            green: CGFloat(greenSlider.value) ,
                                            blue: CGFloat(blueSlider.value) ,
                                            alpha: 1)
    }
    
    private func stringFromValue(slider: UISlider) -> String {
        String(format:"%.2f", Double(slider.value))
    }
    
    private func setLabelValue(for labels: UILabel...) {
        labels.forEach {label in
            switch label.tag {
            case 0 : redValueView.text = stringFromValue(slider: redSlider)
            case 1 : greenValueView.text = stringFromValue(slider: greenSlider)
            default : blueValueView.text = stringFromValue(slider: blueSlider)
            }
        }
    }
    
    
    private func setSliders() {
        let ciColor = CIColor(color: startViewColor)
        
        redSlider.value = Float(ciColor.red)
        greenSlider.value = Float(ciColor.green)
        blueSlider.value = Float(ciColor.blue)
    }
    
    private func setTextfieldsValue(textfields : UITextField...) {
        textfields.forEach { textfield in
            switch textfield.tag {
            case 0 : redTextField.text = stringFromValue(slider: redSlider)
            case 1 : greenTextField.text = stringFromValue(slider: greenSlider)
            default : blueTextField.text = stringFromValue(slider: blueSlider)
            }
        }
    }
    
    
    
        
}

