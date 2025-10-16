# PureScript-99

PureScript solutions to the [H-99 problems](https://wiki.haskell.org/H-99:_Ninety-Nine_Haskell_Problems).

## Setup

This project uses Nix for development environment management and purs-nix for PureScript package management.

### Prerequisites

- [Nix](https://github.com/NixOS/nix) with flakes enabled
- Optionally: [direnv](https://github.com/direnv/direnv) for automatic environment loading

### Getting Started

1. Clone this repository
2. Enter the development shell:
   ```bash
   nix develop
   ```
   Or if using direnv, just `cd` into the project directory and run `direnv allow`

3. Build the project:
   ```bash
   nix build
   ```

4. Run the main module:
   ```bash
   nix run
   ```

5. Run tests:
   ```bash
   nix flake check
   ```

6. Format code:
   ```bash
   nix fmt
   ```

## Project Structure

```
.
├── src/
│   ├── Main.purs
│   └── Problems/
│       ├── Lists.purs         # Questions 1 to 28
│       ├── Arithmetic.purs    # Questions 31 to 41
│       ├── Logic.purs         # Questions 46 to 50
│       ├── BinaryTrees.purs   # Questions 54A to 69
│       ├── MultiwayTrees.purs # Questions 70B to 73
│       ├── Graphs.purs        # Questions 80 to 89
│       └── Misc.purs          # Questions 90 to 99
└── test/
    └── Test/
        ├── Main.purs
        └── Problems/
            ├── Lists.purs         # Tests for Questions 1 to 28
            ├── Arithmetic.purs    # Tests for Questions 31 to 41
            ├── Logic.purs         # Tests for Questions 46 to 50
            ├── BinaryTrees.purs   # Tests for Questions 54A to 69
            ├── MultiwayTrees.purs # Tests for Questions 70B to 73
            ├── Graphs.purs        # Tests for Questions 80 to 89
            └── Misc.purs          # Tests for Questions 90 to 99
```

## Resources
- [H-99](https://wiki.haskell.org/H-99:_Ninety-Nine_Haskell_Problems)
