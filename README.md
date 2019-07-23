# Homebrew Formulae for Funding Circle’s FLOSS Projects

This repo hosts [Homebrew][homebrew] formulae for our [FLOSS][floss] projects. It is therefore a
[Tap][tap] in Homebrew’s parlance.

The approach used here, involving a template that generates the Ruby formula files, was found in
[borkdude/homebrew-brew][borkdude-brew-repo].

There are two different ways to install the formulae in this repo:

1. By using fully qualified names:
   ```
   $ brew install fundingcircle/floss/fc4
   ```
1. By first running `brew tap` to add this repo to your local Homebrew install:
   ```
   $ brew tap fundingcircle/floss
   $ brew install fc4
   ```

[borkdude-brew-repo]: https://github.com/borkdude/homebrew-brew
[floss]: https://en.wikipedia.org/wiki/Free_and_open-source_software
[homebrew]: https://brew.sh/
[tap]: https://docs.brew.sh/Taps
