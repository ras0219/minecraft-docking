This is a Dockerfile that packages Omnifactory 1.2.2.

Recommended usage:
```
$ docker build . -t omnifactory:1.2.2
$ docker run -p 25565:25565 --name mc -d --mount type=volume,src=omnifactory-world,target=/data/world omnifactory:1.2.2
```
