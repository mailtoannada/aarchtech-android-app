# AARCHTECH Android App - Starter Project

This is the first Flutter MVP for AARCHTECH, using the supplied AARCHTECH logo and black/red/white branding.

## Included in this first version
- AARCHTECH home screen and supplied logo
- Services: CCTV, video doorbells, solar, inverters/power backup, networking, security systems and IT solutions
- Service enquiry form
- WhatsApp enquiry handoff
- Tap-to-call for 7978125505 and 9583253725

## Important
This is the editable Flutter source project, not yet an installed APK or a Play Store release.
The app opens WhatsApp to send enquiries; it does not store enquiries in a database.
Please verify that both phone numbers are the correct AARCHTECH business contact numbers before publishing.
Business address, email, website, service prices and product catalogue have not been added because verified details were not provided.

## What you need on a Windows computer
1. Install Flutter SDK: https://docs.flutter.dev/get-started/install/windows
2. Install Android Studio: https://developer.android.com/studio
3. Install Visual Studio Code: https://code.visualstudio.com/
4. In Android Studio, install the Android SDK and platform tools.
5. Open a terminal and run: `flutter doctor`
6. Extract this ZIP, open the `aarchtech_android_app` folder in VS Code.
7. Run: `flutter pub get`
8. Connect an Android phone with USB debugging enabled, or start an Android emulator.
9. Run: `flutter run`

## Build an installable APK (after setup)
Run: `flutter build apk --release`
The APK will be generated at:
`build/app/outputs/flutter-apk/app-release.apk`

## Publish
Before Play Store publication, create the app icon, privacy policy, store listing, signed Android App Bundle, and complete Google Play Console requirements and testing. Do not publish until contact details and all business information are verified.
