Starting and Stopping Services

To start a systemd service, executing instructions in the service's unit file, use the start command. If you are running as a non-root user, you will have to use sudo since this will affect the state of the operating system:

sudo systemctl start application.service

As we mentioned above, systemd knows to look for *.service files for service management commands, so the command could just as easily be typed like this:

sudo systemctl start application

Although you may use the above format for general administration, for clarity, we will use the .service suffix for the remainder of the commands to be explicit about the target we are operating on.

To stop a currently running service, you can use the stop command instead:

sudo systemctl stop application.service

Restarting and Reloading

To restart a running service, you can use the restart command:

sudo systemctl restart application.service

If the application in question is able to reload its configuration files (without restarting), you can issue the reload command to initiate that process:

sudo systemctl reload application.service

If you are unsure whether the service has the functionality to reload its configuration, you can issue the reload-or-restart command. This will reload the configuration in-place if available. Otherwise, it will restart the service so the new configuration is picked up:

sudo systemctl reload-or-restart application.service

Enabling and Disabling Services

The above commands are useful for starting or stopping commands during the current session. To tell systemd to start services automatically at boot, you must enable them.
To start a service at boot, use the enable command:

sudo systemctl enable application.service

This will create a symbolic link from the system's copy of the service file (usually in /lib/systemd/system or /etc/systemd/system) into the location on disk where systemd looks for autostart files (usually /etc/systemd/system/some_target.target.wants. We will go over what a target is later in this guide).

To disable the service from starting automatically, you can type:

sudo systemctl disable application.service

This will remove the symbolic link that indicated that the service should be started automatically.

Keep in mind that enabling a service does not start it in the current session. If you wish to start the service and enable it at boot, you will have to issue both the start and enable commands.
Checking the Status of Services

To check the status of a service on your system, you can use the status command:

systemctl status application.service

This will provide you with the service state, the cgroup hierarchy, and the first few log lines.

For instance, when checking the status of an Nginx server, you may see output like this:

● nginx.service - A high performance web server and a reverse proxy server
   Loaded: loaded (/usr/lib/systemd/system/nginx.service; enabled; vendor preset: disabled)
   Active: active (running) since Tue 2015-01-27 19:41:23 EST; 22h ago
 Main PID: 495 (nginx)
   CGroup: /system.slice/nginx.service
           ├─495 nginx: master process /usr/bin/nginx -g pid /run/nginx.pid; error_log stderr;
           └─496 nginx: worker process
Jan 27 19:41:23 desktop systemd[1]: Starting A high performance web server and a reverse proxy server...
Jan 27 19:41:23 desktop systemd[1]: Started A high performance web server and a reverse proxy server.

This gives you a nice overview of the current status of the application, notifying you of any problems and any actions that may be required.

There are also methods for checking for specific states. For instance, to check to see if a unit is currently active (running), you can use the is-active command:

systemctl is-active application.service

This will return the current unit state, which is usually active or inactive. The exit code will be "0" if it is active, making the result simpler to parse programmatically.
To see if the unit is enabled, you can use the is-enabled command:

systemctl is-enabled application.service

This will output whether the service is enabled or disabled and will again set the exit code to "0" or "1" depending on the answer to the command question.

A third check is whether the unit is in a failed state. This indicates that there was a problem starting the unit in question:

systemctl is-failed application.service

This will return active if it is running properly or failed if an error occurred. If the unit was intentionally stopped, it may return unknown or inactive. An exit status of "0" indicates that a failure occurred and an exit status of "1" indicates any other status.
