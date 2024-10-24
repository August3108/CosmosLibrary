//
//  CodeSigning.swift
//  Cosmos Library
//
//  Created by Rahul Jha on 10/09/24.
//


///Code Signing for iOS Apps
// Code signing is a security mechanism required by Apple to ensure that iOS apps are trustworthy and haven't been tampered with. It involves attaching a digital signature to your app, verifying the identity of the developer and ensuring the integrity of the app's code. Without proper code signing, your app won't be allowed to run on actual iOS devices or be distributed through the App Store.

// Why Code Signing is Important:
// Authentication: Code signing ensures that the app is coming from a verified developer. This protects users from downloading malicious software.
// Integrity: Once an app is signed, its code cannot be modified without invalidating the signature. This prevents unauthorized changes or tampering after the app has been signed.
// Security and Trust: Apple uses code signing as part of its security infrastructure to ensure apps behave in a predictable way and come from trusted sources.
// Components Involved in Code Signing
// Apple Developer Account:

// To sign your iOS app, you need an Apple Developer account, which allows you to create and manage certificates and provisioning profiles used in the code signing process.
// Certificates:

// Development Certificate: Used for testing your app on physical devices. This certificate confirms that you are an authorized developer.
// Distribution Certificate: Used when distributing your app to the App Store or deploying it via enterprise channels. It certifies the app is ready for distribution.
// Provisioning Profiles:

// A provisioning profile combines the app ID, certificates, and the list of devices or distribution platforms. It allows the app to run on specified devices during development (development profile) or to be distributed to users (distribution profile).
// Types of provisioning profiles:

// Development Provisioning Profile: Used to run and debug apps on test devices.
// Ad-Hoc Provisioning Profile: Used for distributing pre-release versions of the app to specific devices for testing.
// App Store Distribution Profile: Used for distributing apps to the App Store.
// Enterprise Provisioning Profile: Used for distributing apps internally within an organization.
// App ID:

// A unique identifier for your app, which is used by both the certificates and the provisioning profiles to link them to a specific app. App IDs are typically in the format com.companyname.appname.
// How Code Signing Works
// Create a Certificate:

// Through your Apple Developer account, you generate a certificate request on your local machine and submit it to Apple. Apple then issues a certificate that you download and install.
// Create a Provisioning Profile:

// The provisioning profile includes the app ID, the certificate, and the list of devices (for development/ad-hoc). This profile is used by Xcode to sign the app and allow it to run on devices.
// Sign Your App in Xcode:

// Xcode handles most of the code signing process automatically. Under your project’s settings, you specify the signing certificate and provisioning profile. When you build or archive the app, Xcode attaches the necessary digital signatures.
// Submission to the App Store:

// When submitting your app, the App Store verifies your digital signature and ensures that your app hasn't been modified. If the signature is valid, your app will be accepted for distribution.
// Example of Code Signing Process in Xcode
// swift
// Copy code
// 1. Open your project in Xcode.
// 2. Select your project in the navigator, then choose the target for your app.
// 3. Go to the “Signing & Capabilities” tab.
// 4. Under "Signing," check "Automatically manage signing" to let Xcode handle the certificates and provisioning profiles.
// 5. Select your team (associated with your Apple Developer account).
// 6. Xcode will automatically generate the appropriate provisioning profile and sign your app when you build it.
// Automatic vs. Manual Signing
// Automatic Signing: Xcode manages certificates, provisioning profiles, and other settings for you. This is the easiest way to get your app signed for development and distribution.

// Manual Signing: You manually create and select certificates and provisioning profiles. This is typically used for more advanced workflows, such as specific testing configurations or enterprise deployments.

// Common Issues with Code Signing
// Provisioning Profile Mismatch:

// Xcode may throw an error if the app ID in your provisioning profile doesn't match the app ID in your project settings.
// Expired Certificates:

// Certificates are valid for a limited time (usually one year). If your certificate expires, you'll need to renew it to continue deploying or distributing your app.
// Team Not Selected:

// Ensure your developer team is selected in the project settings, as this is required to match the certificates and profiles to your account.
// Incorrect Signing Identity:

// Make sure that the signing identity (certificate) matches the profile you're using (development or distribution).
//
