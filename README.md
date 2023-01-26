# MockDisneyApplication

## The iOS application displays a list of Disney characters along with additional information.

**Last updated Tuesday 24/January/2022.**

**Technologies Used**

The technologies used within this project are:
*XCode 14.2
*iOS 16.2
*SwiftUI
*UIKit 

The database of Disney characters is acquired by completing a successful API call to https://api.disneyapi.dev/characters.

**The Disney character List Page (Navigates to details page)**

The first page uses SwiftUI to display the name of the Disney characters using a list view. 
The subviews use MVC architeccture due to their simplicity, whilst the final Coordinator View uses MVVM architecture due to the added complexity of the view (navigation, managing netowrk calls and search functionallities).
The on tap gesture of an item within the List navigates the page using a NavigationStack to a new view (Details page discussed later).
Users can search the list for characters matching their input. The list automatically updates to search for texts containing their search prefix
If the list is empty the text "Sorry, there are no characters." is presented on the screen.
Error catching in CoordinatorVM updates the Coordinator view that that an error occurs.
Bug in list, seperator line appears twice on RHS making the line bold.  
Images are stored in local cache 

![simulator_screenshot_67F2BDE2-4F10-48E2-AFD1-BAF1C13D7CAE](https://user-images.githubusercontent.com/115171961/214914749-d1f7d587-f680-4f34-ad0c-310e153f07d7.png)

**Details page**

Presents the character image along with their details and name
Created using UIKit with MVC architecture, that are then converted to Swiftui using UIViewRepresentables
If the image cannot be loaded a default triangle image is presented on the screen.
Images are stored in local cache  
![simulator_screenshot_76DD4478-AA51-448B-8461-9902BA700BFE](https://user-images.githubusercontent.com/115171961/214915139-da6295e8-51f0-45de-94d2-495a5a26617d.png)

## Developer Notes

**Network Layer**

The network layer creates a Request object that is later used make API calls within the CoordinatorViewModel class.
 

**Tests**

NetworkApi tests uses a MockNetworkSession() to test the response
ViewModelTests uses a MockDataService to test functionality
DataServices tests uses a FakeNetworkApiClient for testing

**Future Work**
Add pagination to the nextworkmanager, MainCharacterListViewModel and MainCharacterView (additional loading cases required for view) so that additional (infinite scrolling ) can occur.  

