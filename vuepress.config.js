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
            { text: '01 | shell', link: '/tareas/01_shell.html' }
          ]
        }
      ]
    },
  }
