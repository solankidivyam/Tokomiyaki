# Design Process

A UI design for the project is made in FIGMA. Link here [Figma](https://www.figma.com/file/CfOYxSJXEGT32VU05M2xzH/Hapramp-Assignment?node-id=0%3A1)

# Sneek Peek

<!-- ![Screenshot](Login.png =250x250) -->
<img src="https://github.com/solankidivyam/assignment_ios/blob/main/Login.png" width="310" height="320">

# Description
We are an Icecream company based in Japan, we offer services in Taiwan as well, we will be moving business to North American. So for that we have createdan App in Swift with the help of UIKit and SwiftUI to keep a database for our overseas customers.Our app has Login/Signup screen trough which user can make an account and get started with the world class quality icecream order.

The user will have to login and then click “Get Started”. After that screen a map(made in SwiftUI) will be shown in which user can share the address precisely to where he/she wants us to deliver the world class quality Icecreams. He/She can also logout usin the “Log Out” button and register of login as another user.

Future Scope:
After the map screen User will see the variety of products that we carry at “Tokomayaki”

# CodeBase
We are not using anyking of storyboard
So in order to display viewcontroller we are assigning the LoginController as ROOTVIEWCONTROLLER
Which means that we will see this screen as the main one, after the app starts.

**MVVM** : Future Scope
Model : Defines the schema of the app like what type of data will be stored. Like for example a structure

View : It basically deals with the the UI elements that go on the screen and the placement of the same. Currently it is being shown in the Login View Controller only..

ViewModel : In layman's terms it basically deals with the logic and working of the app in the back. It deals with the connection of the view and the mode.

UIViewController : It deals with all of the MVVM components. It helps the navigation between different screens.
We are using it for all the MVVM, we can easily seperate out the components and place them in different files and UI controller only to
navigate and display the UI..

# Functioning

![Alt Text](https://github.com/solankidivyam/assignment_ios/blob/main/GIF.gif)

# Running
Clone the repo in local machine. 
Choose iPhone 11 or iPhone 12 in simulator.
Press ⌘ + R

