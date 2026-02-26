# DesignSystem — Grão Nobre

A comprehensive iOS Design System library built with **100% UIKit** (no SwiftUI), distributed via Swift Package Manager (SPM). This library provides a complete set of design tokens, reusable UI components, and extensions to help you build consistent, accessible iOS applications with the **Grão Nobre** brand identity.

## Features

✅ **100% UIKit** — No SwiftUI imports or dependencies  
✅ **Swift Package Manager** — Easy installation and updates  
✅ **Dark Mode Support** — All colors have light and dark variants via `.xcassets`  
✅ **Dynamic Type** — Typography scales with user preferences using `UIFontMetrics`  
✅ **ViewCode Only** — No Storyboards or XIBs required  
✅ **Type-Safe Tokens** — Colors, typography, spacing, border radius, and shadows  
✅ **Reusable Components** — Buttons, text fields, labels, cards, badges, and dividers  
✅ **Well-Tested** — Comprehensive test coverage  

## Requirements

- **iOS 15.0+**
- **Swift 5.9+**
- **Xcode 15.0+**

## Installation

### Swift Package Manager

#### Via Xcode

1. In Xcode, select **File → Add Package Dependencies...**
2. Enter the repository URL:
   ```
   https://github.com/Edgar-AAS/DesignSystem
   ```
3. Select the version you want to use
4. Click **Add Package**

#### Via Package.swift

Add DesignSystem to your `Package.swift` dependencies:

```swift
dependencies: [
    .package(url: "https://github.com/Edgar-AAS/DesignSystem", from: "1.0.0")
]
```

Then add it to your target:

```swift
targets: [
    .target(
        name: "YourTarget",
        dependencies: ["DesignSystem"]
    )
]
```

## Quick Start

Import the library in your UIKit view controller:

```swift
import UIKit
import DesignSystem

class MyViewController: UIViewController {
    
    private lazy var titleLabel = DSLabel(
        fontSize: .largeTitle,
        fontWeight: .bold,
        color: DSColors.textPrimary
    )
    
    private lazy var subtitleLabel = DSLabel(
        fontSize: .body,
        fontWeight: .regular,
        color: DSColors.textSecondary
    )
    
    private lazy var emailTextField: DSTextField = {
        let field = DSTextField()
        field.placeholder = "Enter your email"
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private lazy var submitButton: DSButton = {
        let button = DSButton(variant: .primary, size: .large)
        button.setTitle("Submit", for: .normal)
        button.addTarget(self, action: #selector(submitTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = DSColors.backgroundPrimary
        
        titleLabel.text = "Welcome"
        subtitleLabel.text = "Please enter your information"
        
        view.addSubviews(titleLabel, subtitleLabel, emailTextField, submitButton)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: DSSpacing.lg),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: DSSpacing.sm),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -DSSpacing.sm),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: DSSpacing.xs),
            subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            subtitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            emailTextField.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: DSSpacing.md),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: DSSpacing.sm),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -DSSpacing.sm),
            
            submitButton.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: DSSpacing.md),
            submitButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: DSSpacing.sm),
            submitButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -DSSpacing.sm)
        ])
    }
    
    @objc private func submitTapped() {
        submitButton.isLoading = true
        
        // Simulate network request
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.submitButton.isLoading = false
        }
    }
}
```

## Design Tokens

### Colors (`DSColors`)

All colors support light and dark mode automatically.

#### Brand Colors
- `DSColors.brandPrimary` — Primary brand color (coffee brown)
- `DSColors.brandSecondary` — Secondary brand color (noble gold)
- `DSColors.accent` — Accent color (warm brown)

#### Background Colors
- `DSColors.backgroundPrimary` — Primary background (warm white/dark)
- `DSColors.backgroundSecondary` — Secondary background (warm cream/dark gray)

#### Surface Colors
- `DSColors.surface` — Card/surface background (white/dark)

#### Text Colors
- `DSColors.textPrimary` — Primary text (black/white)
- `DSColors.textSecondary` — Secondary text (gray)

#### Semantic Colors
- `DSColors.success` — Success state (green)
- `DSColors.error` — Error state (red)
- `DSColors.warning` — Warning state (orange)

#### UI Elements
- `DSColors.border` — Border color
- `DSColors.divider` — Divider/separator color

### Typography (`DSTypography`)

Dynamic Type support with `UIFontMetrics` for accessibility.

#### Font Sizes
- `.caption` — 12pt
- `.footnote` — 14pt
- `.body` — 16pt
- `.subtitle` — 20pt
- `.title` — 24pt
- `.largeTitle` — 32pt

#### Font Weights
- `.regular`
- `.medium`
- `.semibold`
- `.bold`

#### Usage
```swift
let font = DSTypography.font(size: .body, weight: .medium, scaled: true)
```

### Spacing (`DSSpacing`)

All spacing values follow a 4pt grid system.

- `DSSpacing.xxxs` — 4pt
- `DSSpacing.xxs` — 8pt
- `DSSpacing.xs` — 12pt
- `DSSpacing.sm` — 16pt
- `DSSpacing.md` — 24pt
- `DSSpacing.lg` — 32pt
- `DSSpacing.xl` — 40pt
- `DSSpacing.xxl` — 48pt

