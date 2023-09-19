# OnLearner - Flutter and Firebase Educational Application

## Table of Contents
- [Introduction](#introduction)
- [Features](#features)
- [Technologies Used](#technologies-used)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Introduction

Welcome to the OnLearner Flutter and Firebase Educational Application! This application has been professionally designed to facilitate user validation and personalized data entry, tailored to the needs of different professions. The primary focus of this application is to provide students with access to educational notes and establish a seamless connection with nearby home tutors. This README file provides an overview of the project, installation instructions, and guidelines for usage and contribution.

![Onlearner](https://github.com/Avaneesh8/OnLearner/assets/94730915/09ae7a5a-209f-4a99-bc85-46ffd1ac4a3b)


## Features

### User Authentication
- Secure user registration and login functionality using Firebase Authentication.
- Passwordless authentication via email or phone number.
- Role-based access control for different user types (e.g., student, tutor).

### Personalized User Profiles
- Users can create and edit their profiles with personal information.
- Customized user experiences based on their profession and preferences.

### Educational Notes
- Access to a vast repository of educational notes categorized by subject.
- Users can upload, download, and rate notes.
- Real-time synchronization of notes using Firebase Firestore.
- Search functionality to find specific topics or subjects.

### Home Tutor Connection
- Users can find nearby home tutors based on location.
- Tutors can create profiles with their qualifications, availability, and rates.
- Real-time messaging system for communication between students and tutors using Firebase Realtime Database.

## Technologies Used

- **Frontend**:
  - Flutter for building the cross-platform mobile application
  - Firebase Authentication for user authentication
  - Firebase Firestore for real-time database synchronization
  - Firebase Realtime Database for instant messaging
  - Provider for state management
  - Dio for making HTTP requests

- **Authentication**:
  - Firebase Authentication for user authentication and authorization
  - Role-based access control (RBAC)

## Installation

To run this application locally, follow these steps:

1. Clone the repository to your local machine:
   git clone https://github.com/Avaneesh8/OnLearner.git

2. Navigate to the project directory:
   cd OnLearner

3. Install the Flutter dependencies:
   flutter pub get

4. Create a Firebase project and configure it according to the Firebase setup guidelines.

5. Add the Firebase configuration files to the project:
   - For Android, place the `google-services.json` file in the `android/app` directory.

6. Run the application on your preferred emulator or physical device:
   flutter run

7. Access the application on your mobile device.

## Usage

1. Register for an account or log in using Firebase Authentication.
2. Complete your user profile with relevant information.
3. Explore educational notes, search for specific topics, and download or upload notes.
4. Use the tutor search feature to find nearby home tutors.
5. Communicate with tutors using the built-in real-time messaging system.
6. Enjoy the personalized experience based on your profession and preferences.

## Contributing

Contributions to this project are welcome. To contribute, follow these steps:

1. Fork the repository.
2. Create a new branch for your feature or bug fix.
3. Make your changes and commit them with descriptive commit messages.
4. Push your changes to your fork.
5. Create a pull request to the main repository.

Please ensure your code follows best practices, is well-documented, and passes any existing tests.

## License


This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
