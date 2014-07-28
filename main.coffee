
if Meteor.isClient
	Template.index.helpers
		helloMeteor: "Hello, Youtube APIs!"
		meteorIsGreat: "Meteor is great!"
	

	Meteor.startup ->
		
		Meteor.call "getMeteorIsSoNice", "c3h3", (error,result) ->
			if error
				alert error
			else
				$("#meteorIsSoNice").html result 

if Meteor.isServer
	Meteor.methods
		getMeteorIsSoNice: (who) ->
			"Meteor is so nice! ~~ " + who