# Serf

What is Serf?  
Serf is a tool for cluster membership, failure detection, and orchestration that is decentralized, fault-tolerant and highly available.  

## Add your computer to serf cluster

First what we need is serf agent.  
"The Serf agent is the core process of Serf. The agent maintains membership information, propagates events, invokes 
event handlers, detects failures, and more. The agent must run on every node that is part of a Serf cluster."  
Sounds pretty tempting :)
  
  
Let's get the newest version of serf from Hashicorp  
`wget http://dl.bintray.com/mitchellh/serf/0.6.3_linux_amd64.zip`  
`unzip 0.6.3_linux_amd64.zip && mv serf /usr/bin/`  
   
As we got serf now on our computer let's try to check if it's working `serf version`.
```
Serf v0.6.3
Agent Protocol: 4 (Understands back to: 2)
```

Now we can run Dockerfile with our serf-agent.
`SERF_AGENT=$(docker run -d --name serf-agent -p 7946 -p 7373 serf-agent)`  
The 7946 is the port which binds serf agent and 7373 is for RPC   
  
Okay now in one terminal window run 
```
serf agent & serf join $(docker inspect -f "{{ .NetworkSettings.IPAddress }}" $SERF_AGENT):7946
```
```
Successfully joined cluster by contacting 1 nodes.
```
Mission accomplished!  
Have a look at `serf members` and when you done be sure to enter `serf leave`.

## Create serf cluster with containers
We got for you simple serf-nginx container that will automatically connect to serf cluster. Build it and run it with:
```
docker run -d --link serf-agent:serf-agent serf-nginx
```
Run it again, and again.  
Now let's enter our serf-agent container `docker-enter $SERF_AGENT` and do `serf members`
```
e2fd16480051  172.17.0.63:7946  alive   role=nginx
80b09c4180dd  172.17.0.62:7946  alive   role=nginx
e423f7aeff7e  172.17.0.44:7946  alive   role=serf-agent
1c2d2aa0fcb0  172.17.0.60:7946  alive   role=nginx
1eab0cad2ec0  172.17.0.61:7946  alive   role=nginx
6a46b926278a  172.17.0.64:7946  alive   role=nginx
```
Well the cluster is alive and we have few instances of nginx running. We got ip's and we can enter any of them to see html page (almost :D) from nginx.


## Use the cluster Luke

