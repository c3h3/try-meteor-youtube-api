
Router.configure
	layoutTemplate: 'main'


Router.map -> 
	@route "index",
		path: "/"
		template: "index"
		data: ->
			meteorIsGreat: "Meteor is great!"



if Meteor.isClient
	Template.index.helpers
		helloMeteor: "Hello, Youtube APIs!"
	

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