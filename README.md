# formalz-installer

This respository contains all the required files to deploy an installation of [FormalZ](https://github.com/e-ucm/Formalz).

## Simple installation

This repository contains all required files to setup a simple installation using [Vagrant](https://www.vagrantup.com/) and [VirtualBox](https://www.virtualbox.org/). So, before continuing you need to install in your machine:

- [VirtualBox](https://www.virtualbox.org/). The installation has been tested with VirtualBox 6.X.
- [Vagrant](https://www.vagrantup.com/). The installation has been tested with vagrant 2.2.X.

Once these tools are installed, then you need a copy of this respository. You can either:
1. Clone this repository and checkout the `master` branch.
```
git clone https://github.com/e-ucm/formalz-installer/
```
2. Download `formalz-installer_VERSION.tar.gz` from the [GitHub's project release page](https://github.com/e-ucm/formalz-installer/releases).

Once downloaded (and decompressed), you need to:

3. Open a terminal.
4. Change your current directory to the directory where you downloaded the project.
5. Run `vagrant up`.

This last step will take a while, once finished you can access [http://localhost:8080/admin](http://localhost:8080/admin) and start inviting teachers.

> Note: This istallation just installs FormalZ. So if you want to have access to the analytics dashboard, you need to follow the instructions of the following section.

## Installation with Analytics

Just like in the simple installation, you need to have already installed Vagrant and VirtualBox. Then you need a copy of the `nalytics` branch of this repository. You can either:

1. Clone this repository and checkout the `analytics` branch.
```
git clone https://github.com/e-ucm/formalz-installer/
git checkout -b analytics
```
1. Download a `formalz-installer_analytics-VERSION.tar.gz` from the [GitHub's project release page](https://github.com/e-ucm/formalz-installer/releases).

Once downloaded (and decompressed), you need to:

3. Open a terminal.
4. Change your current directory to the directory where you downloaded the project.
5. Run `vagrant up`.

## Hardware and Software Requirements

With the *simple* installation you require to have at least the following dedicated resources:
 * 10 GB free HDD space
 * 2 GB of RAM
 * 2 CPUs @ 2.2 GHz

With the *full* (with analytics) installation you require to have at least the following dedicated resources:
 * 20 GB free HDD space
 * 6 GB of RAM
 * 3 CPUs @ 2.2 GHz

# Patreons

A special thanks to our patreons for supporting this project:

<table>
  <tr>
    <td width="30%">
      <a href="https://www.ucm.es/" target="_blank">
        <img width="100%" src="https://www.ucm.es/themes/ucm3/media/img/logo.png" alt="Universidad Complutense de Madrid logo"/>
      </a>
    </td>
    <td width="30%">
      <a href="https://impress-project.eu/" target="_blank">
        <img width="100%" src="https://www.inesc-id.pt/wp-content/uploads/2018/01/impress_logo_703x316.png" alt="IMPRESS Logo"/>
      </a>
    </td>
    <td width="30%">
      <a href="http://erasmusplus.nl/" target="_blank">
      <img width="100%" src="https://impress-project.eu/wp-content/uploads/2017/09/eu_flag_co_funded_700x200-300x86.png" alt="Erasmus+ Program Logo"/>
    </a>
  </td>
  </tr>
</table>

# License

This project is licensed under the Apache 2.0 License - see the [LICENSE](https://github.com/e-ucm/formalz-backend-docker/blob/master/LICENSE) file for details.