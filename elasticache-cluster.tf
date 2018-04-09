resource "aws_elasticache_cluster" "my_terraform_elasticache" {
  cluster_id           = "cluster-elasticache"
  engine               = "memcached"
  node_type            = "cache.t2.micro"
  num_cache_nodes      = 1
  parameter_group_name = "default.memcached1.4"
  port                 = 11211
  security_group_ids = ["${aws_security_group.my_terraform_memcache.id}"]
  subnet_group_name =  "${aws_elasticache_subnet_group.my_terraform_elasticache.id}"
}