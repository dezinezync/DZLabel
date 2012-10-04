// This is a test harness for your module
// You should do something interesting in this harness 
// to test out the module and to provide instructions 
// to users on how to use it by example.


// open a single window
var win = Ti.UI.createWindow({
	backgroundColor:'white'
});
var label = Ti.UI.createLabel({
	top: 20
});
win.add(label);
win.open();

// TODO: write your module tests here
var dzlabel = require('com.dzlabel');
Ti.API.info("module is => " + dzlabel);

label.text = dzlabel.example();

Ti.API.info("module exampleProp is => " + dzlabel.exampleProp);
dzlabel.exampleProp = "This is a test value";

var foo = dzlabel.createView({
  "color":"red",
  "width":20,
  "height":20
});

win.add(foo);
