# What is Node.js?

![logo](logo.png)

This image inherits from the ```node``` image adding support to manage the [Node.js](http://nodejs.org) configuration through [Consul](https://consul.io/)

It includes : 
  - [S6 Overlay](https://github.com/just-containers/s6-overlay) to properly manage multiple services in one container
  - [Consul template](https://github.com/hashicorp/consul-template) to manage dynamic configuration based on Consul

# Usage

## Run scripts

To run a single script, you can mount it in a volume under `/app`. From the root of your application directory (assuming your script is named `hello.js`):

```
docker run -v ${PWD}:/app -w /app -it --rm 1science/node node hello.js 
```

##Consul Template

The following example mount the [Consul template](https://github.com/hashicorp/consul-template) configuration in the container: 

```
docker run --name nginx-consul -v etc/consul-template:/etc/consul-template:ro -d 1science/nginx:consul
```

# Variants

An image based on the lightweight [Alpine Linux](https://alpinelinux.org/) distribution is available with the tag ```{version}-alpine```.