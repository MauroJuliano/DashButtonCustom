//
//  CustomButton.swift
//  BotaoCustomizado
//
//  Created by user195713 on 7/19/21.
//

import UIKit

@IBDesignable class CustomButtonController : UIButton {
    
    @IBInspectable var borderColorSelected: UIColor = UIColor.purple
    @IBInspectable var borderColorDeselected: UIColor = UIColor.purple
    
    @IBInspectable var borderWidth: CGFloat = 3
    @IBInspectable var cornerRadius: CGFloat = 10
    
    @IBInspectable var selectedText: String = "Selected"
    @IBInspectable var deselectedText: String = "Deselected"
    
    @IBInspectable var textColorDeselected: UIColor = UIColor.lightGray
    @IBInspectable var textColorSelected: UIColor = UIColor.black
    
    @IBInspectable var active: Bool = false
    
    private let border = CAShapeLayer()

    override func draw(_ rect: CGRect) {
        border.lineWidth = borderWidth
        border.frame = self.bounds
        border.fillColor = nil
        border.path = UIBezierPath(roundedRect: self.bounds, cornerRadius: cornerRadius).cgPath
        self.layer.addSublayer(border)
        
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
        
        if active {
            setSelected()
        }else {
            setDeselect()
        }
        
        self.addTarget(self, action: #selector(onPress), for: .touchUpInside)
    }
    @objc func onPress() {
        active = !active
        if active {
            setSelected()
        }else {
            setDeselect()
        }
    }
    func setSelected(){
        border.lineDashPattern = nil
        border.strokeColor = borderColorSelected.cgColor
        self.setTitle(selectedText, for: .normal)
        self.setTitleColor(textColorSelected, for: .normal)
    }
    
    func setDeselect(){
        border.lineDashPattern = [4, 4]
        border.strokeColor = borderColorDeselected.cgColor
        self.setTitle(deselectedText, for: .normal)
        self.setTitleColor(textColorDeselected, for: .normal)
    }
}
