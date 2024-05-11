// // File generated by FlutterFire CLI.
// // ignore_for_file: type=lint
// import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
// import 'package:flutter/foundation.dart'
//     show defaultTargetPlatform, kIsWeb, TargetPlatform;

// /// Default [FirebaseOptions] for use with your Firebase apps.
// ///
// /// Example:
// /// ```dart
// /// import 'firebase_options.dart';
// /// // ...
// /// await Firebase.initializeApp(
// ///   options: DefaultFirebaseOptions.currentPlatform,
// /// );
// /// ```
// class DefaultFirebaseOptions {
//   static FirebaseOptions get currentPlatform {
//     if (kIsWeb) {
//       return web;
//     }
//     switch (defaultTargetPlatform) {
//       case TargetPlatform.android:
//         return android;
//       case TargetPlatform.iOS:
//         return ios; // Changed from 'default' to 'ios'
//       case TargetPlatform.macOS:
//         return macos;
//       case TargetPlatform.windows:
//         return windows;
//       case TargetPlatform.linux:
//         throw UnsupportedError(
//           'DefaultFirebaseOptions have not been configured for linux - '
//           'you can reconfigure this by running the FlutterFire CLI again.',
//         );
//       default:
//         throw UnsupportedError(
//           'DefaultFirebaseOptions are not supported for this platform.',
//         );
//     }
//   }

//   static const FirebaseOptions android = FirebaseOptions(
//     // Add Android Firebase options here if needed
//   );

//   static const FirebaseOptions ios = FirebaseOptions(
//     apiKey: 'AIzaSyBrJOXTiz2etMjR44ug9UlYfmgrz790Ebk',
//     appId: '1:28706707716:ios:a7364906a3210735541851',
//     messagingSenderId: 'YOUR_MESSAGING_SENDER_ID',
//     projectId: 'YOUR_PROJECT_ID',
//     storageBucket: 'YOUR_STORAGE_BUCKET',
//     iosBundleId: 'mobilebdaat',
//   );

//   static const FirebaseOptions macos = FirebaseOptions(
//     // Add macOS Firebase options here if needed
//   );

//   static const FirebaseOptions windows = FirebaseOptions(
//     // Add Windows Firebase options here if needed
//   );

//   static const FirebaseOptions web = FirebaseOptions(
//     // Add Web Firebase options here if needed
//   );
// }