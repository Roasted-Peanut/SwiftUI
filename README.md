# SwiftUI
===============================================================================================================================================
Phần 1: Project setup (cài đặt dự án)
Struct swift
* MVC (Mô hình — Chế độ xem — Bộ điều khiển),
* MVP (Mô hình — Chế độ xem — Người trình bày),
* MVVM (Mô hình — Xem — Xem mô hình),
* VIPER (Chế độ xem — Người tương tác — Người trình bày — Thực thể — Định tuyến).
Install CocoaPods
* $ sudo gem install cocoapods 
* Next, go to your project root folder (the one that has the .xcodeproj project file), and run: $ pod init. 
* This will create a Podfile that will hold all your external Pod libraries. Each time we make a change in this file, we need to run: $ pod install. 
SwiftLint
Localization
===============================================================================================================================================
Phần 2: Project architecture (kiến trúc dự án)_MVVM
Folder and file structure
* projectName
    * Src
        * Features
            * Login
                * Actions
                * Screens
                * Models
                * Views
                * ViewModels
            * Home
                * Actions
                * Screens
                * Models
                * Views
                * ViewModels
        * Common
            * Actions
            * Screens
            * Models
            * Views
            * ViewModels
    * Resource
        * Images
        * Icon
    * Config
