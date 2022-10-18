# Instalación de aplicaciones

[🔗 Tarea 08 | Instalación de aplicaciones](https://classroom.github.com/a/-K3U0yvI)

1. Actualice el listado de repositorios
2. Liste los paquetes que tienen actualizaciones disponibles.
3. Actualice el software.
4. Instale el paquete `cowsay` mediante `apt`.
5. Descargue el paquete .deb bat, (https://github.com/sharkdp/bat/releases/download/v0.22.1/bat-musl_0.22.1_amd64.deb)
6. Instale bat mediante el comando `dpkg`

## certbot

1. Instale certbot:
  `sudo apt install certbot python3-certbot-apache`
2. Habilite el tráfico en la red para las conexiones TCP entrantes hacia el puerto 443.
3. Habilite el tráfico para HTTPS en el firewall (iptables) de la instancia.
   1. `sudo iptables -I INPUT 6 -m state --state NEW -p tcp --dport 443 -j ACCEPT`
   2. `sudo netfilter-persistent save`
4. Configure certbot para ser utilizado con apache y active https en su virtualhost.
  `sudo certbot --apache`
5. Comprobar el estado del daemon certbot
  `systemctl status certbot.timer`
6. Testear el proceso de renovación
  `sudo certbot renew --dry-run`

## node.js

1. Instale nodejs en el sistema mediante un gestor de paquetes.
2. Verifique la versión instalada.
3. Investigue y documente el modo de instalar una versión diferente a la que otorga el repositorio por defecto.

## Enlaces

- [nodejs nvm](https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-20-04)
- [letsencrypt](https://letsencrypt.org)
- [certbot](https://eff-certbot.readthedocs.io/en/stable/)
