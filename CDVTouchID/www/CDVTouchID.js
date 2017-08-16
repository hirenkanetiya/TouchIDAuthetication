 var exec = require('cordova/exec');

 var PLUGIN_NAME = 'CDVTouchID'
 // exports.coolMethod = function(arg0, success, error) {
//     exec(success, error, "CDVTouchID", "coolMethod", [arg0]);
// };

	var CDVTouchID = {
	
	isAvailable : function(successCallback ,errorCallback){
	     exec(successCallback,errorCallback,"CDVTouchID","isAvailable",[]);
	     },
	     
authenticate : function(params,successCallback,errorCallback){
    cordova.exec(successCallback,errorCallback,"CDVTouchID","authenticate",[params])
      } 
};

module.exports = CDVTouchID;

// function CDVTouchID() {
// }
// 
//  CDVTouchID.prototype.isAvailable = function (successCallback ,errorCallback) {
//      cordova.exec(successCallback,errorCallback,"TouchID","isAvailable",[]);
// 
//  };
// 
// 
//  CDVTouchID.prototype.authenticate = function(successCallback,errorCallback){
//     cordova.exec(successCallback,errorCallback,"TouchID","authenticate",[])
//  };
// 
// 
// 
// 
// 
// CDVTouchID.install = function () {
//   if (!window.plugins) {
//     window.plugins = {};
//   }
// 
//   window.plugins.touchid = new CDVTouchID();
//   return window.plugins.touchid;
// };
// 
// cordova.addConstructor(CDVTouchID.install);