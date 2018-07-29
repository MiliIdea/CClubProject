//
//  EditProfileViewController.swift
//  CClub
//
//  Created by MehrYasan on 7/7/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import UIKit
import DCKit
import MapKit
import UICheckbox_Swift
import CoreLocation
import PersianDatePicker


class EditProfileViewController: UIViewController {

    var locationManager : CLLocationManager = CLLocationManager()
    
    @IBOutlet var topNavigationLabel: UILabel!
    
    //third page
    @IBOutlet var finalView: UIView!
    @IBOutlet var scoreYekanLabel: UILabel!
    @IBOutlet var scoreDahganLabel: UILabel!
    @IBOutlet var invitationCodeButton: DCBorderedButton!
    
    //second page
    @IBOutlet var locationView: UIView!
    @IBOutlet var map: MKMapView!
    
    //firstPage
    @IBOutlet var firstViewScroller: UIScrollView!
    @IBOutlet var viewInScroller: UIView!
    @IBOutlet var name: DCBorderedTextField!
    @IBOutlet var familyName: DCBorderedTextField!
    @IBOutlet var tel: DCBorderedTextField!
    @IBOutlet var address: DCBorderedTextField!
    @IBOutlet var email: DCBorderedTextField!
    @IBOutlet var nationalCode: DCBorderedTextField!
    @IBOutlet var birthdate: DCBorderedTextField!
    
    @IBOutlet var singleCheckbox: UICheckbox!
    @IBOutlet var marriedCheckbox: UICheckbox!
    
