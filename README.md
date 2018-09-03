# Meshenger

*Have you ever been at a festival, trying to message your friends, only to find the network is overloaded? With Meshenger, you have other options. With Meshenger, you're never out of reach. With Meshenger you could be having a pint with your friends right now.*

Meshenger is an iPhone based messaging service that allows registered users to chat to each other in different channels. It can even connect users when there is no internet connection available by allowing user to send messages over Bluetooth and Wi-Fi Direct.  

Meshenger was built over two weeks at Makers Academy  coding bootcamp by [Daniel Jones](https://github.com/danieljonesdmj), [Cornelis Heuperman](https://github.com/heuperman), [Yvonne Tang](https://github.com/YvCodeHong) and [Jay Khan](https://github.com/neobay991), none of which had ever made a mobile app before. Want to know more? You can watch our [final presentation]()(coming soon), read about reflections on the project in our [process log](https://hackmd.io/s/S1yZNbdUm) --- Change to published version or even [follow us on Instagram](https://www.instagram.com/meshenger_coder/).

## Screenshots

![Screenshots](https://i.imgur.com/7ZbqPWE.png)

## Getting started

### Launching the Application
Enter the following commands in your terminal:

- Clone the repository:
`$ git clone https://github.com/neobay991/messenger-app.git`

- Install the required pods using CocoaPods:
`$ sudo gem install cocoapods`
`$ pod install`

- [Install Xcode](https://developer.apple.com/xcode/) if needed, then open the project:
`$ open  messenger-app.xcworkspace`
- To run the Build, press ⌘R (Command + R)

### Advanced: running Meshenger on your iPhone

You will need an [Apple ID](https://appleid.apple.com/) to complete these steps.
- In Xcode, click on the messenger-app folder in the navigation bar. 
- In the main screen, click on General.
- Under Signing, click on team and select your name from the list.
- Under Identity, rename the Budle Identifier to "com.YOURNAME.Meshenger" with YOURNAME being your team name.
- Connect your iPhone to your computer.
- In Xcode, at the top left click on iPhone and select your device at the top of the list.
- Press the play button or hit ⌘R (Command + R) and let Xcode do the rest.

## Technical

### Tech/Frameworks Used
- **Swift** -- as the native app framework  
- **XCode** -- as the IDE  
- **Firebase** -- as the database system   
- **JSQMessageViewController** -- as the messaging framework    
- **Bridgefy** -- as the Mesh networking controller

### How it all fits together

![Diagram](https://i.imgur.com/JQBrc3V.png)
