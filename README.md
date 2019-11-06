#### Create Preferences

```swift
// Read-Write preference
Preference<Bool>.readWrite("show-sidebar", defaultValue: true)
Preference<[Int]>.readWrite("selected-indices", defaultValue: [Int]())

// Read-Only preference
Preference<String>.readOnly("base-url", defaultValue: "https://www.example.com")
```

```swift
extension Preference {
  static var showSidebar: Preference<Bool> {
    .readWrite("show-sidebar", defaultValue: true)
  }
}
```
#### Saving and Retriving Preferences

```swift
let controller = PreferencesController.shared

// saving
controller.save(false, to: .showSidebar)
// retriving
let showSidebar = controller.retrive(.showSidebar)
```

#### Saving and Retriving Custom Value Type

Confirm your custom type to `PropertyListRepresentable`:

```swift
extension NSRect: PropertyListRepresentable {
  var propertyListEncoded: Any {
    "\(origin.x) \(origin.y) \(size.width) \(size.height)"
  }
  
  static func decode(fromPropertyList encoded: Any) -> NSRect? {
    guard let raw = encoded as? String else { return nil }
    let value = raw.components(separatedBy: " ").compactMap { Double($0) }.map { CGFloat($0) }
    return NSRect(x: value[0] ?? 0, y: value[1] ?? 0, width: value[2] ?? 0, height: value[3] ?? 0)
  }
}
```

#### Subscribing for preference changes 

```swift
class ViewController: NSViewController, PreferencesControllerSubscriber {
  override func viewDidLoad() {
    PreferencesController.shared.addSubscriber(self)
  }

  func preferencesController(_ controller: PreferencesController, didChangePreferenceWithKey key: String, newValue: PropertyListRepresentable, oldValue: PropertyListRepresentable) {
    // called on every save, filter and response to changes here
  }
}
```
