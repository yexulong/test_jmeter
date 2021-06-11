# test_jmeter

1.

```
docker build -t YOUR_JMETER_IMAGE_NAME .
```

2.

```shell
docker run -it \
-e DISPLAY=$DISPLAY \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-v $HOME/.Xauthority:/root/.Xauthority \
YOUR_JMETER_IMAGE_NAME
```
