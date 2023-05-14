# ny_times_app

This is a simple app that hits the NY Times Most Popular Articles API and displays
a list of articles. When an item on the list is tapped, the app shows the details
of the article in a separate view. This is a typical master/detail app.

# Technology

This project uses the following technologies:
- State management: Provider
- HTTP requests: The official Dart package
- Flutter SDK: 3.10
- Dart Version : 3
- Architecture: Clean Architecture

# Installation

To install and run the app, follow these steps:
Clone the repository to your local machine.
Open the project in your preferred IDE or code editor.
- Run flutter pub get to install all dependencies.
- Run flutter run to start the app.

# Usage

When you run the app, you will be presented with a list of articles from the most viewed 
section of the NY Times API. Tap on any article to view its details.

# Architecture

This project follows the principles of Clean Architecture, which promotes separation of concerns and testability. 
The app is divided into three main layers:
- Presentation layer: Contains the UI components and handles user interactions.
- Domain layer: Contains the business logic , without use cases (project is small).
- Data layer: Contains the implementation of data sources, such as APIs or databases.

The layers communicate with each other through interfaces, allowing for easy swapping of implementations 
and testing of individual components.






# Credits

This project was created by [Yaseen Ibrahem]. It uses the following external libraries:

- provider For state management in the app.
- http For making HTTP requests to the NY Times API.
- get_it For dependency injection in the app.
- dartz For functional programming in Dart.
- mockito For mocking dependencies in unit tests.


# Contact

If you have any questions or comments about the project, please contact [Yaseen] at [yaseenibrahem8@gmail.com].




