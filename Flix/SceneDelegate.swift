//
//  SceneDelegate.swift
//  Flix
//
//  Created by Alex Geier on 1/17/20.
//  Copyright © 2020 Alex Geier. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        
        let movieTableViewController = MovieTableViewController()
        movieTableViewController.navigationItem.title = "Movies"
        
        let movieNavigationController = UINavigationController(rootViewController: movieTableViewController)
        movieNavigationController.navigationBar.prefersLargeTitles = true
        movieNavigationController.tabBarItem.image = UIImage(systemName: "film")
        movieNavigationController.tabBarItem.title = "Movies"
        
        let superheroViewController = MovieCollectionViewController()
        superheroViewController.navigationItem.title = "Superhero Movies"
        
        let superheroNavigationController = UINavigationController(rootViewController: superheroViewController)
        superheroNavigationController.navigationBar.prefersLargeTitles = true
        superheroNavigationController.tabBarItem.image = UIImage(systemName: "person.3.fill")
        superheroNavigationController.tabBarItem.title = "Superhero Movies"
        
        let tabViewController = UITabBarController()
        tabViewController.viewControllers = [
            movieNavigationController,
            superheroNavigationController
        ]
        
        window?.rootViewController = tabViewController
        window?.makeKeyAndVisible()
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
    
}

