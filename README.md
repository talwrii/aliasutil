# aliasutil

Persistent aliases for `zsh` and `bash` without having to use an editor.

Inspired by [this stack exchange question](https://unix.stackexchange.com/questions/47341/are-there-any-utilities-to-quickly-add-list-and-remove-command-aliases).

# Installation

Use one of the following:


## 1. Raw installation for bash; or

```
git clone https://github.com/talwrii/aliasutil ~/aliasutil
echo source ~/aliasutil/aliasutil.sh >> ~/.bashrc
```

## 2. Raw installation for zsh; or

```
git clone https://github.com/talwrii/aliasutil ~/aliasutil
echo source ~/aliasutil/aliasutil.zsh >> ~/.zshrc
```

## 3. zplug installation for zsh

```
    source /usr/share/zplug/init.zsh
    zplug talwrii/aliasutil
    zplug install
    zplug load
    echo "zplug load" >> ~/.zshrc
```

# Usage

Run (or add to your init file (`~/.zshrc` or `~/.bashrc`)).

```
source aliasutil.sh
aliasutil load
```

Thereafter you can run

`aliasutil add hello='echo hello'`

to create a snippet that is saved and restored.

## Transparently persisted aliases

If you are brave, you can transparently make `alias` by calling `aliasutil replace-alias`.

This will replace `alias` with `aliasutil add`

## Other commands

- `aliasutil remove` -- delete an alias
- `aliasutil list` -- list all persisted aliases
- `aliasutil load` -- remove aliases (for example for other shells)


# Prior work and influences

- A stack overflow post discussing this issue https://unix.stackexchange.com/questions/47341/are-there-any-utilities-to-quickly-add-list-and-remove-command-aliases

- `zshnip` (by author) provides snippets rather than aliases.
