//
//  ViewController.swift
//  ChangeColor
//
//  Created by Тимур Турлыкин on 28.04.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var redValueView: UILabel!
    @IBOutlet weak var greenValueView: UILabel!
    @IBOutlet weak var blueValueView: UILabel!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var BlueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redSlider.value = 1
        greenSlider.value = 1
        BlueSlider.value = 1
        colorView.layer.cornerRadius = 15
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        changeColor()
        setLabelValue(for: redValueView, greenValueView, blueValueView)
    }
    
    
    
    func changeColor () {
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value) / 255,
                                            green: CGFloat(greenSlider.value) / 255,
                                            blue: CGFloat(BlueSlider.value) / 255,
                                            alpha: 1)
    }
    
    func stringFromValue(slider: UISlider) -> String {
        String(Int(slider.value))
    }
    
    func setLabelValue(for labels: UILabel...) {
        labels.forEach {label in
            switch label.tag {
            case 0 : redValueView.text = stringFromValue(slider: redSlider)
            case 1 : greenValueView.text = stringFromValue(slider: greenSlider)
            case 2 : blueValueView.text = stringFromValue(slider: BlueSlider)
            default: break
            }
        }
    }
    
    @IBAction func moveSlider(_ sender: UISlider) {
        changeColor()
        switch sender.tag {
        case 0 : redValueView.text = stringFromValue(slider: sender)
        case 1 : greenValueView.text = stringFromValue(slider: sender)
        case 2 : blueValueView.text = stringFromValue(slider: sender)
        default: break
        }
    }
}

