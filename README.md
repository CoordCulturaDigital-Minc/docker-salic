# docker-salic

Repo used to have a recipe(Dockerfile) to create a image used by SALIC (Sistema de Apoio às Leis de Incentivo à Cultura)

## Pre-requisits
* Docker - More information [here](http://pt.slideshare.net/vinnyfs89/docker-essa-baleia-vai-te-conquistar?qid=aed7b752-f313-4515-badd-f3bf811c8a35&v=&b=&from_search=1).

## Datails

For Each extension installed inside DockerFile, PHP will be compiled again.

## How to build - New image
* Enter inside this cloned repository;
* Execute the commando below to create a new image.
```
docker build -t salic-web:1.0 .
```

This code `-t salic-web:1.0` means you will create a image named 'salic-web' and tag '1.0' and the `.` means your build will use the same folder.

You can execute the command below to create a new container using this new image cre
```
docker run -it -v $(pwd):/var/www --name salic-webv1.0 -e APPLICATION_ENV="development" -p 80:80 salic-web:1.0 bash
```

Or You you can also execute the same command above, but arranging using docker-compose:
```
@todo fill here
```

# More

If you wanna check something inside your container you can access using the command below:
```
```