resource "aws_key_pair" "key" {
#  key_name = "mschuchard-us-east" 
  public_key = "${var.ssh_key}"

}
