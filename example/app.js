// This is a test harness for your module
// You should do something interesting in this harness
// to test out the module and to provide instructions
// to users on how to use it by example.


// open a single window
var win = Ti.UI.createWindow({
	backgroundColor:'white'
});

// TODO: write your module tests here
var dzlabel = require('com.dzlabel');
Ti.API.info("module is => " + dzlabel);


var urlClicked = function(e) {
	Ti.API.info('url clicked: ' + e.url);
};

//Test cases
var mockData = [];
mockData.push("<b>bold</b> and <i>italic</i> style");
mockData.push("Facebook is a social utility that connects people with friends and others who work , study and live around them. People use Facebook to keep up with friends. And now this is some dummy text for real.");
mockData.push("<a href='http://example.com/'>link</a>");
mockData.push("<font face='HelveticaNeue-CondensedBold' size=20><u color=blue>underlined</u> <uu color=red>text</uu></font>");
mockData.push("<font face='HelveticaNeue-CondensedBold' size=20 color='#CCFF00'>Text with</font> <font face=AmericanTypewriter size=16 color=purple>different colours</font> <font face=Futura size=32 color='#dd1100'>and sizes</font>");
mockData.push("<font face='HelveticaNeue-CondensedBold' size=20 stroke=1>Text with strokes</font>");
mockData.push("<a href='http://dezinezync.com/'>@dezinezync</a>");
/* Test cases below crash the app*/

var tableView = Ti.UI.createTableView({
	selectionStyle: 0
});

var row, foo, data = [];

for(i=0; i<mockData.length; i++) {
	row = Ti.UI.createTableViewRow({
		height: Ti.UI.SIZE, // This needs a better implementation. Maybe get size.height of foo on postlayout and use that for the cell height.
		className: 'row'
	});

		foo = dzlabel.createView({
			width: Ti.UI.FILL, //width must always be defined for this to work. If width is set to SIZE, it doesn't draw.
			height: Ti.UI.SIZE,
			color: 'black',
			backgroundColor: 'transparent',
			text: mockData[i]
		});

		foo.addEventListener('urlClicked', urlClicked);

	row.add(foo);

	data.push(row);

	foo = null; row = null;
}

tableView.setData(data);
data = null;

/* This needs implementation */
/*foo.addEventListener('click', function(e) {
	console.log(e)
});*/

win.add(tableView);

win.open();
