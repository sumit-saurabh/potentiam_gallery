# potentiam_gallery

Mobile - Flutter Challenge

## Getting Started

1. Architecture:
I've used Clear Architecture with BLoc pattern. Earlier, I thought of using MVVM pattern using rxdart but as per the problem statement, stick to BLoc only. 

We can use View model (Reactive) Pattern approach rather than Bloc Pattern for complex use-case
Cons of Using Bloc:
- Boilerplate code
- Too many Event and States for complex view
- One to one mapping of event and state
- Communication between multiple blocs add up more confusion. (Maintainability issue)

Note: I have just added the view model support as well in the project, in order to use it, use viewmodel provier and stream builder in the view.


2. Data Layer and Remote Communication:
I've used Dio library and Retrofit for the network communication. Used Curl Interceptor in Dio just for the logging and testing the network calls.


3. Dependency Injection:
All the layers of Clean Arch. supports dependency injection. I've created modules which provides view model / blocs after injecting the right dependencies to the class.


4. How to Build:
- To Build the APK, use the command 
flutter build apk lib/main.dart 

- To Test it in the web, run the command
flutter run -d chrome --web-renderer html 

- To generate a production build for web, run the command
flutter build web --web-renderer html --release

5. How to Test:
a. Install the apk on the Android Device or open the web app. Make sure the device has the internet.
b. It will load the list of albums. Tap on the album to see its photos.
c. On List Albums view, in the Text Input view, enter the proper album name and hit Search button to search the Album.


6. Widget Testing:
Test file name - potentiam_gallery/test/widget_test.dart

I've created 4 test cases to test AlbumRow, AlbumPhotoRow, AlbumFilter Widgets

How to test:
- Go to the project root
- Run the command: 
flutter test test/widget_test.dart

7. Improvements:
- We can improve the filter functionalities by the local search on the fetched albums list
- We can support features like - type ahead and show suggestions while typing
- We can use MVVM pattern for the complex projects for better management of the states.


8. Screen recordings:
https://drive.google.com/file/d/1F7bEEis_eSjHNC94wZ2uTVIyndTpCClV/view?usp=sharing


