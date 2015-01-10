docker-miniproxy
==============

A docker.io container for 3proxy


Building and running the container image
----------------------------------------

Clone this repo and cd into the cloned directory

Run the following docker command to build the image:

    docker build -t riftbit/miniproxy .

When the image is built start up the image with the following command replacing **'/home/user/mediaFiles'** with the path where your media files reside:

    docker run -d --net=host -p 5129:5129 riftbit/miniproxy


Notes
--------------------

In the meantime, you can run the container with --net=host (requires docker version 0.11.0) but read the next excerpt from the docker commandline help 

-----------------------------------------
>	--net=host  : Use the host network stack inside the container.  
>	Note: the host mode gives the container full access to local system services such as D-bus and is therefore considered insecure.

-----------------------------------------
