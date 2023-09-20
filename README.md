# cyperf-agent-control
A simple python script that can ssh into multiple cyperf agents and run some pre-defined commands

## Starting Point
`agent-control` is the top-level program which is a very thin wrapper over `agent-control.py`. `agent-control` activates a virtual Python environment and then calls into `agent-control.py` for the actual execution of the commands.

The command details can be found by running the script with `--help` option, as shown in the following blocks.
```
[PROMPT]:~/github/cyperf-agent-control$ ./agent-control --help
Usage: agent-control [OPTIONS] COMMAND [ARGS]...

Options:
  --install-completion [bash|zsh|fish|powershell|pwsh]
                                  Install completion for the specified shell.
  --show-completion [bash|zsh|fish|powershell|pwsh]
                                  Show completion for the specified shell, to
                                  copy it or customize the installation.
  --help                          Show this message and exit.

Commands:
  reload
  set-controller
  test-interface

```
## Setting controller IP for multiple agents
```
[PROMPT]:~/github/cyperf-agent-control$ ./agent-control set-controller --help
Usage: agent-control set-controller [OPTIONS] AGENT_IPS...

Arguments:
  AGENT_IPS...  [required]

Options:
  --controller-ip TEXT  [required]
  --help                Show this message and exit.

Example:
========

[PROMPT]:~/github/cyperf-agent-control$ ./agent-control set-controller --controller-ip 10.36.75.126 10.36.75.69 10.36.75.70
Configuring agent 10.36.75.69

Controller is set successfully.

Current Configurations
  Controller:           10.36.75.126:30422
  Management Interface: ens160
  Test Interface:       ens192

Please make sure that the URL and interfaces are set correctly for the tests to run.

Portmanager service restarted.

Connecting....Connected


Configuring agent 10.36.75.70

Controller is set successfully.

Current Configurations
  Controller:           10.36.75.126:30422
  Management Interface: ens160
  Test Interface:       ens192

Please make sure that the URL and interfaces are set correctly for the tests to run.

Portmanager service restarted.

Connecting....Connected

```
## Reloading configuration for multiple agents
```
[PROMPT]:~/github/cyperf-agent-control$ ./agent-control reload --help
Usage: agent-control reload [OPTIONS] AGENT_IPS...

Arguments:
  AGENT_IPS...  [required]

Options:
  --help  Show this message and exit.

Example:
========

[PROMPT]:~/github/cyperf-agent-control$ ./agent-control reload 10.36.75.69 10.36.75.70
Configuring agent 10.36.75.69

Current Configurations
  Controller:           10.36.75.126:30422
  Management Interface: ens160
  Test Interface:       ens192

Please make sure that the URL and interfaces are set correctly for the tests to run.

Portmanager service restarted.

Connecting.....Connected


Configuring agent 10.36.75.70

Current Configurations
  Controller:           10.36.75.126:30422
  Management Interface: ens160
  Test Interface:       ens192

Please make sure that the URL and interfaces are set correctly for the tests to run.

Portmanager service restarted.

Connecting....Connected


```
## Setting test interface for multiple agents
```
[PROMPT]:~/github/cyperf-agent-control$ ./agent-control test-interface --help
Usage: agent-control test-interface [OPTIONS] AGENT_IPS...

Arguments:
  AGENT_IPS...  [required]

Options:
  --test-interface TEXT  [required]
  --help                 Show this message and exit.

Example:
========

[PROMPT]:~/github/cyperf-agent-control$ ./agent-control test-interface --test-interface auto 10.36.75.69 10.36.75.70
Configuring agent 10.36.75.69

Test Interface is set successfully.

Current Configurations
  Controller:           10.36.75.126:30422
  Management Interface: ens160
  Test Interface:       auto (Auto-detected interface is ens192)

Please make sure that the URL and interfaces are set correctly for the tests to run.
Use the following commands to explicitly set the Management and Test interfaces:
  cyperfagent interface management set <Management interface name>
  cyperfagent interface test set <Test interface name>

Portmanager service restarted.


Configuring agent 10.36.75.70

Test Interface is set successfully.

Current Configurations
  Controller:           10.36.75.126:30422
  Management Interface: ens160
  Test Interface:       auto (Auto-detected interface is ens192)

Please make sure that the URL and interfaces are set correctly for the tests to run.
Use the following commands to explicitly set the Management and Test interfaces:
  cyperfagent interface management set <Management interface name>
  cyperfagent interface test set <Test interface name>

Portmanager service restarted.


```
