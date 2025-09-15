# CLAUDE.md - Development Guidelines

This file contains project-specific instructions for Claude Code when working on this PureScript-99 project.

## Project Overview

This is a PureScript implementation of the Haskell-99 problems, organized as a personal learning project. The codebase follows functional programming principles and PureScript best practices.

## Development Environment

- **Build Tool**: Spago (configured via `spago.yaml`)
- **Development Shell**: Nix flake with PureScript toolchain
- **Package Registry**: PureScript Registry 66.4.0
- **Formatter**: purs-tidy
- **Language Server**: purescript-language-server

## Essential Commands

```bash
# Install dependencies
spago install

# Build the project
spago build

# Run the main module
spago run

# Run tests
spago test

# Format code
purs-tidy format-in-place "src/**/*.purs" "test/**/*.purs"

# Format Nix files
nixfmt *.nix

# Type check without building
spago build --no-sources
```

## Code Organization

### Module Structure
See the Project Structure section in README.md for the complete directory layout. Key modules:
- `src/Main.purs` - Entry point with basic setup
- `src/Problems/` - Solutions organized by categories:
  - `Lists.purs` - Questions 1-28 (list operations)
  - `Arithmetic.purs` - Questions 31-41 (number theory)
  - `Logic.purs` - Questions 46-50 (logic and codes)
  - `BinaryTrees.purs` - Questions 54A-69 (binary trees)
  - `MultiwayTrees.purs` - Questions 70B-73 (multiway trees)
  - `Graphs.purs` - Questions 80-89 (graphs)
  - `Misc.purs` - Questions 90-99 (miscellaneous problems)
- `test/Test/Problems/` - Test files mirroring the src structure:
  - `Lists.purs` - Tests for Questions 1-28
  - `Arithmetic.purs` - Tests for Questions 31-41
  - `Logic.purs` - Tests for Questions 46-50
  - `BinaryTrees.purs` - Tests for Questions 54A-69
  - `MultiwayTrees.purs` - Tests for Questions 70B-73
  - `Graphs.purs` - Tests for Questions 80-89
  - `Misc.purs` - Tests for Questions 90-99

### Naming Conventions
- Function names: Use descriptive camelCase (e.g., `myLast`, `elementAt`)
- Module names: PascalCase (e.g., `Problems.Lists`)
- Type names: PascalCase (e.g., `Tree`, `Graph`)

## Implementation Guidelines

### Code Style
- Use `purs-tidy` for consistent formatting
- Use `nixfmt` for consistent Nix file formatting (ALWAYS format .nix files after editing)
- Prefer pattern matching over conditional expressions
- Use `do` notation for Effect computations
- Leverage PureScript's type system (phantom types, newtypes, etc.)
- Write pure functions when possible

### Dependencies
Current dependencies in `spago.yaml`:
- `console` - for logging output
- `effect` - for side effects
- `prelude` - standard library

When adding new dependencies:
1. Check if the functionality exists in current deps
2. Add minimal, well-maintained packages
3. Update `spago.yaml` dependencies list
4. Run `spago install` to update lock file

### Testing Strategy
- Use simple assertions in test files
- Group related tests by problem categories
- Test edge cases and typical inputs
- Verify type safety through compilation

## Common Patterns

### Error Handling
- Use `Maybe` for operations that might fail
- Use `Either` for operations that need error information
- Avoid partial functions (prefer total functions)

### Performance Considerations
- Tail recursion for large datasets
- Lazy evaluation where appropriate using `Lazy` type
- Consider `Array` vs `List` based on access patterns

## Quality Checks
Before committing changes:
1. `spago build` - ensure compilation
2. `spago test` - run test suite
3. `purs-tidy format-in-place` - format PureScript code
4. `nixfmt *.nix` - format Nix files (if modified)
5. Manual review of type signatures and documentation
