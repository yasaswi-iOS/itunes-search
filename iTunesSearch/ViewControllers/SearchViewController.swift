//
//  SearchViewController.swift
//  iTunesSearch
//
//  Created by Yasaswi on 11/4/20.
//  Copyright © 2020 Yasaswi. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    // IBOutlets
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    
    private var isButtonEnabled:Bool! {
        didSet {
            searchButton.isEnabled = isButtonEnabled
            searchButton.backgroundColor = searchButton.backgroundColor?.withAlphaComponent(isButtonEnabled ? 1.0 : 0.5)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isButtonEnabled = false
        navigationController?.navigationBar.barStyle = UIBarStyle.black
        navigationController?.navigationBar.tintColor = UIColor.white
        // Notification to handle keyboard
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func searchButtonTapped() {
        self.view.endEditing(true)
        LoadingIndicatorView.display(title: "Performing Search...")
        let searchRequest = SearchArtistRequest()
        searchRequest.apiURL = SearchArtist.getArtistList(user: usernameField.text!).apiURL
        let apiManager = APIManager(networkManager: NetworkManager(session: URLSession(configuration: URLSessionConfiguration.default)))
        apiManager.fetchArtistList(requestObject: searchRequest) { [weak self] (success, decodedResponse, error) in
            LoadingIndicatorView.hide()
            if let response = decodedResponse {
                let artistDetailViewController: ArtistDetailsViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ArtistDetailsViewController") as! ArtistDetailsViewController
                artistDetailViewController.details = response
                self?.navigationController?.pushViewController(artistDetailViewController, animated: true)
            }
        }
        
    }
    
    @IBAction func textfieldEdited(_ sender: Any) {
        isButtonEnabled = usernameField.text?.count ?? 0 > 0
    }
    
    //MARK: Keyboard Notification Handlers
    @objc func keyboardDidShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.size {
            let keyboardHeight = keyboardSize.height + 30
            let buttonOrigin = searchButton.frame.origin
            let buttonheight = searchButton.frame.size.height
            var visibleRect:CGRect = view.frame
            visibleRect.size.height -= keyboardHeight
            if !visibleRect.contains(buttonOrigin) {
                let scrollPoint = CGPoint(x: 0.0, y: buttonOrigin.y - visibleRect.size.height + buttonheight)
                scrollView.setContentOffset(scrollPoint, animated: true)
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        scrollView.setContentOffset(CGPoint.zero, animated: true)
    }
    
}



//MARK: UITextfield Delegate Handler
extension SearchViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ scoreText: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}

