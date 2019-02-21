//
//  AnidesuLabel.swift
//  ANIDESU
//
//  Created by Wirunpong Jaingamlertwong on 21/2/2562 BE.
//  Copyright © 2562 Wirunpong Jaingamlertwong. All rights reserved.
//

import UIKit

class AnidesuLabel: UILabel {
    @IBInspectable var fontSize: String?
    @IBInspectable var key: String?
    @IBInspectable var isUnderLine: Bool = false
    
    override func awakeFromNib() {
        self.setUp()
        self.addObserver()
        self.setInterface()
    }
    
    deinit {
        self.removeObserver()
    }
    
    public func addObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(AnidesuLabel.setUp), name: NSNotification.Name(rawValue: LCLLanguageChangeNotification), object: nil)
    }
    
    public func removeObserver() {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func setUp() {
        self.setInterface()
    }
    
    private func setInterface() {
        self.setFontSize()
        self.setText()
    }
    
    private func setFontSize() {
        if let _fontSize = self.fontSize?.lowercased() {
            self.font = AnidesuFontSize(rawValue: _fontSize)?.getFont()
        } else {
            self.font = AnidesuFontSize.ExtraSmallMed.getFont()
        }
    }
    
    private func setText() {
        if let key = self.key {
            self.text = Localize.main(key: key)
        }
        
        if isUnderLine {
//            self.underLine()
        }
    }
}
