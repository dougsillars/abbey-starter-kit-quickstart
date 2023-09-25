resource "abbey_demo" "grant_read_write_access" {
  permission = "read_write"
  email = "doug.sillars@gmail.com"
}
resource "doug_full_site" "grant_read_write_access" {
  permission = "read_write"
  email = "doug.sillars@gmail.com"
}
