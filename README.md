About nest-simulator
====================

Home: http://www.nest-simulator.org/

Package license: GPL-2.0-only

Feedstock license: [BSD-3-Clause](https://github.com/conda-forge/nest-simulator-feedstock/blob/master/LICENSE.txt)

Summary: NEST is a simulator for spiking neural network models that focuses on the dynamics, size and structure of neural
systems rather than on the exact morphology of individual neurons.


Development: https://github.com/nest/nest-simulator

Documentation: https://nest-simulator.readthedocs.io/en/latest/

You can use NEST either as a for the interpreted programming language Python (PyNEST) or as a stand alone
application (nest). PyNEST provides a set of commands to the Python interpreter which give you access to NEST's
simulation kernel. With these commands, you describe and run your network simulation. You can also complement
PyNEST with PyNN, a simulator-independent set of Python commands to formulate and run neural simulations. While
you define your simulations in Python, the actual simulation is executed within NEST's highly optimized
simulation kernel which is written in C++. A NEST simulation tries to follow the logic of an
electrophysiological experiment that takes place inside a computer with the difference, that the neural system
to be investigated must be defined by the experimenter. The neural system is defined by a possibly large number
of neurons and their connections. In a NEST network, different neuron and synapse models can coexist. Any two
neurons can have multiple connections with different properties. Thus, the connectivity can in general not
be described by a weight or connectivity matrix but rather as an adjacency list. To manipulate or observe the
network dynamics, the experimenter can define so-called devices which represent the various instruments (for
measuring and stimulation) found in an experiment. These devices write their data either to memory or to file.
NEST is extensible and new models for neurons, synapses, and devices can be added. To get started with NEST,
please see the documentation page <https://nest-simulator.org/documentation/>.


Current build status
====================


<table>
    
  <tr>
    <td>Azure</td>
    <td>
      <details>
        <summary>
          <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=6582&branchName=master">
            <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/nest-simulator-feedstock?branchName=master">
          </a>
        </summary>
        <table>
          <thead><tr><th>Variant</th><th>Status</th></tr></thead>
          <tbody><tr>
              <td>linux_64_mpinompipython3.6.____73_pypy</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=6582&branchName=master">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/nest-simulator-feedstock?branchName=master&jobName=linux&configuration=linux_64_mpinompipython3.6.____73_pypy" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>linux_64_mpinompipython3.6.____cpython</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=6582&branchName=master">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/nest-simulator-feedstock?branchName=master&jobName=linux&configuration=linux_64_mpinompipython3.6.____cpython" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>linux_64_mpinompipython3.7.____cpython</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=6582&branchName=master">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/nest-simulator-feedstock?branchName=master&jobName=linux&configuration=linux_64_mpinompipython3.7.____cpython" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>linux_64_mpinompipython3.8.____cpython</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=6582&branchName=master">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/nest-simulator-feedstock?branchName=master&jobName=linux&configuration=linux_64_mpinompipython3.8.____cpython" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>linux_64_mpinompipython3.9.____cpython</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=6582&branchName=master">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/nest-simulator-feedstock?branchName=master&jobName=linux&configuration=linux_64_mpinompipython3.9.____cpython" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>linux_64_mpiopenmpipython3.6.____73_pypy</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=6582&branchName=master">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/nest-simulator-feedstock?branchName=master&jobName=linux&configuration=linux_64_mpiopenmpipython3.6.____73_pypy" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>linux_64_mpiopenmpipython3.6.____cpython</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=6582&branchName=master">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/nest-simulator-feedstock?branchName=master&jobName=linux&configuration=linux_64_mpiopenmpipython3.6.____cpython" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>linux_64_mpiopenmpipython3.7.____cpython</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=6582&branchName=master">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/nest-simulator-feedstock?branchName=master&jobName=linux&configuration=linux_64_mpiopenmpipython3.7.____cpython" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>linux_64_mpiopenmpipython3.8.____cpython</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=6582&branchName=master">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/nest-simulator-feedstock?branchName=master&jobName=linux&configuration=linux_64_mpiopenmpipython3.8.____cpython" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>linux_64_mpiopenmpipython3.9.____cpython</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=6582&branchName=master">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/nest-simulator-feedstock?branchName=master&jobName=linux&configuration=linux_64_mpiopenmpipython3.9.____cpython" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>osx_64_mpinompipython3.6.____73_pypy</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=6582&branchName=master">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/nest-simulator-feedstock?branchName=master&jobName=osx&configuration=osx_64_mpinompipython3.6.____73_pypy" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>osx_64_mpinompipython3.6.____cpython</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=6582&branchName=master">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/nest-simulator-feedstock?branchName=master&jobName=osx&configuration=osx_64_mpinompipython3.6.____cpython" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>osx_64_mpinompipython3.7.____cpython</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=6582&branchName=master">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/nest-simulator-feedstock?branchName=master&jobName=osx&configuration=osx_64_mpinompipython3.7.____cpython" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>osx_64_mpinompipython3.8.____cpython</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=6582&branchName=master">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/nest-simulator-feedstock?branchName=master&jobName=osx&configuration=osx_64_mpinompipython3.8.____cpython" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>osx_64_mpinompipython3.9.____cpython</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=6582&branchName=master">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/nest-simulator-feedstock?branchName=master&jobName=osx&configuration=osx_64_mpinompipython3.9.____cpython" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>osx_64_mpiopenmpipython3.6.____73_pypy</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=6582&branchName=master">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/nest-simulator-feedstock?branchName=master&jobName=osx&configuration=osx_64_mpiopenmpipython3.6.____73_pypy" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>osx_64_mpiopenmpipython3.6.____cpython</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=6582&branchName=master">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/nest-simulator-feedstock?branchName=master&jobName=osx&configuration=osx_64_mpiopenmpipython3.6.____cpython" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>osx_64_mpiopenmpipython3.7.____cpython</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=6582&branchName=master">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/nest-simulator-feedstock?branchName=master&jobName=osx&configuration=osx_64_mpiopenmpipython3.7.____cpython" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>osx_64_mpiopenmpipython3.8.____cpython</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=6582&branchName=master">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/nest-simulator-feedstock?branchName=master&jobName=osx&configuration=osx_64_mpiopenmpipython3.8.____cpython" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>osx_64_mpiopenmpipython3.9.____cpython</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=6582&branchName=master">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/nest-simulator-feedstock?branchName=master&jobName=osx&configuration=osx_64_mpiopenmpipython3.9.____cpython" alt="variant">
                </a>
              </td>
            </tr>
          </tbody>
        </table>
      </details>
    </td>
  </tr>
</table>

Current release info
====================

| Name | Downloads | Version | Platforms |
| --- | --- | --- | --- |
| [![Conda Recipe](https://img.shields.io/badge/recipe-nest--simulator-green.svg)](https://anaconda.org/conda-forge/nest-simulator) | [![Conda Downloads](https://img.shields.io/conda/dn/conda-forge/nest-simulator.svg)](https://anaconda.org/conda-forge/nest-simulator) | [![Conda Version](https://img.shields.io/conda/vn/conda-forge/nest-simulator.svg)](https://anaconda.org/conda-forge/nest-simulator) | [![Conda Platforms](https://img.shields.io/conda/pn/conda-forge/nest-simulator.svg)](https://anaconda.org/conda-forge/nest-simulator) |

Installing nest-simulator
=========================

Installing `nest-simulator` from the `conda-forge` channel can be achieved by adding `conda-forge` to your channels with:

```
conda config --add channels conda-forge
```

Once the `conda-forge` channel has been enabled, `nest-simulator` can be installed with:

```
conda install nest-simulator
```

It is possible to list all of the versions of `nest-simulator` available on your platform with:

```
conda search nest-simulator --channel conda-forge
```


About conda-forge
=================

[![Powered by NumFOCUS](https://img.shields.io/badge/powered%20by-NumFOCUS-orange.svg?style=flat&colorA=E1523D&colorB=007D8A)](http://numfocus.org)

conda-forge is a community-led conda channel of installable packages.
In order to provide high-quality builds, the process has been automated into the
conda-forge GitHub organization. The conda-forge organization contains one repository
for each of the installable packages. Such a repository is known as a *feedstock*.

A feedstock is made up of a conda recipe (the instructions on what and how to build
the package) and the necessary configurations for automatic building using freely
available continuous integration services. Thanks to the awesome service provided by
[CircleCI](https://circleci.com/), [AppVeyor](https://www.appveyor.com/)
and [TravisCI](https://travis-ci.com/) it is possible to build and upload installable
packages to the [conda-forge](https://anaconda.org/conda-forge)
[Anaconda-Cloud](https://anaconda.org/) channel for Linux, Windows and OSX respectively.

To manage the continuous integration and simplify feedstock maintenance
[conda-smithy](https://github.com/conda-forge/conda-smithy) has been developed.
Using the ``conda-forge.yml`` within this repository, it is possible to re-render all of
this feedstock's supporting files (e.g. the CI configuration files) with ``conda smithy rerender``.

For more information please check the [conda-forge documentation](https://conda-forge.org/docs/).

Terminology
===========

**feedstock** - the conda recipe (raw material), supporting scripts and CI configuration.

**conda-smithy** - the tool which helps orchestrate the feedstock.
                   Its primary use is in the construction of the CI ``.yml`` files
                   and simplify the management of *many* feedstocks.

**conda-forge** - the place where the feedstock and smithy live and work to
                  produce the finished article (built conda distributions)


Updating nest-simulator-feedstock
=================================

If you would like to improve the nest-simulator recipe or build a new
package version, please fork this repository and submit a PR. Upon submission,
your changes will be run on the appropriate platforms to give the reviewer an
opportunity to confirm that the changes result in a successful build. Once
merged, the recipe will be re-built and uploaded automatically to the
`conda-forge` channel, whereupon the built conda packages will be available for
everybody to install and use from the `conda-forge` channel.
Note that all branches in the conda-forge/nest-simulator-feedstock are
immediately built and any created packages are uploaded, so PRs should be based
on branches in forks and branches in the main repository should only be used to
build distinct package versions.

In order to produce a uniquely identifiable distribution:
 * If the version of a package **is not** being increased, please add or increase
   the [``build/number``](https://conda.io/docs/user-guide/tasks/build-packages/define-metadata.html#build-number-and-string).
 * If the version of a package **is** being increased, please remember to return
   the [``build/number``](https://conda.io/docs/user-guide/tasks/build-packages/define-metadata.html#build-number-and-string)
   back to 0.

Feedstock Maintainers
=====================

* [@steffengraber](https://github.com/steffengraber/)

