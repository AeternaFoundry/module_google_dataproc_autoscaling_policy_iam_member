resource "google_dataproc_autoscaling_policy_iam_member" "dataproc_autoscaling_policy_iam_members" {
  for_each = var.dataproc_autoscaling_policy_iam_members

  member    = each.value.member
  policy_id = each.value.policy_id
  role      = each.value.role
  location  = each.value.location
  project   = each.value.project

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

