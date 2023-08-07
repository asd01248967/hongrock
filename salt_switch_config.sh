#!/bin/bash

echo "請輸入您的選擇："
echo "1. 快速切換進入維護頁面,切換完成後記得下發fabu_cluster.sh腳本"
echo "2. 快速切換進入主站頁面,切換完成後記得下發fabu_cluster.sh腳本，並清CDN快取"

read choice

cd /srv/salt/nginx/A05_nginx_cluster/files/conf/vhost/

if [ $choice -eq 1 ]; then
    mv a05_frontend_app.conf        a05_frontend_app.conf.bak       && mv za05_frontend_app.conf.bak         za05_frontend_app.conf
    mv a05_frontend_web_agent.conf  a05_frontend_web_agent.conf.bak && mv za05_frontend_web_agent.conf.bak   za05_frontend_web_agent.conf
    mv a05_frontend_web.conf        a05_frontend_web.conf.bak       && mv za05_frontend_web.conf.bak         za05_frontend_web.conf
    mv a05_frontend_web_vip.conf    a05_frontend_web_vip.conf.bak   && mv za05_frontend_web_vip.conf.bak     za05_frontend_web_vip.conf
    if [ $? -eq 0 ]; then
        echo "配置已經切換完成"
    else
        echo "配置切換失敗"
    fi
elif [ $choice -eq 2 ]; then
    mv a05_frontend_app.conf.bak        a05_frontend_app.conf        && mv za05_frontend_app.conf        za05_frontend_app.conf.bak
    mv a05_frontend_web_agent.conf.bak  a05_frontend_web_agent.conf  && mv za05_frontend_web_agent.conf  za05_frontend_web_agent.conf.bak
    mv a05_frontend_web.conf.bak        a05_frontend_web.conf        && mv za05_frontend_web.conf        za05_frontend_web.conf.bak
    mv a05_frontend_web_vip.conf.bak    a05_frontend_web_vip.conf    && mv za05_frontend_web_vip.conf    za05_frontend_web_vip.conf.bak
    if [ $? -eq 0 ]; then
        echo "配置已經切換完成"
    else
        echo "配置切換失敗"
    fi
else
    echo "無效的選擇"
fi
