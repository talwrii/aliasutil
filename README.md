# aliasutil

Persistent aliases for `zsh` and `bash`. Aliases are reloaded at startup.

Inspired by [https://unix.stackexchange.com/questions/47341/are-there-any-utilities-to-quickly-add-list-and-remove-command-aliases](stack exchange).

# Installation

Download this git repository and source `aliasutil.sh`.

Alternatively you can use zplug (with zsh)

```
    source /usr/share/zplug/init.zsh
    zplug talwrii/aliasutil
    zplug install
    zplug load
```


# Usage

Add the following to your `bashrc` or `zshrc`

```
source aliasutil.sh
aliasutil load
```

Thereafter calls like `aliasutil add hello='echo hello'` will create an alias that is reloaded in every shell.

If you are brave you can transparently make alias persist using `aliasutil replace-alias`.

Other commands

- `aliasutil remove` -- delete an alias
- `aliasutil list` -- list all persisted aliases
- `aliasutil load` -- remove aliases (for example for other shells)


# Prior work and influences

- A stack overflow post discussing this issue https://unix.stackexchange.com/questions/47341/are-there-any-utilities-to-quickly-add-list-and-remove-command-aliases
- `zshnip` (by author)


