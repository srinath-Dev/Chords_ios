//
//  WelcomeViewController.swift
//  Chords
//
//  Created by Srinath Dev on 19/09/21.
//

import UIKit
import QuartzCore

class WelcomeViewController: UIViewController {
    
    private let signInButton: UIButton = {
        let  button = UIButton()
        button.backgroundColor = .black
        button.setTitle("Sign In with Chords Spotify", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Chords"
        view.backgroundColor = .systemYellow
        view.addSubview(signInButton)
        signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        signInButton.frame = CGRect(x:20, y: view.height-50-view.safeAreaInsets.bottom,
                                    width: view.width-50,
                                    height: 50)
        signInButton.layer.cornerRadius = 10
    }
    
    @objc func didTapSignIn(){
        let vc = AuthViewController()
        vc.completionHandler = { [weak self] success in
            DispatchQueue.main.async {
                self?.handleSignIn(success:success)
            }
            
        }
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    private func handleSignIn(success: Bool){
        //log the user
            guard success else{
                let alert = UIAlertController(title: "Oops", message: "Something went wrong when signing in.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
                present(alert, animated: true)
            return
        }
        
        let mainAppTabBarVC = TabBarViewController()
        mainAppTabBarVC.modalPresentationStyle = .fullScreen
        present(mainAppTabBarVC, animated: true)
        
    }

}
