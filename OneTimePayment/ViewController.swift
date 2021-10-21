//
//  ViewController.swift
//  OneTimePayment
//
//  Created by David Taddese on 19/10/2021.
//

import UIKit
import Stripe
import Alamofire


class ViewController: UIViewController {
    
    var productstackview = UIStackView()
    var paymentstackview = UIStackView()
    var productimageview = UIImageView()
    var productlabel = UILabel()
    var paybutton = UIButton()
    var loadingspinner = UIActivityIndicatorView()
    var outputtextview = UITextView()
    var paymenttextfield = STPPaymentCardTextField()
    
    var backendURL : String = "https://apppayment2.herokuapp.com/"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
        
        // Setup some UI buttons and labels
        // setup STPPaymentcardtextfield from stripe-ios
        
    }
    
    func setUpUI(){ // setups different uielements by adding to stackview/ view controller
        setupproducimage()
        setupproductlabel()
        setuploadingspinner()
        setuppaymenttextfield()
        setuppaybutton()
        setupoutputview()
        
        self.productstackview.frame = CGRect(x:0 , y: 70 , width: 330, height: 150)
        self.productstackview.center.x = self.view.center.x
        self.productstackview.alignment = .center
        self.productstackview.axis = .vertical
        self.productstackview.distribution = .equalSpacing
        
        
        self.productstackview.addArrangedSubview(self.productimageview)
        self.productstackview.setCustomSpacing(10, after: self.productimageview)
        self.productstackview.addArrangedSubview(self.productlabel)
        
        self.view.addSubview(self.productstackview)
        
        
        self.paymentstackview.frame = CGRect(x: 0 , y: 260, width: 300 , height: 100)
        self.paymentstackview.center.x = self.view.center.x
        self.paymentstackview.alignment = .fill
        self.paymentstackview.axis = .vertical
        self.paymentstackview.distribution = .equalSpacing
        
        self.paymentstackview.addArrangedSubview(self.paymenttextfield)
        self.paymentstackview.addArrangedSubview(self.paybutton)
        
        self.view.addSubview(self.paymentstackview)
        
    }
    
    func setupproducimage(){
        self.productimageview = UIImageView(frame: CGRect(x: 50, y : 50, width: 275, height: 200))
        self.productimageview.image = UIImage(named: "book")
        self.productimageview.contentMode = .scaleAspectFit
    }
    
    func setupproductlabel(){
        self.productlabel.frame = CGRect(x:0, y: 270, width: self.view.frame.width, height: 50)
        self.productlabel.text = "buy a book"
        self.productlabel.textAlignment = .center
    }
    
    func setupoutputview(){
        self.outputtextview.frame = CGRect(x: 0 , y : 420, width: self.view.frame.width - 50 , height: 100)
        self.outputtextview.center.x = self.view.center.x
        self.outputtextview.textAlignment = .left
        self.outputtextview.font = UIFont.systemFont(ofSize: 18)
        self.outputtextview.text = ""
        self.outputtextview.layer.borderColor = UIColor.purple.cgColor
        self.outputtextview.layer.borderWidth = 1.0
        self.outputtextview.isEditable  = false
        
        self.view.addSubview(self.outputtextview)
    }
    
    func setuppaymenttextfield(){
        self.paymenttextfield.frame = CGRect(x: 0 , y: 0 , width: 330, height: 60)
    }
    
    func setuppaybutton(){
        self.paybutton.frame = CGRect(x : 60, y: 480 , width: 150, height: 40)
        self.paybutton.setTitle("sumbit payment", for: .normal)
        self.paybutton.setTitleColor(UIColor.white, for: .normal)
        self.paybutton.layer.cornerRadius  = 5.0
        self.paybutton.backgroundColor = UIColor.init(red: 50/225, green: 50/225, blue: 93/255, alpha: 1.0)
        self.paybutton.layer.borderWidth = 1.0
        self.paybutton.addTarget(self, action: #selector(pay), for: .touchUpInside)
    }
    
    func setuploadingspinner(){
        self.loadingspinner.color = UIColor.darkGray
        self.loadingspinner.frame = CGRect(x: 0, y :360, width: 25, height: 25)
        self.loadingspinner.center.x = self.view.center.x
        
        
        self.view.addSubview(self.loadingspinner)
    }
    func startloading(){
        DispatchQueue.main.async {
            self.loadingspinner.startAnimating()
            self.loadingspinner.isHidden = false
        }
    }
    
    func stoploading(){
        DispatchQueue.main.async {
            self.loadingspinner.stopAnimating()
            self.loadingspinner.isHidden = true
        }
    }
    func displayStatus(_ message:String){
        DispatchQueue.main.async {
            self.outputtextview.text! += message + " \n"
            
            self.outputtextview.scrollRangeToVisible(NSMakeRange(self.outputtextview.text.count - 1 , 1))
        }
    }
    
    //buttons actions
    
    
    @objc func pay(){
        //1) create payment intent
        //2) confirm the paymentInten
        // MAKE A POST REQUEST USING ALOMFIRE
        }
        
        
    }
    


