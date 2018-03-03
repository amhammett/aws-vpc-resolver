AWS VPC Resolver
================

Resolving Private DNS Queries using AWS VPC Resolver

Referencing [resolving-private-dns-queries-using-aws-vpc-resolver](http://www.tothenew.com/blog/resolving-private-dns-queries-using-aws-vpc-resolver/)
and using bind instead of unbound.


See Makefile for options.

*Make deploy*

1. Create an EC2 instance (plus security groups and ec2 key)
2. Wait for start up
3. Deploy bind and configuration
4. Verify service running
