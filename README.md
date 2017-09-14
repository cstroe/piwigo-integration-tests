# Piwigo Integration Tests

Run tests against [Piwigo](https://github.com/Piwigo/Piwigo) running in Docker.

## Manual Testing

To start a Piwigo instance use `docker-compose`:

    git submodule init
    git submodule update
    docker-compose up --build

Piwigo will be accessible at [http://localhost:8082](http://localhost:8082).  The admin username is `testadmin` and the password is `password`.
