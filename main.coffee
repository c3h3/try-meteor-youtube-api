
if Meteor.isClient
	Template.main.helpers
		helloMeteor: "Hello, Youtube APIs!"
	
	Meteor.startup ->
		$("#meteorIsGreat").html("Meteor is great!")


