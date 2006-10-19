<!--- 	
Define special patterns to match against the URL. Each route is a structure and should follow this format:
	
<cfset route(	pattern="controller/action/:id",	# Set the pattern
				controller="controller_name",		# Set the controller
				action="action_name" )>				# Set the action

For the above example, when Wheels sees a URL that matches the above pattern
(three directories, the first named "controller" and the second named "action")
it would actually call the "controller_name" controller, the "action_name" method 
inside that controller, and create a request.params.id variable
that contains the value of the ":id" placeholder in the URL (the third directory).
The default is "id" but you could make this whatever you wanted.  For example, if you were 
working on a blog and wanted the date built into the URL, you could create a route like:

<cfset route(	pattern="blog/entry/:year/:month/:day",
				controller="blog",
				action="entry" )>

So that when a user goes to http://www.cfwheels.com/blog/entry/2005/11/06 the params
structure will have three variables available (year, month and day) and they will be set to
whatever was in the the :year, :month and :day placeholders in the URL.  You could then use
these in your controller to get only blog entries for that day

By the way, what's with the : syntax?  In the Ruby programming language, any variable 
starting with a : is a symbol. Symbols are just like strings but they always point to 
the same place in memory and are therefore more efficient.  They don't work that way 
here in ColdFusion, but they make a good variable marker without worrying about where 
to put quotes and stuff
--->

<!--- CUSTOM ROUTES GO HERE (they will be checked in order) --->

<!--- If nothing else matches, fall back to the standard routes (you probably shouldn't edit these) --->

<cfset route(":controller/:action/:id")>
<cfset route(":controller/:action")>
<cfset route(":controller")>

<!--- 	
When you're ready to have your root index file (the page that currently says 
"ColdFusion is on Wheels!") point to an actual page in your app, delete /index.cfm 
in the root of your app and uncomment the route below. Then change the "controller" 
and "action" parameters from "say" and "hello" to whatever you want in your real app.
Make sure this is the last route in this file so that it's only called when nothing
else matches.
--->

<!---
<cfset route(pattern="",controller="say",action="hello")>
--->