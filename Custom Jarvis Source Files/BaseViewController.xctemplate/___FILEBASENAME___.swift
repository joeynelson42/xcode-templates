//
//  BaseViewController.swift
//  Empty Application
//

import UIKit

class ___FILEBASENAME___: UIViewController {
    
    // MARK: - View
    
    let baseView = BaseView()
    
    
    // MARK: - Life Cycle
    
    override func loadView() {
        view = baseView
        setupViewOnLoad()
    }
    
    /// Setup View upon loading ViewController (e.g. add targets to buttons, update labels with data, etc.)
    func setupViewOnLoad() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
