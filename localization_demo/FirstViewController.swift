//
//  FirstViewController.swift
//  localization_demo
//
//  Created by Chandan Bhagabati on 11/01/24.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var lang_option_button: UIBarButtonItem!
    @IBOutlet weak var first_page_content: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.first_page_content.text = "page.content.first".localize()
        addBarMenu()
    }
    

    func addBarMenu(){
        let barButtonMenu = UIMenu(title: "", children: [
            UIAction(title: "lang.english".localize(), handler: { [weak   self] (_) in
                self?.setLangauge(languageCode: "en", language: "English")
           }),
            UIAction(title: "lang.hindi".localize(), handler: { [weak   self] (_) in
                self?.setLangauge(languageCode: "hi", language: "Hindi")
           }),
            UIAction(title: "lang.gujarati".localize(), handler: { [weak   self] (_) in
                self?.setLangauge(languageCode: "gu", language: "Gujarati")
           }),
            UIAction(title: "lang.settings".localize(), handler: { [weak   self] (_) in
                self?.invokeLangSettings()
           })])
        lang_option_button?.menu = barButtonMenu
    }
    
    func invokeLangSettings(){
        if let settingsURL = URL(string: UIApplication.openSettingsURLString) {
            UIApplication.shared.open(settingsURL, options: [:], completionHandler: nil)
        }
    }
    
    func setLangauge(languageCode: String, language: String) {
         let alert = UIAlertController(title: nil, message: "lang.change.alert".localize(), preferredStyle: .alert)

          alert.addAction(UIAlertAction(title: "exit.app".localize() , style: .default, handler: { [weak self](_) in
                            // Update app's language with the language code
                UserDefaults.standard.set([languageCode], forKey: "AppleLanguages")
                UserDefaults.standard.synchronize()

                self?.closeApplicationWithNotification(language: language)
        }))

             // Show change language alert to user
         self.present(alert, animated: true, completion: nil)
    }
    
    func closeApplicationWithNotification(language: String) {
         let content = UNMutableNotificationContent()
         content.title = "Language changed to" + " \(language)"
         content.body = "Tap to reopen the application"
         content.sound = UNNotificationSound.default

         let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.5, repeats: false)
         let identifier = "revlocal"
         let request = UNNotificationRequest.init(identifier: identifier, content: content, trigger: trigger)
         let center = UNUserNotificationCenter.current()
         center.add(request)

         exit(EXIT_SUCCESS)
    }
}
