# Dockerized Voila compatible with QGrid

## Context

[Voila](https://github.com/voila-dashboards/voila) is a software that "turns Jupyter notebooks into standalone web 
applications."

[QGrid](https://github.com/quantopian/qgrid) is "a Jupyter notebook widget which uses SlickGrid to render
pandas DataFrames within a Jupyter notebook."

By combining both of them, you can prototype and deploy internal tools very quickly. The features of qgrid are
especially useful if you want to provide a "spreadsheet-like" experience where the users can quickly  sort and filter
columns, without having any programming knowledge (e.g pandas dataframe mask ...).

## Issue

Voila and QGrid often have compatibility problems 
(https://github.com/voila-dashboards/voila/issues/72, https://github.com/quantopian/qgrid/issues/358) and fixing them
require to deep dive into qgrid/voila js scripts.

## Solution
This image offer an plug-and-play solution, where it downloads the correct version of voila and qgrid, then applies
the patch detailed by @jeffyjefflabs (https://github.com/voila-dashboards/voila/issues/72#issuecomment-696356918) and
start the voila server.

## Usage
Example notebooks and a docker-compose file are available to speed up deployment process.

```docker-compose up -d``` to start the example

You can adjust the directory from which notebooks are read from by adjusting the docker-compose.yml

## Warning
For deployment in production, it is recommended by voila to use a reverse proxy to secure up voila (and eventually
setup HTTPS). A good option would be NGINX through 
[Nginx Proxy Manager](https://github.com/NginxProxyManager/nginx-proxy-manager) and you can then user docker networks.