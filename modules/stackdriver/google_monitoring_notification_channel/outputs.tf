output "email_channel_name" {
  description = "google monitoring notification channel."
  sensitive   = false
  value       = google_monitoring_notification_channel.email_channel.name
}

