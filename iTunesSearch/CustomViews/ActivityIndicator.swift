//
//  ActivityIndicator.swift
//  iTunesSearch
//
//  Created by Yasaswi on 11/4/20.
//  Copyright © 2020 Yasaswi. All rights reserved.
//

import Foundation
import UIKit

class LoadingIndicatorView {
    
    static var viewForActivityIndicator = UIView()
    static let loadingTextLabel = UILabel()
    static var activityIndicatorView = UIActivityIndicatorView(style: .large)
    
    static func display(for view: UIView? = nil, title: String) {
        var currentView: UIView?
        
        if let view = view {
            currentView = view
        } else if let mainWindow = UIApplication.shared.windows.first(where: {$0.isKeyWindow}),
            var rootVc = mainWindow.rootViewController {
            while (rootVc.presentedViewController != nil) {
                rootVc = rootVc.presentedViewController!
            }
            currentView = rootVc.view
        }
        guard let view = currentView else { return }
        
        viewForActivityIndicator.alpha = 0
        viewForActivityIndicator.backgroundColor = UIColor.black
        viewForActivityIndicator.translatesAutoresizingMaskIntoConstraints = false
        currentView?.addSubview(viewForActivityIndicator)
        currentView?.bringSubviewToFront(viewForActivityIndicator)
        NSLayoutConstraint.activate([
            viewForActivityIndicator.widthAnchor.constraint(equalTo: view.widthAnchor),
            viewForActivityIndicator.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
        
        
        activityIndicatorView.hidesWhenStopped = true
        activityIndicatorView.color = .white
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicatorView.startAnimating()
        viewForActivityIndicator.addSubview(activityIndicatorView)
        NSLayoutConstraint.activate([
            activityIndicatorView.centerXAnchor.constraint(equalTo: viewForActivityIndicator.centerXAnchor),
            activityIndicatorView.centerYAnchor.constraint(equalTo: viewForActivityIndicator.centerYAnchor)
        ])
        
        
        loadingTextLabel.text = title
        loadingTextLabel.textColor = UIColor.white
        loadingTextLabel.translatesAutoresizingMaskIntoConstraints = false
        viewForActivityIndicator.addSubview(loadingTextLabel)
        NSLayoutConstraint.activate([
            loadingTextLabel.topAnchor.constraint(equalTo: activityIndicatorView.bottomAnchor, constant: 16),
            loadingTextLabel.centerXAnchor.constraint(equalTo: activityIndicatorView.centerXAnchor)
        ])
        
        UIView.animate(withDuration: 0.3) {
            self.viewForActivityIndicator.alpha = self.viewForActivityIndicator.alpha > 0 ? 0 : 0.5
        }
    }
    
    static func hide() {
        viewForActivityIndicator.removeFromSuperview()
        activityIndicatorView.stopAnimating()
    }
    
}
