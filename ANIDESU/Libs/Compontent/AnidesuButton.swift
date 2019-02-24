//
//  AnidesuButton.swift
//  ANIDESU
//
//  Created by Wirunpong Jaingamlertwong on 24/2/2562 BE.
//  Copyright © 2562 Wirunpong Jaingamlertwong. All rights reserved.
//

import UIKit

enum AnidesuButtonStyle {
    case daventDefault
    case ghost
    case labeled
}

class AnidesuButton: UIButton {
    @IBInspectable var useDefaultButton: Bool = false
    @IBInspectable var useGhostButton: Bool = false
    @IBInspectable var useLabeledButton: Bool = false
    @IBInspectable var useShadow: Bool = false
    @IBInspectable var defaultColor: UIColor = AnidesuColor.Clear.color()
    @IBInspectable var highlightColor: UIColor = AnidesuColor.Clear.color()
    @IBInspectable var cornerRadius: CGFloat = 0.0
    @IBInspectable var borderWidth: CGFloat = 0.0
    @IBInspectable var borderColor: UIColor = AnidesuColor.Clear.color()
    @IBInspectable var key: String?
    @IBInspectable var fontSize: String?
    @IBInspectable var isUnderLine: Bool = false
    
    override var isHighlighted: Bool {
        didSet {
            if self.useDefaultButton {
                self.backgroundColor = isHighlighted ?
                    AnidesuColor.DarkBlue.color() : AnidesuColor.Green.color()
            } else if self.useGhostButton {
                self.layer.borderColor = isHighlighted ?
                    AnidesuColor.DarkBlue.color().cgColor : AnidesuColor.Green.color().cgColor
            }
        }
    }
    
    override var isEnabled: Bool {
        didSet {
            self.setInterface()
        }
    }
    
    override func awakeFromNib() {
        self.setUp()
        self.addObserver()
        self.setInterface()
    }
    
    deinit {
        self.removeObserver()
    }
    
    public func addObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(AnidesuButton.setUp), name: NSNotification.Name(rawValue: LCLLanguageChangeNotification), object: nil)
    }
    
    public func removeObserver() {
        NotificationCenter.default.removeObserver(self)
    }
    
    func changeButtonStyle(style: AnidesuButtonStyle) {
        switch style {
        case .daventDefault:
            self.useDefaultButton = true
        case .ghost:
            self.useGhostButton = true
        case .labeled:
            self.useLabeledButton = true
        }
        self.setInterface()
    }
    
    @objc func setUp() {
        self.setInterface()
    }
    
    func setInterface() {
        self.setUpButton()
    }
    
    func setUpButton() {
        if let key = self.key {
            self.setTitle(Localize.main(key: key).uppercased(), for: .normal)
        }
        
        if self.useDefaultButton {
            self.setDefaultButtonStyle()
        } else if self.useGhostButton {
            self.setGhostButtonStyle()
        } else if self.useLabeledButton {
            self.setLabeledButtonStyle()
            if let key = self.key {
                self.setTitle(Localize.main(key: key), for: .normal)
            }
        } else {
            self.setCustomButtonStyle()
            if let key = self.key {
                self.setTitle(Localize.main(key: key), for: .normal)
            }
        }
        
        if self.isUnderLine {
            self.titleLabel?.underLine()
        }
    }
    
    private func setCustomButtonStyle() {
        if self.useShadow {
            self.layer.shadowColor = #colorLiteral(red: 0.06274509804, green: 0, blue: 0, alpha: 1)
            self.layer.shadowOffset = CGSize(width: 0, height: 2)
            self.layer.shadowOpacity = 0.25
            self.layer.shadowRadius = 3
        }
        
        if let _fontSize = self.fontSize?.lowercased() {
            self.titleLabel?.font = AnidesuFontSize(rawValue: _fontSize)?.getFont()
        } else {
            self.titleLabel?.font = AnidesuFontSize.ExtraSmallMed.getFont()
        }
        self.backgroundColor = self.isEnabled ? self.defaultColor : AnidesuColor.Gray.color()
        self.setTitleColor(AnidesuColor.Gray.color(), for: .disabled)
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
    }
    
    private func setDefaultButtonStyle() {
        self.titleLabel?.font = AnidesuFontSize.ExtraSmallMed.getFont()
        self.setTitleColor(AnidesuColor.DarkBlue.color(), for: .normal)
        self.setTitleColor(AnidesuColor.DarkBlue.color(), for: .highlighted)
        self.setTitleColor(AnidesuColor.Gray.color(), for: .disabled)
        self.backgroundColor = self.isEnabled ?
            AnidesuColor.Green.color() : AnidesuColor.Gray.color()
        self.layer.cornerRadius = 4
        self.layer.shadowColor = #colorLiteral(red: 0.06274509804, green: 0, blue: 0, alpha: 1)
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowOpacity = 0.25
        self.layer.shadowRadius = 3
    }
    
    private func setGhostButtonStyle() {
        self.titleLabel?.font = AnidesuFontSize.ExtraSmallMed.getFont()
        self.setTitleColor(AnidesuColor.DarkBlue.color(), for: .normal)
        self.setTitleColor(AnidesuColor.DarkBlue.color(), for: .highlighted)
        self.setTitleColor(AnidesuColor.Gray.color(), for: .disabled)
        self.backgroundColor = AnidesuColor.Clear.color()
        self.layer.borderColor = self.isEnabled ?
            AnidesuColor.Green.color().cgColor : AnidesuColor.Gray.color().cgColor
        self.layer.borderWidth = 2
        self.layer.cornerRadius = 4
    }
    
    private func setLabeledButtonStyle() {
        self.titleLabel?.font = AnidesuFontSize.ExtraSmallBold.getFont()
        self.backgroundColor = AnidesuColor.Clear.color()
        self.titleLabel?.underLine()
        self.setTitleColor(AnidesuColor.Green.color(), for: .normal)
        self.setTitleColor(AnidesuColor.DarkBlue.color(), for: .highlighted)
        self.setTitleColor(AnidesuColor.Gray.color(), for: .disabled)
    }
    
    public func switchButton(isEnabled: Bool, tintColor: AnidesuColor) {
        self.tintColor = tintColor.color()
        self.isEnabled = isEnabled
    }
    
    func changeRoundViewColor(color: AnidesuColor) {
        self.layer.borderColor = color.color().cgColor
    }
}
