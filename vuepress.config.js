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
            { text: '01 | git', link: '/tareas/01_git.md' },
            { text: '02 | shell', link: '/tareas/02_shell.md' },
            { text: '03 | acceso_remoto', link: '/tareas/03_acceso_remoto.md' },
            { text: '04 | editores_de_texto_y_entorno', link: '/tareas/04_editores_de_texto_y_entorno.md' },
            { text: '05 | shell_scripting', link: '/tareas/05_shell_scripting.md' },
            { text: '06 | find', link: '/tareas/06_find.md' },
            { text: '07 | apache', link: '/tareas/07_apache.md' },
            { text: '08 | instalando software', link: '/tareas/08_gestores_de_paquetes.md' },
            { text: '09 | compresión', link: '/tareas/09_compresion.md' },
            { text: '10 | cron', link: '/tareas/10_cron.md' },
            { text: '11 | LAMP', link: '/tareas/11_lamp.md' }
          ]
        }
      ]
    },
  }
