# NetMgt - Network Management Application

## Overview

## Installation and Setup

1. Clone the Repository

```
git clone https://github.com/patcmc/netmgt.git
cd netmgt
```

2. Generate SSL Certificates (Optional)

If you want to use HTTPS in local development, generate SSL certificates using mkcert:

```
mkdir certs
mkcert -key-file certs/server.key -cert-file certs/server.crt netmgt.local
```

3. Update Your Hosts File

Add the following entry to your /etc/hosts file to map netmgt.local to 127.0.0.1:

```
127.0.0.1 netmgt.local
```

4. Run the Docker Containers

Use docker-compose to build and run the containers:

```
docker-compose up --build
```

Or

```
make setup
make start
```