@echo off
%~dp0\FXServer +set citizen_dir %~dp0\citizen\ %*
run.cmd +exec server.cfg