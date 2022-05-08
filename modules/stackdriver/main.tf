module "logging_metric" {
  source = "google_logging_metric"

  project_id        = "terraform-337804"
  credentials       = "terraform.json"
  google_logging_metric_filter ="resource.type=k8s_container AND severity>=ERROR"
  google_logging_metric_name = "test-logging-metric"
}

module "monitoring_notification_channel" {
  source = "google_monitoring_notification_channel"
  project_id        = "terraform-337804"
  credentials       = "terraform.json"
}

module "monitoring_alert_policy" {
  source = "google_monitoring_alert_policy"

  project_id        = "terraform-337804"
  credentials       = "terraform.json"
  notification_channels = [module.monitoring_notification_channel.email_channel_name]
  depends_on = [module.logging_metric,module.monitoring_notification_channel]
}