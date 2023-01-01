# internship_final_recipes

Create application
Stack of technologies:
•	Flutter
•	BloC
•	Firebase - Firestore / Realtime database  
•	REST API networking
•	connectivity
•	Stream API
•	Future API
•	RxDart (optional)
•	Localization (App should support Ru and En language)
•	Android build (IOS build - optional)
•	Platform channel
Screens Splash screen
Should contain an animated logo. When animation has been completed, user should be navigated to main screen. You can choose any animation logo from the Google. 
Lottie animation for instance 
Recipe screen  internet connection
Contain:
•	Appbar with app name and menu icon
•	Search field
•	List of recipes
•	Save btn
•	Dropdown for sort recipes by calories (from max to min / from min to max)
•	The request should occur automatically when entering characters in the field.   
•	Duration between each requests should be 500 ms.
•	Show loading indicator when request is processing.
•	Save btn -> save data to firestore or realtime database.
•	Press on recipe item -> go to Recipe detail screen (use Hero animation on recipe image for transition)
•	Recipe item should include food image, title, amount of calories.
•	Use Dismissible widget for delete item (optional)https://www.youtube.com/watch?v=iEMgjrfuc58
•	Menu icon should consist two items “History and About’’
•	History item -> go to the History screen
•	About item -> show app version(Use Animation for display it) Widget Should appear from the bottom and disappear after 5 sec.
(You should get version through the Flutter Channels, use flutter animations)

Use this API:
https://developer.edamam.com/edamam-docs-recipe-api
You should create application and use app_key and app_id for make search request.
Example:
"https://api.edamam.com/search?q=SEARCH_TEXT&app_id=${YOUR_APP_ID}&app_key=${YOUR_APP_KEY}

Which fields we should use:

Without internet connection
•	Hide Save btn
•	Show Dialog or SnackBar “No internet connection”
2) History screen.
   Contain:
   •	Appbar with back btn and name of app.
   •	Dropdown for sort (calories)
   •	List of last saved results (list the same)

User should go to Recipe detail screen by press on item.




3) Recipe detail screen.
   Consist:
   •	Food image
   •	List of ingredients

You should use SliverAppBar widget.
For instance https://www.youtube.com/watch?v=R9C5KMJKluE  
