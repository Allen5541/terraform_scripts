/*****************************************
  Counter Logging Metric with labels
 *****************************************/
resource "google_logging_metric" "logging_metric" {
  name   = "test-logging-metric"
  filter = "resource.type=k8s_container AND severity>=ERROR"
  metric_descriptor {
    metric_kind = "DELTA"
    value_type  = "INT64"
    labels {
      key         = "json_message"
      value_type  = "STRING"
      description = "json message from jsonPayload"
    }
  }
  label_extractors = {
    "json_message" = "EXTRACT(jsonPayload.message)"
  }
}
