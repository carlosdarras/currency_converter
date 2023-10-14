# Currency Converter

**A currency converter is a handy online tool or mobile app that allows you to quickly and easily convert one currency into another. It provides real-time exchange rates and helps users to understand the value of money in different countries.**



# Instruction

  To install a Currency Converter project from GitHub, you can follow these steps:

### Prerequisites

- Make sure you have Flutter and Dart installed on your system. If not, you can install them by following the official Flutter installation guide:
  [Flutter SDK](https://flutter.dev/docs/get-started/install).
- Verify that you have the necessary dependencies for your specific development platform (e.g., **Android Studio** or **Xcode** for mobile app development).
- Ensure you have Git installed on your system. You can download Git from [Git](https://git-scm.com/downloads).

### Installation Steps:

- Open your terminal or command prompt.
- Navigate to the directory where you want to install the software or set up the environment.
- Use the `git clone https://github.com/carlosdarras/currency_converter.git` command to clone the GitHub repository.
- Change your working directory to the newly cloned repository: `cd currency_converter`.
- Install the project dependencies using the following command. This will download all the required packages and libraries: `flutter pub get`.
- run project with `flutter run` This command will build and run the Flutter app on your selected platform.



# BLoC Design Pattern

### Introduction

The **BLoC (Business Logic Component) design pattern** is a robust architectural approach for building Flutter applications. It's designed to *enhance* the *scalability* and *maintainability* of applications by **separating business logic from the presentation layer**. This README provides an overview of the BLoC pattern, why you should consider using it, and how to adapt it to suit the specific requirements of your application.

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

An extension of the original `country_flags` package, this Flutter package allows you to easily load country flags as image. 
It simplifies the process of displaying flags in your Flutter applications.

### Features

- Load country flags as image assets in your Flutter app.
- Fast and lightweight.
- Simple to use.


### Usage
- After get all currencies from api, We got this response for each currency:
  (e.g,`"EUR": {
            "symbol": "€",
            "name": "Euro",
            "symbol_native": "€",
            "decimal_digits": 2,
            "rounding": 0,
            "code": "EUR",
            "name_plural": "Euros"
        }`),

- Then we take first two alphabet of country code (e.g, `EU`).
- Final we got the flag of this country ![rrr]([https://myoctocat.com/assets/images/base-octocat.svg](https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/Flag_of_Europe.svg/1024px-Flag_of_Europe.svg.png)https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/Flag_of_Europe.svg/1024px-Flag_of_Europe.svg.png)



