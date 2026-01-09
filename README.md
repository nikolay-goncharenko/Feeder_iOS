# Feeder - RSS Post Viewer

<p align="left">
      <img src="https://img.shields.io/badge/Platform-iOS-black?style=for-the-badge&logo=apple" />
      <img src="https://img.shields.io/badge/Language-Swift-orange?style=for-the-badge&logo=swift" />
      <img src="https://img.shields.io/badge/Framework-SwiftUI-blue?style=for-the-badge&logo=swift" />
      <img src="https://img.shields.io/badge/Reactive-Combine-pink?style=for-the-badge" />
      <img src="https://img.shields.io/badge/Architecture-MVI--C-red?style=for-the-badge" />
      <img src="https://img.shields.io/badge/Backend-Firebase-ffca28?style=for-the-badge&logo=firebase&logoColor=black" />
</p>

A high-performance iOS news reader application built with a reactive **MVI-C** architecture, featuring real-time data synchronization via **Firebase** and a custom **SwiftUI** interface.


## 📝 Project Overview

Feeder is designed to provide a seamless news browsing experience. It fetches structured data from Firebase, handles local processing (such as sorting and truncation), and presents it through a declarative UI.

### Key Features:

* **Post Feed:**
    * Dynamic sorting by Date and Rating (processed locally).
    * Smart text truncation: displays only 2 lines of text with a "Read more" toggle for expanding the summary in-line.
    * Maintains server-defined default order until user interaction.
* **Detailed View:**
    * Full post content rendering.
    * Integrated image gallery with asynchronous loading and caching via NukeUI.
    * Relative timestamps (e.g., "6 years ago") for better readability.
* **Core Logic:**
    * **Offline Support**: Data is cached to remain available without an active internet connection.
    * **Error Handling**: Robust navigation and alert logic for missing or deleted posts.


## 🛠 Tech Stack

* **Interface**: SwiftUI (Declarative interface).
* **Architecture**: **MVI-C** (Model-View-Intent + Coordinator) for strict unidirectional data flow.
* **Reactive**: Combine (Used for Firebase subscriptions and Store-Reducer communication).
* **Backend**: Firebase Realtime Database.
* **Navigation**: UIKit `UINavigationController` wrapped for SwiftUI to provide native swipe-back gestures and full stack control.
* **Image Handling**: NukeUI for efficient async image loading and shimmer loading states.


## 🏗 Project Structure

The project is organised into clear functional layers to ensure scalability and maintainability:

```text
📁 Feeder
 ├── 📁 Components   # Reusable UI elements (Buttons, Labels, Cells, Overlays)
 ├── 📁 Coordinators # Navigation logic, Routers, and View configurations
 ├── 📁 Core         # Base protocols, Base ViewControllers, and App entry point
 ├── 📁 Factories    # Dependency Injection logic for Modules and Overlays
 ├── 📁 Modules      # Feature modules (Feed & Post Details) with State, Store, Reducer
 ├── 📁 Network      # Firebase services, Publishers, Subscriptions, and DTOs
 ├── 📁 Resources    # Assets, Fonts, and Configuration (GoogleService-Info)
 └── 📁 Utils        # Global helpers and relative date formatters
```


## 🚀 Installation & Setup

1. **Clone the repository**:
       
	```bash
	git clone https://github.com/nikolay-goncharenko/Feeder_iOS.git
	```

2. **Environment Preparation**:

	- Ensure you have **Xcode 15+** installed.
	- The project uses **Swift Package Manager (SPM)** to manage dependencies.
	- Key libraries include **Nuke** (Image loading), **Firebase** (Backend), and **R.swift** (Resource management).
	- Xcode will automatically resolve and download these dependencies when you first open the project.

3. **Build and Run**:

	- Open the `Feeder.xcodeproj` file.
	- Select a target simulator (e.g., iPhone 17 Pro).
	- Press `Cmd + R` to build and launch the application.