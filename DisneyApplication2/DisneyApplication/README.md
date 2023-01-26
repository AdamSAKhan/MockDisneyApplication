# Disney Character Dictionary Application

## The iOS application displays a list of Disney characters along with additional information.

** Last updated Tuesday 24/January/2022.

**Technologies Used**

The technologies used within this project are:
*XCode 14.2
*iOS 16.2
*SwiftUI
*UIKit 

The database of Disney characters is acquired by completing a successful API call to https://api.disneyapi.dev/characters.

**The Disney character List Page (Navigates to details page)**

*The first page uses SwiftUI to display the name of the Disney characters using a list view. 
*The subviews use MVC architeccture due to their simplicity, whilst the final Coordinator View uses MVVM architecture due to the added complexity of the view (navigation, managing netowrk calls and search functionallities).
*The on tap gesture of an item within the List navigates the page using a NavigationStack to a new view (Details page discussed later).
*Users can search the list for characters matching their input. The list automatically updates to search for texts containing their search prefix
*If the list is empty the text "Sorry, there are no characters." is presented on the screen.
*Error catching in CoordinatorVM updates the Coordinator view that that an error occurs.
*Bug in list, seperator line appears twice on RHS making the line bold.  

**Details page**

*Presents the character image along with their details and name
*Created using UIKit with MVC architecture, that are then converted to Swiftui using UIViewRepresentables
*If the image cannot be loaded a default triangle image is presented on the screen. 

##Developer Notes

**Network Layer**

The network layer creates a Request object that is later used make API calls within the CoordinatorViewModel class.
 

**Tests**

*Controller test cases tests whether the filtering capapbillities of the CoordinatorViewModel (sortCharacterByName(_ name: String))
*Network test cases are contained within DisneyApplicationTests and tests responses for status codes 404, 502 and 200.
*Character details init method is tested in CharacterDetailsTests class. 


