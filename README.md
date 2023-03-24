# Make Your iOS and Android App Secure

## Block ScreenShots and Screen Recording without adding any packages in Flutter

:bulb: Notic: Only works on real Device | the codes dosen't works on simulator for both platform and tutorial available in YouTube




## Android

Add this to `MainActivity` in android/app/src/main/kotlin/com/PackegeName/ProjectName

```kotlin
package com.example.test // replace your packageName

import android.view.WindowManager.LayoutParams
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity: FlutterActivity() {
  override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
    window.addFlags(LayoutParams.FLAG_SECURE)
    super.configureFlutterEngine(flutterEngine)
  }
}
```



## iOS

Add this to `AppDelegate` in ios/Runner/AppDelegate.swift

```Swift
import UIKit
import Flutter


@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    self.window.makeSecure() // + add this line
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

// +  add this section

extension UIWindow {
func makeSecure() {
    let field = UITextField()
    field.isSecureTextEntry = true
    self.addSubview(field)
    field.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    field.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    self.layer.superlayer?.addSublayer(field.layer)
    field.layer.sublayers?.first?.addSublayer(self.layer)
  }
}
```
