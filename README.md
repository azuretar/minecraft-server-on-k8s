# Deploying Minecraft server network on Azure Kubernetes Service
Running a regular Minecraft server infrastructure (Bungeecord with PaperMC) on Azure
Kubernetes Service. This is the git repository for
[Deploying Minecraft server network on Azure Kubernetes Service](https://azuretar.com/deploying-minecraft-server-network-on-azure-kubernetes-service/).

# Dockerfiles
These Dockerfiles are tested on production. They provide capabilities to:

* De-elevate to the user running the `docker` command. This allows better file
  permissions handling.
* Uses OpenJ9 (Java 8). OpenJ9 is generally a better and more modern JVM
  implementation which allows more possibility when debugging as well. I'm
  no Java expert, just personal preference.
* `eula` environment variable to automatically accept Mojang EULA.

Do note that we are not responsible of the consequences of using our guide/code/configuration.

# LICENSE
This work is released under MIT license.

```
Copyright 2020 Birkhoff Lee, Jorge Arteiro

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

```
