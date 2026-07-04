@echo off
title Redis Server
cd /d D:\ZZJ251109\Tools\Redis\Redis-x64-5.0.14.1
echo Starting Redis with config...
redis-server.exe redis.windows.conf
pause
