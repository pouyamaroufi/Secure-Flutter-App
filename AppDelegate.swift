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
    let view = UIView(frame: CGRect(x: 0, y: 0, width: field.frame.self.width, height: field.frame.self.height))
    let image = UIImageView(image: UIImage(named: "whiteImage"))
    image.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    field.isSecureTextEntry = true
    addSubview(field)
    view.addSubview(image)
    layer.superlayer?.addSublayer(field.layer)
    field.layer.sublayers?.last!.addSublayer(layer)
    field.leftView = view
    field.leftViewMode = .always
  }
}
