//
//  SceneDelegate.swift
//  BookSearcher
//
//  Created by Shakhzod Bobokhonov on 6/16/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
       
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: windowScene)
        let str = UIStoryboard.init(name: "Home", bundle: nil)
        let vc = str.instantiateViewController(withIdentifier: "HomeViewController")
        window?.rootViewController = UINavigationController(rootViewController: vc)
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        window?.makeKeyAndVisible()
    }



}

