#!/bin/bash

yarn run docs:build

rsync -av .vuepress/dist/ maske@tecnologoinformatico.com:/var/www/tecnologoinformatico.com/