//
//  AppDelegate.swift
//  memev2
//
//  Created by Luan Ramos on 2022-12-29.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var memes = [Meme]()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    func allMemes() -> [Meme] {
        let data = [
            "Big",
            "Blofeld",
            "Drax",
            "Jaws",
            "Klebb",
            "EmilioLargo",
            "Lechiffre",
            "OddJob",
            "Scaramanga",
            "Silva",
            "Trevelyan",
            "Goldfinger",
            "Zorin",
            "Blofeld",
            "Drax",
            "Jaws",
            "Klebb",
            "EmilioLargo",
            "Lechiffre",
            "OddJob",
            "Scaramanga",
            "Silva",
            "Trevelyan",
            "Goldfinger",
            "Zorin"
        ]
        var memes = [Meme]()
        for nameImage in data {
            let topText = "Top text"
            let bottomText = "Bottom text"
            let originalImage = UIImage(named: nameImage)!
            let memedImage = UIImage(named: nameImage)!

            let meme = Meme(topText: topText, bottomText: bottomText, originalImage: originalImage, memedImage: memedImage)
            memes.append(meme)
        }

        return memes
    }
}

