//
//  NotificationService.swift
//  RichNotificationService
//
//  Created by Abdelrhman on 8/18/21.
//  Copyright © 2021 ahmedfouad. All rights reserved.
//

import UserNotifications
import FirebaseMessaging
class NotificationService: UNNotificationServiceExtension {
  var contentHandler: ((UNNotificationContent) -> Void)?
  var bestAttemptContent: UNMutableNotificationContent?

  override func didReceive(_ request: UNNotificationRequest, withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void) {
    self.contentHandler = contentHandler
    bestAttemptContent = request.content
      .mutableCopy() as? UNMutableNotificationContent
    guard let bestAttemptContent = bestAttemptContent else { return }
    FIRMessagingExtensionHelper().populateNotificationContent(
      bestAttemptContent,
      withContentHandler: contentHandler)
  }

  override func serviceExtensionTimeWillExpire() {
    // Called just before the extension will be terminated by the system.
    // Use this as an opportunity to deliver your "best attempt" at modified content, otherwise the original push payload will be used.
    if let contentHandler = contentHandler, let bestAttemptContent = bestAttemptContent {
      contentHandler(bestAttemptContent)
    }
  }
}
