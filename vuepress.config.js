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
            { text: '00 | Cuestionario', link: '/tareas/00_cuestionario.html' },
            { text: '01 | shell', link: '/tareas/01_shell.html' },
            { text: '02 | git', link: '/tareas/02_git.html' },
            { text: '03 | Acceso remoto', link: '/tareas/03_acceso_remoto.html' },
            { text: '04 | Editores de texto y entorno', link: '/tareas/04_editores_de_texto_y_entorno.html' },
          ]
        }
      ]
    },
  }
