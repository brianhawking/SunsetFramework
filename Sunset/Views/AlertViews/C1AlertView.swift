//
//  C1AlertView.swift
//  Demo
//
//  Created by Brian Veitch on 12/24/22.
//

import UIKit

class C1AlertView: UIView {

    @IBOutlet private weak var iconImage: UIImageView!
    @IBOutlet private weak var headingLabel: UILabel!
    
    let nibName = "C1AlertView"
    var contentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupView()
    }
    
    func setupView() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        self.contentView = nib.instantiate(withOwner: self, options: nil).first as? UIView
        addSubview(contentView)
        
        contentView.center = self.center
        contentView.autoresizingMask = []
        contentView.translatesAutoresizingMaskIntoConstraints = true
        
        headingLabel.text = ""
    }
    
}