### Border Radius (`DSBorderRadius`)

- `DSBorderRadius.small` — 4pt
- `DSBorderRadius.medium` — 8pt
- `DSBorderRadius.large` — 16pt
- `DSBorderRadius.circular(for: CGFloat)` — Returns size/2 for circular corners

### Shadow (`DSShadow`)

Elevation-based shadow system for depth and hierarchy.

#### Elevation Levels
- `.none` — No shadow
- `.low` — Subtle shadow (offset: 2pt, radius: 4pt, opacity: 8%)
- `.medium` — Standard shadow (offset: 4pt, radius: 8pt, opacity: 12%)
- `.high` — Prominent shadow (offset: 8pt, radius: 16pt, opacity: 16%)

#### Usage
```swift
DSShadow.apply(.medium, to: myView.layer)
```

## Components

### DSButton

A customizable button with multiple variants and sizes.

#### Variants
- `.primary` — Filled button with brand color
- `.secondary` — Outlined button
- `.destructive` — Filled button with error color
- `.ghost` — Text-only button

#### Sizes
- `.small` — Compact button
- `.medium` — Standard button (default)
- `.large` — Prominent button

#### Features
- Loading state with activity indicator
- Smooth press animations
- Dark mode support
- Disabled state handling

#### Usage
```swift
let button = DSButton(variant: .primary, size: .large)
button.setTitle("Continue", for: .normal)
button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

// Show loading
button.isLoading = true

// Hide loading
button.isLoading = false
```

### DSTextField

A text field with title label, error state support, and consistent styling.

#### Features
- Title/header label support
- Placeholder support with semantic colors
- Error message display with animation
- Rounded corners and consistent padding
- Dark mode support

#### Usage
```swift
let textField = DSTextField()
textField.title = "Email"
textField.placeholder = "Enter email"
textField.text = "user@example.com"

// Show error
textField.errorMessage = "Invalid email format"

// Clear error
textField.errorMessage = nil

// Access the underlying UITextField
textField.textField.delegate = self
textField.textField.keyboardType = .emailAddress
```

### DSLabel

A label with built-in typography and accessibility support.

#### Features
- Type-safe typography with DS tokens
- Automatic Dynamic Type scaling
- Multi-line support by default
- Dark mode support

#### Usage
```swift
let label = DSLabel(
    fontSize: .title,
    fontWeight: .bold,
    color: DSColors.textPrimary,
    alignment: .center
)
label.text = "Hello, World!"
```

### DSCard

A container view with elevation shadow and rounded corners, ideal for content grouping.

#### Features
- Configurable elevation shadow (none, low, medium, high)
- Customizable corner radius
- Surface color background
- Content padding support
- Dark mode support

#### Usage
```swift
let card = DSCard(elevation: .medium, cornerRadius: DSBorderRadius.large)
card.translatesAutoresizingMaskIntoConstraints = false

let contentLabel = DSLabel(fontSize: .body)
contentLabel.text = "Card content here"
card.addContent(contentLabel, padding: DSSpacing.sm)
```

### DSDivider

A styled separator line for visual content division.

#### Features
- Horizontal and vertical orientation
- Customizable color and thickness
- Auto Layout ready

#### Usage
```swift
let divider = DSDivider(orientation: .horizontal)
// or with custom properties
let customDivider = DSDivider(orientation: .vertical, color: DSColors.border, thickness: 2)
```

### DSBadge

A small colored tag/label for categories, statuses, or highlights.

#### Variants
- `.primary` — Brand primary color badge
- `.secondary` — Brand secondary color badge
- `.success` — Green success badge
- `.warning` — Orange warning badge
- `.error` — Red error badge

#### Usage
```swift
let badge = DSBadge(variant: .success)
badge.text = "Available"

let categoryBadge = DSBadge(variant: .primary)
categoryBadge.text = "Premium"
```

## Extensions

### UIView+DS

Convenience methods for common layout tasks.

#### Methods

**`addSubviews(_:)`** — Add multiple subviews and set `translatesAutoresizingMaskIntoConstraints = false`
```swift
view.addSubviews(label, button, textField)
```

**`pinToSuperview(padding:)`** — Pin to all edges of superview
```swift
containerView.addSubview(contentView)
contentView.pinToSuperview(padding: DSSpacing.sm)
```

**`pinToSafeArea(of:padding:)`** — Pin to safe area layout guide
```swift
view.addSubview(scrollView)
scrollView.pinToSafeArea(of: view, padding: DSSpacing.md)
```

## Architecture

All public types are prefixed with `DS` to avoid naming collisions. All components are implemented using ViewCode (no Storyboards or XIBs), and `init(coder:)` is marked as unavailable to enforce this pattern.

## Testing

Run tests using Xcode or the command line:

```bash
xcodebuild test \
  -scheme DesignSystem \
  -destination 'platform=iOS Simulator,name=iPhone 15,OS=17.5'
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Author

Edgar Arlindo

---

**Note:** This Design System is built with UIKit only. There are no SwiftUI imports or dependencies in the library.