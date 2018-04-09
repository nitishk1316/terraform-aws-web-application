# Terraform aws web application
Creating AWS environment for the sample web application. It contains 2 frontends, one caching node and RDS as a database.

```
1. ALB is configured to accept HTTP/HTTPS connections and pass them to the frontends. HTTPS could be passed as is or decryptes.
2. On frontends web server are handle connection from ELB. It should be possible to reach from frontends MySQL RDS and Memcached (Elastic Cache).
3. Frontend 1 and Frontend 2 is in different availabilty zones.
4. Created seperate VPC for web application. HTTP coonection is allowed only via ALB.
5. Nginx listening on HTTP port in frontends.
```

## How to run the service
Clone the repository:
```
> git clone https://github.com/nitishkumarsingh13/terraform-aws-web-application.git
```

Get to the `terraform-aws-web-application` folder:
```
> cd sterraform-aws-web-application
```

Run the service:
```
> terraform init
> terraform apply
```

After applying everything, it will show load balancer dns name
```
dns_name = my-terraform-elb-1296132506.us-east-2.elb.amazonaws.com
```

## Prerequisites

Before starting this service, you must install:
- terraform
