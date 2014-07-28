
if Meteor.isClient
	Template.main.helpers
		helloMeteor: "Hello, Youtube APIs!"
	
	Meteor.startup ->
		$("#meteorIsGreat").html("Meteor is great!")

		Meteor.call "getMeteorIsSoNice", "c3h3", (error,result) ->
			if error
				alert error
			else
				$("#meteorIsSoNice").html(result)




if Meteor.isServer
	Meteor.methods
		getMeteorIsSoNice: (who) ->
			"Meteor is so nice! ~~ " + who