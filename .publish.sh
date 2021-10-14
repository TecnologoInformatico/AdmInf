#!/bin/bash

yarn run build

rsync -av .vuepress/dist/ maske@tecnologoinformatico.com:/var/www/tecnologoinformatico.com/