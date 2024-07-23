//
//  ViewController.swift
//  Xylophone
//
//  Created by Ryan Rouxinol on 13/07/24.
//

import UIKit


class ViewController: UIViewController {
    
    var rectangles: [UIButton] = []
    let buttonActions = ButtonActions()
    let notes = ["C", "D", "E", "F", "G", "A", "B"]
    
    private lazy var backgroundView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "background")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var xyloStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        
        let colors: [UIColor?] = [.redAsset, .orangeAsset, .yellowAsset, .greenAsset, .blueAsset, .sblueAsset, .purpleAsset]

    
        for color in colors {
            let rectangle = UIButton()
            rectangle.backgroundColor = color ?? .clear
            rectangles.append(rectangle)
            stackView.addArrangedSubview(rectangle)
            rectangle.translatesAutoresizingMaskIntoConstraints = false
            
        
        }

        
        return stackView
    }()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
    }

    private func setupView(){
        setHierarchy()
        setConstraints()
        setButtonClick()
    }
    
    private func setHierarchy(){
        view.addSubview(backgroundView)
        view.addSubview(xyloStackView)
        
    }
    
    private func setButtonClick(){
        for (index, rectangle) in rectangles.enumerated() {
            rectangle.tag = index
            rectangle.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        }
    }
    
    @objc private func buttonTapped(_ sender: UIButton) {
        let note = notes[sender.tag]
        buttonActions.buttonTapped(sender, note: note)
    }

    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
            
        ])
        
        NSLayoutConstraint.activate([
            xyloStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            xyloStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            xyloStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            xyloStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15),


        ])
        
        for (index, rectangle) in rectangles.enumerated() {
            NSLayoutConstraint.activate([
                rectangle.leadingAnchor.constraint(equalTo: self.xyloStackView.leadingAnchor, constant: 10*CGFloat(index)),
                rectangle.trailingAnchor.constraint(equalTo: self.xyloStackView.trailingAnchor, constant: -(10*CGFloat(index)))
             ])
        }
        


        
    }
    
}

