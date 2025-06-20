# locals {
#   quota_overrides = {
#     # key = "<service>/<metric>"                                         => value = desired limit
#     "storage.googleapis.com/storage_default_object_size"                = 5 * 1024 * 1024 * 1024   # 5 GiB
#     # "cloudfunctions.googleapis.com/function_invocations"                = 2000000                  # 2 M /-month
#   }
# }

# resource "google_service_usage_consumer_quota_override" "free_caps" {
#   provider = google-beta 
#   for_each = local.quota_overrides

#   project        = var.project_id
#   service        = split("/", each.key)[0]
#   metric         = each.key
#   limit          = urlencode("/project") 
#   override_value = each.value

#   depends_on     = [google_project_service.core]
# }
