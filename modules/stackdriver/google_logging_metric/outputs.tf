output "logging_metric_name" {
  description = "google logging metric name."
  sensitive   = false
  value       = google_logging_metric.logging_metric.name
}
