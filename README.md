# seed

`seed` is a tool for bootstrapping my personal development environment onto physical, remote, or virtual machines. It automates both the installation and configuration of tooling.

## How it works
Each file in the [modules](modules) directory manages the installation and configuration of a particular tool by implementing mandatory `install` and `configure` hooks. The `configure` hooks leverage [GNU Stow](https://www.gnu.org/software/stow/) to symbolically link configuration files to the home directory while the `install` hooks leverage standard packaging & build tools.

## Requirements
You must be running `Ubuntu 22.04.3 LTS`. Any Debian-based operating system ought to suffice, but proceed at your own risk.

## Usage
### Running `seed`
```
chmod +x seed.sh
./seed.sh
sudo chsh -s $(which zsh)
```

### Adding a new module
To add a new module, clone the empty module and implement the hooks.
```
cp template.sh modules/my-tool.sh
vim modules/my-tool.sh
```

### Adapting `seed` for your own use
#### Hard reset
If you want to use `seed` to deploy your own development environment, simply clear out the `configurations` and `modules` directories. Then follow [adding a new module](#adding-a-new-module) to onboard your own tooling.
```
rm -r configurations/*
rm -r modules/*
```

#### Copy configurations only
If you only want to reuse my configurations, you can use [GNU Stow](https://www.gnu.org/software/stow/) directly in the `configurations` directory to symlink the configuration files to your home directory:

```
stow -t "$HOME" vim
stow -t "$HOME" git
stow -t "$HOME" zsh
```

## License
See [LICENSE](LICENSE).
