module.exports = {
    lang: 'en-US',
    title: 'Tecnólogo Informático',
    description: 'Notas sobre administración de infraestructuras, redes, etc...',
    themeConfig: {
      logo: '/tisj-icon.png',
      navbar: [
        { text: 'Inicio', link: '/' },
        { 
          text: 'Tareas', 
          children: [
            { text: '01 | git', link: '/tareas/01_git.html' },
            { text: '02 | shell', link: '/tareas/02_shell.html' },
            { text: '03 | acceso_remoto', link: '/tareas/03_acceso_remoto.html' },
            { text: '04 | editores_de_texto_y_entorno', link: '/tareas/04_editores_de_texto_y_entorno.html' },
            { text: '05 | shell_scripting', link: '/tareas/05_shell_scripting.html' },
            { text: '06 | find', link: '/tareas/06_find.html' },
            { text: '07 | apache', link: '/tareas/07_apache.html' },
            { text: '08 | instalando software', link: '/tareas/08_gestores_de_paquetes.html' },
            { text: '09 | compresión', link: '/tareas/09_compresion.html' },
            { text: '10 | cron', link: '/tareas/10_cron.html' },
            { text: '11 | LAMP', link: '/tareas/11_lamp.html' },
            { text: '12 | CMS', link: '/tareas/12_cms.html' },
            { text: '13 | shell_scripting', link: '/tareas/13_shell_scripting.html' }
          ]
        }
      ]
    },
  }
