# Currency Converter

**A currency converter is a handy online tool or mobile app that allows you to quickly and easily convert one currency into another. It provides real-time exchange rates and helps users to understand the value of money in different countries.**



# Instruction

  To install a Currency Converter project from GitHub, you can follow these steps:

### Prerequisites

- Make sure you have Flutter and Dart installed on your system. If not, you can install them by following the official Flutter installation guide:
  [Flutter SDK](https://flutter.dev/docs/get-started/install).
- Verify that you have the necessary dependencies for your specific development platform (e.g., **Android Studio** or **Xcode** for mobile app development).

### Installation Steps:

- Open your terminal or command prompt.
- Navigate to the directory where you want to install the software or set up the environment.
- Use the `git clone https://github.com/carlosdarras/currency_converter.git` command to clone the GitHub repository.
- Change your working directory to the newly cloned repository: `cd currency_converter`.
- Install the project dependencies using the following command. This will download all the required packages and libraries: `flutter pub get`.
- run project with `flutter run` This command will build and run the Flutter app on your selected platform.



# BLoC Design Pattern

### Introduction

The **[BLoC (Business Logic Component)](https://bloclibrary.dev/#/) design pattern** is a robust architectural approach for building Flutter applications. It's designed to *enhance* the *scalability* and *maintainability* of applications by **separating business logic from the presentation layer**. This README provides an overview of the BLoC pattern, why you should consider using it, and how to adapt it to suit the specific requirements of your application.

### Key Benefits
- **Separation of Concerns**
  BLoC enforces a clear separation of concerns within your codebase, distinguishing three primary components: the User Interface (UI), the BLoC (housing business logic), and the 
  Data Layer (managing data retrieval and storage).

- **Reusability**
  BLoC promotes the reusability of business logic across different parts of your application. A single BLoC can be employed to manage state and logic for various widgets or 
  screens, resulting in more efficient code.

- **Testability**
  By isolating business logic from the UI, BLoC simplifies the process of writing unit tests. Ensuring that your application functions correctly is essential for its reliability 
  and stability, especially as it becomes more complex.

- **Scalability**
  The BLoC pattern is highly scalable, making it well-suited for applications that are expected to grow. You can continuously introduce new BLoCs for different parts of the 
  application while maintaining an organized and manageable codebase.

### Adapting the BLoC Pattern

To leverage the BLoC pattern effectively, you'll need to define your own BLoCs and events tailored to the specific needs of your application. This customization allows you to address the unique requirements of your project while benefiting from the advantages of the pattern.



# `country_flags` Image Loader for Flutter

An extension of the original [`country_flags`](https://pub.dev/packages/country_flags) package, this Flutter package allows you to easily load country flags as image. 
It simplifies the process of displaying flags in your Flutter applications.

### Features

- Load country flags as image assets in your Flutter app.
- Fast and lightweight.
- Simple to use.


### Usage
- After get all currencies from api, We got this response for each currency:
  (e.g,
  `"EUR": {"code": "EUR"}`),

- Then we take first two alphabet of country code (e.g, `EU`).
- Final we got the flag of this country.



# Advantages of using `sqflite` for Local Database
The [`sqflite`](https://pub.dev/packages/sqflite) package is a crucial tool for developers building Flutter applications that require robust local data storage and management. Below are the reasons why you should consider integrating `sqflite` into your project:

### Local Data Persistence
`sqflite` empowers your Flutter application with a reliable local database, enabling you to efficiently store and manage structured data on the device.

### Offline Data Access
Ensure uninterrupted functionality in various network conditions by allowing your app to access and manipulate data even when the device is offline.

### High Performance
Leveraging the SQLite database engine, `sqflite` delivers exceptional data storage and retrieval speeds, making it ideal for small to medium-sized databases used in mobile applications.

### Structured Data Storage
Utilize SQLite's relational database capabilities through `sqflite`, enabling you to define structured data using tables and columns, perfect for complex data models and relationships.

### Querying and Data Manipulation
Harness the power of SQL-based queries provided by `sqflite` to efficiently sort, filter, and aggregate data, enabling diverse data manipulation capabilities within your app.

### Data Security
Enhance data security by encrypting your local database, providing an additional layer of protection for sensitive information stored in your Flutter application.

### Conclusion
integrating the sqflite package into your Flutter application is essential for achieving robust local data storage, offline functionality, and efficient data management. 


# Technologies that using in **Currency Converter** project
- **Postman**
  Postman is likely used for testing and interacting with the API that provides currency exchange rates. It helps in ensuring the correctness of data retrieval.
- **Android Studio**
  Android Studio is a popular integrated development environment (IDE) for Android app development and is used for building the Android version of the Currency Converter.
- **Flutter Framework**
  Flutter is a UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase. It's the core framework used for building the Currency 
  Converter application.
- **[Free Currency Api](https://app.freecurrencyapi.com/dashboard)**
  The project relies on the Free Currency API to obtain up-to-date currency exchange rate data. This API provides the necessary information for currency conversion.