    @IBOutlet var marriedView: UIView!
    @IBOutlet var marriedDate: DCBorderedTextField!
    @IBOutlet var firstChild: DCBorderedTextField!
    @IBOutlet var secondChild: DCBorderedTextField!
    @IBOutlet var sex: DCBorderedTextField!
    @IBOutlet var firstNextButton: DCBorderedButton!
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestAlwaysAuthorization()
        setStep(0)
        firstViewScroller.contentSize.height = viewInScroller.frame.height
        setData()
        if(locationManager.location != nil){
            let center = CLLocationCoordinate2D(latitude: (self.locationManager.location?.coordinate.latitude)!, longitude: (self.locationManager.location?.coordinate.longitude)!)
            let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
            self.map.setRegion(region, animated: true)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    //sevomin accept
    @IBAction func copyInvitationCode(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    //dovomin accept
    @IBAction func acceptAndResume(_ sender: Any) {
        callEditProfile()
    }
    
    //avalin accept
    @IBAction func firstAcceptAndResume(_ sender: Any) {
        setStep(1)
    }
    
    func callEditProfile(){
        MyRequests.editProfile(vc: self, lastName: self.familyName.text, birthdate: self.birthdate.text, address: self.address.text, secondChildBD: self.secondChild.text, latitude: map.centerCoordinate.latitude.description, sex: "0", firstChildBD: self.firstChild.text, nationalId: self.nationalCode.text, firstName: self.name.text, phoneNumber: self.tel.text, email: self.email.text, anniversary: self.marriedDate.text, longitude: map.centerCoordinate.longitude.description){res in
            self.navigationController?.popViewController(animated: true)
//            self.setStep(2)
        }
    }
    
    
    func setStep(_ page : Int){
        firstViewScroller.alpha = 0
        locationView.alpha = 0
        finalView.alpha = 0
        if(page == 0){
            topNavigationLabel.text = "مشخصات فردی"
            firstViewScroller.alpha = 1
        }else if(page == 1){
            topNavigationLabel.text = "موقعیت جغرافیایی"
            locationView.alpha = 1
        }else if(page == 2){
            topNavigationLabel.text = "دریافت کد و امتیاز"
            finalView.alpha = 1
        }
    }
    
    @IBAction func dismissTap(_ sender: Any) {
        self.view.viewWithTag(55)?.removeFromSuperview()
        self.view.viewWithTag(56)?.removeFromSuperview()
        self.view.viewWithTag(57)?.removeFromSuperview()
        self.view.viewWithTag(58)?.removeFromSuperview()
        self.view.viewWithTag(60)?.removeFromSuperview()
        self.view.endEditing(true)
    }
    
    func setData(){
        
        self.name.text = App.getProfileRes?.person?.firstName
        self.familyName.text = App.getProfileRes?.person?.lastName
        self.tel.text = App.getProfileRes?.mobile
        self.address.text = App.getProfileRes?.person?.address
        self.email.text = App.getProfileRes?.person?.email
        self.nationalCode.text = App.getProfileRes?.person?.nationalId
        self.birthdate.text = App.getProfileRes?.person?.birthDate
        //is it single
        if(App.getProfileRes?.person?.maritalStatus == nil || App.getProfileRes?.person?.maritalStatus == 0){
            setSingle("")
        }else{
            setMarried("")
            marriedView.alpha = 1
            marriedDate.text = App.getProfileRes?.person?.anniversary
            firstChild.text = App.getProfileRes?.person?.firstChildBirthDate
            secondChild.text = App.getProfileRes?.person?.secondChildBirthDate
        }
        if(App.getProfileRes?.person?.sex == 0){
            sex.text = "مرد"
        }else{
            sex.text = "زن"
        }
        
    }
    

    @IBAction func birthdateClick(_ sender: Any) {
        self.dismissTap("")
        let v : UIView = .init(frame: self.view.frame)
        v.backgroundColor = UIColor.black
        v.alpha = 0.2
        v.tag = 60
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.dismissTap(_:)))
        v.isUserInteractionEnabled = true
        v.addGestureRecognizer(tap)
        self.view.addSubview(v)
        let persianDatePicker = PersianDatePickerView(frame: CGRect(x: self.view.frame.width / 2 - 135, y: self.view.frame.height / 2 - 135, width: 270, height: 270))
        persianDatePicker.backgroundColor = UIColor.white
        persianDatePicker.tag = 55
        self.view.addSubview(persianDatePicker)
        persianDatePicker.onChange = { (year, month, day) in
            self.birthdate.text = "\(year)/\(month)/\(day)"
        }
    }
    
    
    @IBAction func marriedDateClick(_ sender: Any) {
        self.dismissTap("")
        let v : UIView = .init(frame: self.view.frame)
        v.backgroundColor = UIColor.black
        v.alpha = 0.2
        v.tag = 60
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.dismissTap(_:)))
        v.isUserInteractionEnabled = true
        v.addGestureRecognizer(tap)
        self.view.addSubview(v)
        let persianDatePicker = PersianDatePickerView(frame: CGRect(x: self.view.frame.width / 2 - 135, y: self.view.frame.height / 2 - 135, width: 270, height: 270))
        persianDatePicker.backgroundColor = UIColor.white
        persianDatePicker.tag = 56
        self.view.addSubview(persianDatePicker)
        persianDatePicker.onChange = { (year, month, day) in
            self.marriedDate.text = "\(year)/\(month)/\(day)"
        }
    }
    
    @IBAction func firstChildClick(_ sender: Any) {
        self.dismissTap("")
        let v : UIView = .init(frame: self.view.frame)
        v.backgroundColor = UIColor.black
        v.alpha = 0.2
        v.tag = 60
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.dismissTap(_:)))
        v.isUserInteractionEnabled = true
        v.addGestureRecognizer(tap)
        self.view.addSubview(v)
        let persianDatePicker = PersianDatePickerView(frame: CGRect(x: self.view.frame.width / 2 - 135, y: self.view.frame.height / 2 - 135, width: 270, height: 270))
        persianDatePicker.backgroundColor = UIColor.white
        persianDatePicker.tag = 57
        self.view.addSubview(persianDatePicker)
        persianDatePicker.onChange = { (year, month, day) in
            self.firstChild.text = "\(year)/\(month)/\(day)"
        }
    }
    
    @IBAction func secondChildClick(_ sender: Any) {
        self.dismissTap("")
        let v : UIView = .init(frame: self.view.frame)
        v.backgroundColor = UIColor.black
        v.alpha = 0.2
        v.tag = 60
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.dismissTap(_:)))
        v.isUserInteractionEnabled = true
        v.addGestureRecognizer(tap)
        self.view.addSubview(v)
        let persianDatePicker = PersianDatePickerView(frame: CGRect(x: self.view.frame.width / 2 - 135, y: self.view.frame.height / 2 - 135, width: 270, height: 270))
        persianDatePicker.backgroundColor = UIColor.white
        persianDatePicker.tag = 58
        self.view.addSubview(persianDatePicker)
        persianDatePicker.onChange = { (year, month, day) in
            self.secondChild.text = "\(year)/\(month)/\(day)"
        }
    }
    
    
    @IBAction func setSingle(_ sender: Any) {
        singleCheckbox.isSelected = true
        marriedCheckbox.isSelected = false
        marriedView.alpha = 0
        sex.frame.origin.y = marriedView.frame.origin.y
        firstNextButton.frame.origin.y = sex.frame.origin.y + sex.frame.height + 14
    }
    
    @IBAction func setMarried(_ sender: Any) {
        singleCheckbox.isSelected = false
        marriedCheckbox.isSelected = true
        marriedView.alpha = 1
        sex.frame.origin.y = marriedView.frame.origin.y + marriedView.frame.height + 14
        firstNextButton.frame.origin.y = sex.frame.origin.y + sex.frame.height + 14
    }
    
    
    
}











































