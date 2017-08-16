# TouchIDAuthetication
This custome cordova plugin is used for  ios device authentication using Touch ID fingerprint Native API of apple.


Steps to use this custom plugin in to your ionic 2 based projects 

   1:- download this whole projects & copy the CDVTouchID folder and paste it anywhere   in your local machine.
	 2:- Now open your alerady created ionic 2 based projects in which you want to use this TouchID custom plugin.
	 3:- Now add this pulgin in your ionic 2 projects using this command :"ionic cordova plaugin add {local path of your CDVTouchID folder in your machine }"
	 4:-Now it's rady to use in your .ts file directly 
	 
	 
	 
How to use this custom plugin in Your .ts file like:-


import { Component } from '@angular/core';

import { NavController } from 'ionic-angular';



declare var CDVTouchID: any;
@Component({
  selector: 'page-home',
  templateUrl: 'home.html'
})
export class HomePage {

  constructor(public navCtrl: NavController) {

  }

// this is the button for checking the device is able to do TouchID authenticate or not 

  checkTouchID() {
    console.log('isAvailable');
    
    CDVTouchID.isAvailable(isAvailableSuccess,isAvailableError);
    function isAvailableSuccess(result) {
      window.alert("Fingerprint available");
    }
    function isAvailableError(message) {
       window.alert(message);      
    }
        
  }

// this is the button for checking the user Touch ID authetication with alerady stored device fingerPrint Authentication 

  TouchIDAutheticate() {

    console.log('authenticate');
    
    CDVTouchID.authenticate({
      clientId: "Fingerprint-Demo", 
    },successCallback,errorCallback);   
    
    function successCallback(){
     window.alert("Authentication successfull");
      //this.presentAlert('Touch ID Demo','Yeah ! yes your fingerprint is matched with device stored finger')
    
    }

    function errorCallback(err){
      window.alert("Authentication invalid " + err);
      //this.presentAlert('Touch ID Demo',"Authentication invalid" + err)
      
    }
  }
