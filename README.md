# docker-tsdns
[![Build Status](https://drone.finke.io/api/badges/sfinke/docker-tsdns/status.svg)](https://drone.finke.io/sfinke/docker-tsdns)

docker tsdns image.

## build the image:
go to checkout-folder

`cd docker-tsdns`

`docker build -t tsdns:3.0.13.3 .`

* move the service file to `/etc/systemd/system`
* `systemctl daemon-reload`
* provide `tsdns_settings.ini` in `/opt/docker/tsdns`
 * content like: `ts.example.com=1.2.3.4:9987`
* `systemctl start tsdns`
