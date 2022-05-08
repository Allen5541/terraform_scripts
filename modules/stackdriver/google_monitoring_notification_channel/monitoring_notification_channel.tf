/*****************************************
  Define notification channel for alert policy
 *****************************************/
resource "google_monitoring_notification_channel" "email_channel" {
  display_name = "email-channel"
  type         = "email"
  labels = {
    email_address = "870037415@qq.com"
  }
}