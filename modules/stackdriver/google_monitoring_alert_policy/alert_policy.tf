variable "notification_channels_array" {}
variable "depends_on_array" {}

/*****************************************
  Define the alert policy
 *****************************************/
resource "google_monitoring_alert_policy" "monitoring_alert_policy" {
  display_name = "test-alert-policy"
  documentation {
    content = "Alert Received $${metric.label.json_message}"
    mime_type = "text/markdown"
  }
  conditions {
    display_name = "test-alert-policy-conditions"
    condition_threshold {
      aggregations {
        alignment_period   = "300s"
        cross_series_reducer = "REDUCE_COUNT"
        per_series_aligner = "ALIGN_RATE"
        group_by_fields = ["metric.label.json_message"]
      }
      comparison = "COMPARISON_GT"
      duration   = "0s"
      filter     = "metric.type=\"logging.googleapis.com/user/test-logging-metric\" resource.type=\"k8s_container\""
      trigger {
        count = 1
      }
    }
  }
  alert_strategy {
    auto_close = "1800s"
  }
  combiner = "OR"
  enabled = true
  notification_channels = var.notification_channels_array
  depends_on = var.notification_channels_array
}