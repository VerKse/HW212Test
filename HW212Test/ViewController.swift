//
//  ViewController.swift
//  HW212
//
//  Created by Вера Ксенофонтова on 01.12.2020.
//

import UIKit

class ViewController: UIViewController {
    
    var systemCondition = -1
    
    var redView: UIView = {
        var newView = UIView()
        newView.backgroundColor = .red
        newView.translatesAutoresizingMaskIntoConstraints = false
        newView.layer.cornerRadius = 30
        NSLayoutConstraint.activate([
            newView.widthAnchor.constraint(equalToConstant: 60),
            newView.heightAnchor.constraint(equalToConstant: 60)
        ])
        return newView
    }()
    
    var yellowView: UIView = {
        var newView = UIView()
        newView.backgroundColor = .yellow
        newView.translatesAutoresizingMaskIntoConstraints = false
        newView.layer.cornerRadius = 30
        NSLayoutConstraint.activate([
            newView.widthAnchor.constraint(equalToConstant: 60),
            newView.heightAnchor.constraint(equalToConstant: 60)
        ])
        return newView
    }()
    
    var greenView: UIView = {
        var newView = UIView()
        newView.backgroundColor = .green
        newView.translatesAutoresizingMaskIntoConstraints = false
        newView.layer.cornerRadius = 30
        NSLayoutConstraint.activate([
            newView.widthAnchor.constraint(equalToConstant: 60),
            newView.heightAnchor.constraint(equalToConstant: 60)
        ])
        return newView
    }()
    
    var button: UIButton = {
        var newButton = UIButton()
        newButton.backgroundColor = .systemBlue
        newButton.setTitle("Start", for: .normal)
        newButton.translatesAutoresizingMaskIntoConstraints = false
        newButton.layer.cornerRadius = 10
        NSLayoutConstraint.activate([
            newButton.widthAnchor.constraint(equalToConstant: 200),
            newButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        newButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return newButton
    }()
    
    var stackView: UIStackView = {
        var newStack = UIStackView()
        newStack.translatesAutoresizingMaskIntoConstraints = false
        newStack.axis = .vertical
        newStack.distribution = .equalSpacing
        newStack.alignment = .center
        return newStack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stackView.addArrangedSubview(redView)
        stackView.addArrangedSubview(yellowView)
        stackView.addArrangedSubview(greenView)
        
        view.addSubview(button)
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            stackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
        ])
        
    }
    
    @objc func buttonAction(sender: UIButton!) {
        switch systemCondition {
        case 0:
            redView.alpha = 0.5
            yellowView.alpha = 1
            systemCondition = 1
        case 1:
            yellowView.alpha = 0.5
            greenView.alpha = 1
            systemCondition = 2
        case 2:
            greenView.alpha = 0.5
            redView.alpha = 1
            systemCondition = 0
        default:
            yellowView.alpha = 0.5
            greenView.alpha = 0.5
            button.setTitle("Next", for: .normal)
            systemCondition = 0
        }
        
    }
}

