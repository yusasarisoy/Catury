# Catury

Catury is an iOS application developed in Swift that fetches a list of cat breeds from [TheCatAPI](https://thecatapi.com/) and displays them in a visually appealing list using up-to-date common iOS UI practices.

## Table of Contents

- [Problem Description](#problem-description)
- [Solution](#solution)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Usage](#usage)
- [Technical Details](#technical-details)
- [Trade-offs](#trade-offs)
- [Possible Improvements](#possible-improvements)

## Problem Description

The iOS code assessment is to create an iOS application that integrates with [TheCatAPI](https://thecatapi.com/) to fetch a list of cat breeds and display them in a list format. The app should also show an image representing each breed.

## Solution

Catury is built to solve the problem by implementing the following features:

- Integration with TheCatAPI: The app communicates with [TheCatAPI](https://thecatapi.com/) to retrieve a list of cat breeds and associated information. It uses the API endpoints provided by TheCatAPI to fetch the necessary data.

- Fetching and Displaying Cat Breeds: The app sends a request to TheCatAPI to fetch the list of cat breeds. It receives the response in JSON format and parses it to extract the breed names, descriptions and image URLs. The app then displays the list of cat breeds in a visually appealing list using common iOS UI practices.

- Loading and Displaying Breed Images: For each cat breed, the app fetches the corresponding image URL and asynchronously loads the breed image using URLSession and with the help of [AsyncImage](https://developer.apple.com/documentation/swiftui/asyncimage) of [SwiftUI](https://developer.apple.com/xcode/swiftui/). The images are displayed alongside the breed names and descriptions in the list.

- API Key: To access the images, an API key is required and you can get it from the [TheCatAPI](https://thecatapi.com/).

The app follows up-to-date iOS UI practices to provide an intuitive and visually pleasing user interface. It adheres to the guidelines and best practices recommended by Apple for iOS app development.

## Prerequisites

- iOS device or simulator running iOS 15.0 or later.
- Xcode 13.0 or later.
- TheCatAPI API key (available from [TheCatAPI](https://thecatapi.com/)).

## Installation

1. Clone or download the repository.
2. Open the project in Xcode.
3. Locate the `APIConstants.swift` file in the project directory.
4. Replace the placeholder value for the `apiKey` constant with your actual API key obtained from TheCatAPI.
5. Connect your iOS device or choose a simulator.
6. Build and run the application.

## Usage

1. Launch the Catury on your iOS device or simulator.
2. The app will automatically fetch a list of cat breeds from TheCatAPI.
3. Once the data is loaded, you will be presented with a list of cat breeds.
4. Scroll through the list to explore the available cat breeds.
5. Each breed will display an image, name and description representative of that breed.
6. When the app reaches the display limit, the app will fetch the new cats with the help of pagination feature.

## Technical Details

- The app is written in Swift.
- SwiftUI was used as the User Interface framework to take advantage of declarative programming capabilities.
- The app uses networking capabilities to fetch data from TheCatAPI using URLSession.
- The app follows the MVVM architectural pattern for better code organization and separation of concerns.
- Cat breed images, names and descriptions are loaded asynchronously using URLSession.
- SwiftLint has used to enforce Swift style and conventions and keeping the codebase consistent.
- The **Network** layer handles communication with the data sources. It serves as an intermediary between the data consumer and the data sources, shielding the consumer from dealing with the intricacies of manipulating the data. This layer provides flexibility in changing data sources without impacting other components.
- The benefits of Dependency Injection and Protocol Oriented Programming have been leveraged to align with [SOLID principles](https://en.wikipedia.org/wiki/SOLID) and to facilitate the use of mock objects in unit tests.

## Trade-offs

- Simplified UI: The app focuses on displaying cat breeds in a visually appealing list, without additional features like search, filtering, or breed details. This prioritizes simplicity and quick implementation.
- Maintainability and Code Complexity: The choice of architecture, design patterns and the libraries that can be added in the future can affect the maintainability and code complexity of the application. Striking a balance between simplicity and extensibility ensures a manageable and scalable codebase for future enhancements and maintenance.
- Performance vs. Image Quality: Loading breed images involves a trade-off between image quality and performance. Higher resolution images offer better visual quality but can impact loading times and device resources. Choosing an optimal balance based on target audience and device capabilities is important.
- Offline Functionality: Caching the list of cat information can enhance the user experience and allow offline access. However, implementing offline functionality increases app complexity and requires additional storage space.
- Device Compatibility: The app supports a minimum iOS version of 15.0. Choosing iOS versions and device compatibility involves a trade-off. Utilizing the latest iOS features and targeting the latest devices provides an advanced user experience but may limit the user base to specific devices or iOS versions.

## Possible Improvements

- Implement search functionality to allow users to search for specific cat breeds.
- Add a favorites feature that allows users to save their favorite cat breeds for easy access.
- Filter the cats based on the specific filters.
- Add an onboarding module after the app has multiple features. So that the user can easily understand about the capabilities of the app.
- Incorporate additional details for each cat breed
- Add language support. Because in the answer the name and description came in English, I did not add different languages.
- Add CI/CD tool(s) to automate release processes and regularly check the content of commits for a more concise codebase.
- Add a beautiful and pleasant animated splash screen to make the user's first impression and grab their attention.
- Extend the reach of the app by developing versions for other Apple platforms, such as iPad or macOS. This can help you reach a wider audience and ensure a consistent user experience across different Apple devices.
- Expand the app's test coverage by implementing integration tests, behavior driven tests, snapshot tests and UI tests beside unit tests. Continuously test the app for bugs, performance issues, and usability problems to ensure a high-quality user experience.
- Make UI/UX Enhancements continuously to improve the user interface and experience by incorporating modern design principles, animations, and intuitive interactions.
- Add accessibility support to ensure that people with visual impairments can use the app comfortably.
- Implement offline mode functionality to allow users to access previously fetched data and perform certain actions even when there is no internet connection. You can use it Core Data for this feature.
- Enhance error handling by providing meaningful error messages to users when network requests fail or other errors occur.
- Implement crash reporting tools such as Crashlytics to collect crash logs and error reports for easier debugging and issue resolution.
- Implement push notifications to enable proactive communication with users. This could involve sending relevant announcements, or reminders to keep users engaged with the app.
- Provide options for users to personalize their app experience, such as choosing themes, customizing layouts, or setting preferences.
- Add analytics tools to gather data on user behavior, usage patterns, and performance metrics. This can help make useful decisions for future improvements.
- Improve app security to protect user data and ensure secure communication with the backend services. Implement best practices like encryption, secure storage, and secure network connections.
