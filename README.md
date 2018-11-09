iOS MVc Architecture: Sample App
This repository contains a detailed sample app that implements MVC architecture.

The app basically fetch the NewYorkTimes Most view Articals and shows in UItableView.

Prerequisites: 
Xcode 9+
iOS SDK 11
Latest Xcode Build Tools
Technology used
Clean MVC architecture
URLSession
SDWebImage

The app has following packages:
model: It contains all the data accessing and manipulating components.
view: It contans the view classes like NYTimeArticalListView, NYTimeArticalDetailsView.
Controller: It contains the controllet classes that perfrom actions.
Service Handler: Handel webservice APIs.

Steps to run the app & Test:
Download the project code, preferably using git clone.
Do pod install for  SDWebImage library updates
Check out the relevant code:
Product\Test or Command-U. This actually runs all test classes.
Click the arrow button in the test navigator for each class
Click the diamond button in the gutter each method in class


iOS-TEST COVERAGE REPORT
CMD+U button in Xcode this will generate Code coverage reports into the default derived data directory located at ~/Library/Developer/Xcode/DerivedData and you will see the code coverage reports generated at Logs/Test directory
