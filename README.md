<a name="readme-top"></a>

<!-- PROJECT SHIELDS -->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/marcossilvestrini/alura-devops-training">
    <img src="images/logo.png" alt="Logo" width="80" height="80">
  </a>

<h3 align="center">alura-devops-training</h3>

  <p align="center">
    Alura Devops Training
    <br />
    <a href="https://github.com/marcossilvestrini/alura-devops-training"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/marcossilvestrini/alura-devops-training">View Demo</a>
    -
    <a href="https://github.com/marcossilvestrini/alura-devops-training/issues">Report Bug</a>
    -
    <a href="https://github.com/marcossilvestrini/alura-devops-training/issues">Request Feature</a>
  </p>
</div>

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>

<!-- ABOUT THE PROJECT -->
## About The Project

Project for share content about alura devops training

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Built With

* [![Github][Github-badge]][Github-url]
* [![GNULinux][GNULinux-badge]][GNULinux-url]
* [![Windows][Windows-badge]][Windows-url]
* [![Bash][Bash-badge]][Bash-url]
* [![Powershell][Powershell-badge]][Powershell-url]
* [![Vagrant][Vagrant-badge]][Vagrant-url]
* [![AWS][AWS-badge]][AWS-url]
* [![Terraform][Terraform-badge]][Terraform-url]
* [![Ansible][Ansible-badge]][Ansible-url]

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->
## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

***python3***

  ```sh
  #Debian\Ubuntu
  apt-get install python3
  apt install -y python3-pip

  #Centos\RHEL
  sudo dnf install python3
  yum –y install python3-pip
  ```

***terraform***

  ```sh
  #Debian\Ubuntu
  sudo apt-get update && sudo apt-get install -y gnupg software-properties-common

  #Centos\RHEL
  sudo yum install -y yum-utils
  sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
  sudo yum -y install terraform
  ```

***ansible***

  ```sh
  #Debian\Ubuntu\Centos\RHEL
  python3 -m pip install --user ansible
  ```

### Installation

1. Clone the repo

   ```sh
   git clone https://github.com/marcossilvestrini/alura-devops-training.git
   ```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- USAGE EXAMPLES -->
## Usage

Clone the repo

```sh
#HTTPS
git clone https://github.com/marcossilvestrini/alura-devops-training.git

#SSH
git clone git@github.com:marcossilvestrini/alura-devops-training.git
```

_For more examples, please refer to the [Documentation](https://github.com/marcossilvestrini/alura-devops-training)_

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ROADMAP -->
## Roadmap

* [ ] [Alura Training]()
  * [ ] [Learn virtualization and provisioning]()
    * [ ] [Infrastructure as Code: Preparing Machines on AWS with Ansible and Terraform]()
  * [ ] [Master containerization]()
  * [ ] [Learn about continuous integration and delivery]()
  * [ ] [Monitoring]()

See the [open issues](https://github.com/marcossilvestrini/alura-devops-training/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create.
Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request.
You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTACT -->
## Contact

Marcos Silvestrini - [@mrsilvestrini](https://twitter.com/mrsilvestrini) - marcos.silvestrini@gmail.com

Project Link: [https://github.com/marcossilvestrini/alura-devops-training](https://github.com/marcossilvestrini/alura-devops-training)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* [Github](https://github.com/)
* [Github Template by othneildrew](https://github.com/othneildrew/Best-README-Template)
* [Git gitignore Templates](https://github.com/github/gitignore)
* [Git Badges](https://github.com/Ileriayo/markdown-badges#usage)
* [Github Workflows](https://docs.github.com/en/actions/using-workflows/about-workflows)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/marcossilvestrini/alura-devops-training.svg?style=for-the-badge
[contributors-url]: https://github.com/marcossilvestrini/alura-devops-training/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/marcossilvestrini/alura-devops-training.svg?style=for-the-badge
[forks-url]: https://github.com/marcossilvestrini/alura-devops-training/network/members
[stars-shield]: https://img.shields.io/github/stars/marcossilvestrini/alura-devops-training.svg?style=for-the-badge
[stars-url]: https://github.com/marcossilvestrini/alura-devops-training/stargazers
[issues-shield]: https://img.shields.io/github/issues/marcossilvestrini/alura-devops-training.svg?style=for-the-badge
[issues-url]: https://github.com/marcossilvestrini/alura-devops-training/issues
[license-shield]: https://img.shields.io/github/license/marcossilvestrini/alura-devops-training.svg?style=for-the-badge
[license-url]: https://github.com/marcossilvestrini/alura-devops-training/blob/master/LICENSE
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/marcossilvestrini
[Github-badge]: https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white
[Github-url]: https://github.com/
[GNULinux-badge]: https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black
[GNULinux-url]: https://www.gnu.org/gnu/linux-and-gnu.en.html
[Windows-badge]: https://img.shields.io/badge/Windows-0078D6?style=for-the-badge&logo=windows&logoColor=white
[Windows-url]: https://www.microsoft.com/
[Bash-badge]: https://img.shields.io/badge/shell_script-%23121011.svg?style=for-the-badge&logo=gnu-bash&logoColor=white
[Bash-url]: https://www.gnu.org/software/bash/
[Powershell-badge]: https://img.shields.io/badge/PowerShell-%235391FE.svg?style=for-the-badge&logo=powershell&logoColor=white
[Powershell-url]: https://learn.microsoft.com/en-us/powershell/
[Vagrant-badge]: https://img.shields.io/badge/vagrant-%231563FF.svg?style=for-the-badge&logo=vagrant&logoColor=white
[Vagrant-url]: <https://www.vagrantup.com/>
[AWS-badge]:https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white
[AWS-url]:https://aws.amazon.com/
[Terraform-badge]: https://img.shields.io/badge/Terraform-7B42BC?style=for-the-badge&logo=terraform&logoColor=white
[Terraform-url]: https://www.terraform.io/
[Ansible-badge]: https://img.shields.io/badge/Ansible-000000?style=for-the-badge&logo=Ansible&logoColor=white
[Ansible-url]: https://www.ansible.com/
