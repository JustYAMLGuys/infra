# Guide

## asdf

We are using asdf to manage multiple runtime versions

1. [Install asdf](https://asdf-vm.com/guide/getting-started.html#_3-install-asdf)
2. Install asdf plugin: ```asdf plugin add <name> [<git-url>]```
3. Install current tool version: ```asdf install```
4. List installed plugin: ```asdf plugin list```

More useful command on asdf -> [HERE](https://asdf-vm.com/manage/commands.html)

___

## pre-commit

Pre-commit is a powerful tool for executing a range of hooks prior to making commits to your Git history. This is useful because it means you can automatically run a range of linting tools on your code across an array of languages to ensure your code is up-to-scratch before you make the commit.

We're using pre-commit to keep our terraform code clean and lean

1. [Install pre-commit](https://pre-commit.com/)
2. Launch a pre-commit before committing (on staged file) ```pre-commit run```
3. Launch pre-commit and move unstaged file in stage: ```pre-commit run -a```

Here are the checks we do with pre-commit
- **terraform_fmt used** to format your configuration files into a canonical format and style
- **terraform_validate**: this command validates the configuration files in a directory
- **terraform_tflint**: Find possible errors (like invalid instance types) for Major Cloud providers (AWS/Azure/GCP).
Warn about deprecated syntax, unused declarations.
Enforce best practices, naming conventions.
- **terraform_docs**: To automatically write READMEs relating to individual modules to have a global view of the resources involved, the inputs and outputs

We also add some check on yaml, check on whitespaces and end of file and other check to make sure that no too large files are pushed to git.

___

## direnv

direnv is an extension for your shell. It augments existing shells with a new feature that can load and unload environment variables depending on the current directory.

Follow [this link](https://direnv.net/) to install direnv on your client
