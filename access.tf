resource "abbey_demo" "grant_read_write_access" {
  permission = "read_write"
  email = "doug.sillars@gmail.com"
}
resource "abbey_demo" "grant_read_write_access_usu3" {
  permission = "read_write"
  email = "doug.sillars+test@gmail.com"
}
