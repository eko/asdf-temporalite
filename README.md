[![Test](https://github.com/eko/asdf-temporalite/actions/workflows/test.yml/badge.svg)](https://github.com/eko/asdf-temporalite/actions/workflows/test.yml)

# asdf-temporalite

[Temporalite](https://github.com/temporalio/temporalite) plugin for [asdf](https://github.com/asdf-vm/asdf) version manager.

## Installation

```bash
$ asdf plugin-add temporalite https://github.com/eko/asdf-temporalite.git
$ asdf list all temporalite
$ asdf install temporalite latest
```

## Usage

Check out the [asdf documentation](https://asdf-vm.com/#/core-manage-versions?id=install-version) for instructions on how to install and manage versions.

## Architecture Override

The `ASDF_TEMPORALITE_OVERWRITE_ARCH` variable can be used to override the architecture that is used for determining which `temporalite` build to download. The primary use case is when attempting to install an older version of `temporalite` for use on an Apple M1 computer as `temporalite` was not built for ARM at the time.

### Without `ASDF_TEMPORALITE_OVERWRITE_ARCH`:

```
$ asdf install temporalite 0.3.0
```

### With `ASDF_TEMPORALITE_OVERWRITE_ARCH`:

```
$ ASDF_TEMPORALITE_OVERWRITE_ARCH=arm64 asdf install temporalite 0.3.0
```

