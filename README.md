Active model application
===============
This application resolve the challenge by the next points:
1. Create a form asking for the params (uid, pub0 and page)
2. Make the request to the API passing the params and the authentication hash
3. Get the result from the response.
4. Check the returned hash to check that it’s a real response (check signature)
5. Render the offers in a view (ERB or HAML)


1) In this simple application I disable Active Record and Have used only ActiveModel because we do not need to use database.
2) The second Point I have used ActiveModel Serializer it is not necessary in this case, we should use jbuilder probably or another serialization
for simply but for me ActiveModelSerializer is easy to understand and code cleaning.
