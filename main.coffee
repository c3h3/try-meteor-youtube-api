
if Meteor.isClient
	Template.index.helpers
		helloMeteor: "Hello, Youtube APIs!"
		meteorIsGreat: "Meteor is great!"
	

	Template.index.events
		"change input": (e) ->
			yUserId = $(e.target).val()
			Meteor.call "getYoutubeUserData", yUserId, "json", (error, result) ->
				$("#searchResults").html result



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

		getYoutubeUserData: (yUserId, resType) ->
			if resType == "json"
				Meteor.http.get("https://gdata.youtube.com/feeds/users/" + yUserId, {params:{"alt":"json"}}).content
			else
				Meteor.http.get("https://gdata.youtube.com/feeds/users/" + yUserId).content