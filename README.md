# cleanish-clock

[![Codemagic build status](https://api.codemagic.io/apps/5fe6626515bfd1dbbe13d380/ios-app/status_badge.svg)](https://codemagic.io/apps/5fe6626515bfd1dbbe13d380/ios-app/latest_build)

A clean, no-nonsense clock widget for iOS inspired by the Android launcher clock widget

### Light mode:

![Cleanish Clock widget on iPhone 14 simulator, light mode](https://github.com/joshmcarthur/cleanish-clock/raw/main/screenshots/light.png)

![Cleanish Clock small widget on iPhone 14 simulator, light mode](https://github.com/joshmcarthur/cleanish-clock/raw/main/screenshots/light-small.png)

### Dark mode:

![Cleanish Clock widget on iPhone 11 simulator, dark mode](https://github.com/joshmcarthur/cleanish-clock/raw/main/screenshots/dark.png)

![Cleanish Clock small widget on iPhone 14 simulator, dark mode](https://github.com/joshmcarthur/cleanish-clock/raw/main/screenshots/dark-small.png)

### FAQ

#### Does this support StandBy mode?

Yes! In standby mode, the 'small' widget will be upscaled to occupy approximately 50% of the horizontal screen width. To use StandBy mode, your iPhone must be oriented horizontally and charging.

#### Why isn't this on the App Store?

Apple's App Store Review Guidelines have a [Minimum Functionality requirement](https://developer.apple.com/app-store/review/guidelines/#4.2):

> If your app is not particularly useful, unique, or “app-like,” it doesn’t belong on the App Store.

Unfortunately, clocks are well within this "unique" definition, even though the widget itself is fairly unique within the space. I have no interest in trying to add enough features to the application to try and convince Apple that this app fulfils a niche within the App Store, because it doesn't. Instead, I'm aiming to offer a minimal and nice widget to tell me the time. That's it.

#### How do I get this?

You'll need the latest XCode installed. You don't need a paid developer account to build applications for your own device, but you do need to be signed into an Apple account inside XCode.

1. Clone the repo: `git clone git://github.com/joshmcarthur/cleanish-clock.git`
2. Open the project: `open 'Cleanish Clock.xcodeproj'`
3. Plug in your iPhone or iPad, and Xcode will set up this device for development (if not already done)
4. Choose your device from the dropdown and hit the 'Play' icon to build and run. You can also choose a simulator if you don't have a device, or want to try it out on a simulator first.

I'm hoping to offer prebuild binaries using my own free account provisioning profile sometime soon. This will require manually permitting my provisioning profile on your device. If you aren't comfortable with this, you are best off building your own binary.

#### How do I make the background transparent?

You can't - this isn't allowed by iOS to make widgets obviously not part of the OS. There are fancy things that can be done by snapshotting the background and cropping it to the widget, but that feels heavy for this.

#### How do I get the dark version of this?

Enable dark mode on your device (Settings -> Appearance)

#### How do I change the font, colours or time/date format?

You can't - at the moment. I've made some opinionated choices about how this displays. I may add an option to change the background and foreground colours based on the Material Design palette, and possibly to switch between 12 and 24 hour time formats.
