//
//  AnidesuTextField.swift
//  ANIDESU
//
//  Created by Wirunpong Jaingamlertwong on 24/2/2562 BE.
//  Copyright © 2562 Wirunpong Jaingamlertwong. All rights reserved.
//

import UIKit

enum AnidesuRoundViewState {
    case normal
    case focused
    case empty
    case validate
}

class AnidesuTextField: UITextField {
    @IBInspectable var useDefaultTextField: Bool = false
    @IBInspectable var cornerRadius: CGFloat = 4.0
    @IBInspectable var borderWidth: CGFloat = 0.0
    @IBInspectable var fontSize: String?
    @IBInspectable var placeholderKey: String?
    @IBInspectable var placeholderColor: UIColor = AnidesuColor.Clear.color()
    @IBInspectable var normalState: UIColor = AnidesuColor.Clear.color()
    @IBInspectable var focusedState: UIColor = AnidesuColor.Clear.color()
    @IBInspectable var emptyState: UIColor = AnidesuColor.Clear.color()
    @IBInspectable var validateState: UIColor = AnidesuColor.Clear.color()
    
    var padding = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    
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
        NotificationCenter.default.addObserver(self, selector: #selector(AnidesuTextField.setUp), name: NSNotification.Name(rawValue: LCLLanguageChangeNotification), object: nil)
    }
    
    public func removeObserver() {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func setUp() {
        self.setInterface()
    }
    
    private func setInterface() {
        if self.useDefaultTextField {
            self.setDefaultTextFieldStyle()
        } else {
            self.setCustomTextFieldStyle()
        }
    }
    
    private func setDefaultTextFieldStyle() {
        if let _fontSize = self.fontSize?.lowercased() {
            self.font = AnidesuFontSize(rawValue: _fontSize)?.getFont()
        } else {
            self.font = AnidesuFontSize.TinyMed.getFont()
        }
        self.textColor = self.isEnabled ?
            AnidesuColor.DarkBlue.color() : AnidesuColor.LightGray.color()
        self.backgroundColor = self.isEnabled ?
            AnidesuColor.White.color() : AnidesuColor.LightGray.color()
        self.setPlaceholder(placeholderColor: AnidesuColor.Gray.color())
        self.layer.cornerRadius = 4
        self.layer.borderWidth = 2
        self.layer.borderColor = AnidesuColor.LightGray.color().cgColor
        self.normalState = AnidesuColor.LightGray.color()
        self.validateState = AnidesuColor.Orange.color()
        self.focusedState = AnidesuColor.Green.color()
        self.emptyState = AnidesuColor.Gray.color()
    }
    
    private func setCustomTextFieldStyle() {
        if let _fontSize = self.fontSize?.lowercased() {
            self.font = AnidesuFontSize(rawValue: _fontSize)?.getFont()
        } else {
            self.font = AnidesuFontSize.TinyMed.getFont()
        }
        self.setPlaceholder(placeholderColor: self.placeholderColor)
        self.layer.cornerRadius = self.cornerRadius
        self.layer.borderColor = self.normalState.cgColor
        self.layer.borderWidth = self.borderWidth
    }
    
    private func setPlaceholder(placeholderColor: UIColor) {
        if let key = self.placeholderKey {
            let text = Localize.main(key: key)
            self.attributedPlaceholder = NSAttributedString(string: text, attributes: [NSAttributedString.Key.foregroundColor: placeholderColor.cgColor])
        }
    }
    
    func changeState(state: AnidesuRoundViewState) {
        switch state {
        case .normal:
            self.layer.borderColor = self.normalState.cgColor
        case .focused:
            self.layer.borderColor = self.focusedState.cgColor
        case .empty:
            self.layer.borderColor = self.emptyState.cgColor
        case .validate:
            self.layer.borderColor = self.validateState.cgColor
        }
    }
    
    func changeState(state: Bool) {
        if state {
            self.changeState(state: .normal)
        } else {
            self.changeState(state: .validate)
        }
    }
    
    func setPlaceholder(text: String) {
        let text = Localize.main(key: text)
        self.attributedPlaceholder = NSAttributedString(string: text, attributes: [NSAttributedString.Key.foregroundColor: AnidesuColor.DarkGray.color().cgColor])
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: self.padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: self.padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: self.padding)
    }
    
    func changePadding(paddingInset: UIEdgeInsets) {
        self.padding = paddingInset
        self.layoutSubviews()
    }
}
