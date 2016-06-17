// This is a test harness for your module
// You should do something interesting in this harness
// to test out the module and to provide instructions
// to users on how to use it by example.


// open a single window
var win = Ti.UI.createWindow({
	backgroundColor:'white'
});
var label = Ti.UI.createLabel();
label.text = "Click me";
win.add(label);
win.open();


label.addEventListener("click" , function() {
var tiliqpay = require('ti.liqpay');
Ti.API.info("module is => " + tiliqpay);


	var payment = tiliqpay.createPayment({
                                       merchantID:"i73857132827",
                                       phoneNumber:"+380674082207",
                                       amount: "1.00",
                                       currency: "UAH",
                                       payDescription: "опача"

	});
Ti.API.info("payment is => " + payment, JSON.stringify(payment));
payment.pay();
                       payment.addEventListener("error", function(e) {
                                                console.log("error", JSON.stringify(e));
                                                });
                       payment.addEventListener("success", function(e) {
                                                console.log("success", JSON.stringify(e));
                                                });

                     });