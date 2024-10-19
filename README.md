<h1 align="left">🎶 TuneVibe 🎶</h1>
<p>
Welcome to **TuneVibe**, a Spotify-like app for developers! This version lets you upload and stream music using **Firebase**. It's **ad-free**, offers **seamless streaming**, and is built for iOS/macOS developers. 🎧
</p>
<br>

<p align="center">
  <img src="https://img.icons8.com/color/48/000000/firebase.png" alt="Firebase" />
  +
  <img src="https://img.icons8.com/color/48/000000/musical-notes.png" alt="Music" />
  +
  <img src="https://img.icons8.com/color/48/000000/swift.png" alt="Swift" />
</p>

## 🚀 Features
- 🎵 **Developer-Centric**: Upload music files via Firebase for testing and development.
- 🔥 **Firebase Integration**: Streams music data directly from Firebase Firestore and Storage.
- 🌐 **Online Streaming**: Temporary caching ensures no device storage usage.
- 🎛️ **Swift-Based**: Built using Swift for iOS/macOS, showcasing infinite possibilities!

> **Note**: Search functionality is coming soon. Stay tuned! 🎯

## 📸 Screenshots
<p align="left">
  <img src="Screenshots/one.png" alt="Screenshot 1" width="300"/>
  <img src="Screenshots/two.png" alt="Screenshot 2" width="300"/>
</p>

## 🧩 How It Works

TuneVibe leverages **Firebase** to fetch and stream music. Here’s how:

1. **Firebase Storage**: Developers upload music files to Firebase Storage.
2. **Firestore**: Stores metadata (e.g., song name, duration) as documents.
3. **Data Fetching**:
   - When a user selects a track, TuneVibe fetches metadata from Firestore and retrieves the file from Firebase Storage.
   - It temporarily caches data for seamless playback and deletes it once playback ends.

> Want to learn more about Firebase? Check out their [official GitHub](https://github.com/firebase).

## 🔧 Installation Guide

> **Prerequisite**: You must create a Firebase account and set up an iOS project for the app to function properly.

### Step-by-step Setup:
1. **Clone the Repository**:
    ```bash
    git clone https://github.com/RanaAk/TuneVibe.git
    cd TuneVibe
    open TuneVibe.xcodeproj
    ```

2. **Set Up Firebase**:
   - Go to [Firebase Console](https://console.firebase.google.com) and create a new project.
   - Follow the instructions to add an iOS app and download the `GoogleService-Info.plist` file.
   - Drag the file into your Xcode project under the root directory.

3. **Configure Firebase in Your App**:
   - Install Firebase SDKs using CocoaPods:
     ```bash
     pod install
     ```
   - Initialize Firebase in your app’s `AppDelegate.swift`:
     ```swift
     import Firebase
     FirebaseApp.configure()
     ```

4. **Upload Music to Firebase**:
   - Use the Firebase Console to upload sample music files in Firebase Storage.
   - Add metadata for each file in Firestore, like song title, artist, and duration.

5. **Run the App**: 🎉  
   The project is now ready to use! Test streaming your uploaded tracks effortlessly.

## 🌌 Infinite Possibilities

With **TuneVibe**, you can:
- Build personalized streaming apps for iOS/macOS.
- Experiment with dynamic streaming and real-time updates using Firestore.
- Explore features like live radio, user playlists, and more!

> Dive in and start building your own online music streamer!

## 📝 License
MIT License © 2024 Mehedi Akbar Rana  
*AI/automated systems use is restricted without explicit permission.*

---

Feel free to contribute or open issues for suggestions! 🌟
