#!/bin/sh

# Edit central todo-file by ssh
ssh -t -p 12344 adc@susanoganders.dk 'screen -rd todo'
