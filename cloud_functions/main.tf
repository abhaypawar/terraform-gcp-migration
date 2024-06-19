resource "google_cloudfunctions_function" "function" {
  name        = "your-cloud-function-name"
  runtime     = "nodejs14"
  entry_point = "helloWorld"
  trigger_http = true

  source_archive_bucket = "your-bucket-name"
  source_archive_object = "your-source-archive.zip"

  event_trigger {
    event_type = "providers/cloud.storage/eventTypes/object.change"
    resource   = "your-bucket-name"
  }
}
