# [docker-easyepg](https://github.com/mod242/docker-easyepg)

This Image is based on the Work of linuxserver's webgrabplus container (https://github.com/linuxserver/docker-webgrabplus)

[easyEPG](https://github.com/sunsettrack4/easyepg) is a WebGrab++ alternative providing high-quality EPG data from different IPTV/OTT sources.

## Usage

Here are some example snippets to help you get started creating a container.

### docker

```
docker create \
  --name=easyepg \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/London \
  -v <path to easyepg>:/easyepg \
  --restart unless-stopped \
  your image name
  ```

## Parameters

Container images are configured using parameters passed at runtime (such as those above). These parameters are separated by a colon and indicate `<external>:<internal>` respectively. 

| Parameter | Function |
| :----: | --- |
| `-e PUID=1000` | for UserID - see below for explanation |
| `-e PGID=1000` | for GroupID - see below for explanation |
| `-e TZ=Europe/London` | Specify a timezone to use EG Europe/London |
| `-v /easyepg` | Where easyepg should be stored (including config and resulting xml). |

## User / Group Identifiers

When using volumes (`-v` flags) permissions issues can arise between the host OS and the container, we avoid this issue by allowing you to specify the user `PUID` and group `PGID`.

Ensure any volume directories on the host are owned by the same user you specify and any permissions issues will vanish like magic.

In this instance `PUID=1000` and `PGID=1000`, to find yours use `id user` as below:

```
  $ id username
    uid=1000(dockeruser) gid=1000(dockergroup) groups=1000(dockergroup)
```


&nbsp;
## Application Setup

To configure easyEPG follow the [documentation](https://github.com/sunsettrack4/easyepg/blob/master/README.md)

Note that to configure easyEPG you need to open the Terminal of the container by using "docker exec"

Make sure to only call easyEPG in the terminal via the following command to make sure that no permission-issues arise:
```/bin/bash /defaults/epgupdate.sh```

To adjust the scheduled cron job for grabbing, edit the ee-cron file found in the `/easyepg` folder. After you have edited the the ee-cron file, restart the container to apply the new schedule.
Do not adjust the command!

Below is the syntax of the cron file.

```
 ┌───────────── minute (0 - 59)
 │ ┌───────────── hour (0 - 23)
 │ │ ┌───────────── day of month (1 - 31)
 │ │ │ ┌───────────── month (1 - 12)
 │ │ │ │ ┌───────────── day of week (0 - 6) (Sunday to Saturday;
 │ │ │ │ │                                       7 is also Sunday on some systems)
 │ │ │ │ │
 │ │ │ │ │
 * * * * *  /bin/bash /defaults/epgupdate.sh
```



## Support Info

* Shell access whilst the container is running: `docker exec -it easyepg /bin/bash`
* To monitor the logs of the container in realtime: `docker logs -f easyepg`
* container version number 
  * `docker inspect -f '{{ index .Config.Labels "build_version" }}' easyepg`

## Updating Info

The Container updates to the most recent version of EasyEPG when restartet

## Building locally

To build the image locally do the following: 
```
git clone https://github.com/mod242/docker-easyepg.git
cd docker-easyepg
docker build \
  --no-cache \
  --pull \
  -t easyepg .
```
## Versions

* **05.06.19:** - Initial Release.
* **09.06.19:** - Add Autoupdate and Cleanup
