# Nala Installer for Proxmox - README

<br />
<div align="center">
  <h3 align="center">Nala Installer for Proxmox</h3>
  <p align="center">
    Automate the installation of Nala on Proxmox systems. This bash script is inspired by the <a href="https://christitus.com/stop-using-apt/" target="_blank">Chris Titus Tech, "Stop Using APT" Article</a> and utilises the excellent Nala package manager from its project source at <a href="https://gitlab.com/volian/nala" target="_blank">Volian's Nala GitLab Repository</a>.
    <br />
  </p>
</div>

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#about-the-project">About The Project</a></li>
    <li><a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
  </ol>
</details>

<!-- ABOUT THE PROJECT -->
## About The Project

![Nala Installer for Proxmox][product-screenshot]

This project provides a Bash script for the automated installation of Nala, an advanced package manager, on Proxmox systems. It's designed for those who want to take advantage of Nala's features like faster package downloads, beautiful update display, and easy rollbacks.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Built With
This project is built with:
* Bash Scripting

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Getting Started

### Prerequisites
This script is designed to run on Proxmox systems. Ensure you have administrative access to the system where you intend to install Nala.

### Installation
To install Nala using the one-liner command, execute the following in your terminal:

#### Wget Installation
```sh 
wget -O - https://github.com/chillskellingtom/nala-installer-proxmox/raw/main/nala_installer.sh | sudo bash
```

### Curl Installation

```sh 
curl -s https://github.com/chillskellingtom/nala-installer-proxmox/raw/main/nala_installer.sh | sudo bash
```

These commands will download the nala_installer.sh script from your GitHub repository and execute it with root privileges.

Important Notes:

* Security Warning: Running scripts in this manner can be risky because it executes code directly from the internet. Users should trust the source (in this case, your GitHub repository) before executing such commands.
* Hosting the Script: The URLs provided in the commands assume that your script is hosted at https://github.com/chillskellingtom/nala-installer-proxmox/raw/main/nala_installer.sh. Replace chillskellingtom and the path with the actual URL where your script is hosted.
* Permissions: The script is executed as root, which is necessary for installing packages and modifying system files.
* Direct Execution: This approach skips the manual steps of cloning the repo, changing directories, and making the script executable. It directly fetches and runs the script.
<p align="right">(<a href="#readme-top">back to top</a>)</p>


