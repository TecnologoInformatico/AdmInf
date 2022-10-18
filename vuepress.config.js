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
            { text: '05 | Shell scripting', link: '/tareas/05_shell_scripting.html' },
            { text: '06 | Apache', link: '/tareas/06_apache.html' },
            { text: '07 | Usuarios', link: '/tareas/07_permisos_usuarios_y_grupos.html' },
            { text: '08 | Instalar software', link: '/tareas/08_gestores_de_paquetes.html' },
          ]
        }
      ]
    },
  }
