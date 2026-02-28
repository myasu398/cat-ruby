# cat-ruby
Cloned the cat command using Ruby

## Usage

```bash
$ bin/cat [options] [file ...]
$ bin/cat tests/example.txt
$ bin/cat -n tests/example.txt
$ bin/cat -b tests/example.txt
$ bin/cat -s tests/example.txt
```

## Supported options
- `-n`: number all output lines
- `-b`: number non-blank output lines (`-n` より優先)
- `-s`: squeeze multiple adjacent blank lines into one

## Not yet supported
- `-E` / `--show-ends`
- `-T` / `--show-tabs`
- `-v` (display non-printing)
- `-u` (disable output buffering)

## Tests

```bash
$ ruby tests/cat.rb
```

## Type check (RBS/Steep)

```bash
$ bundle install
$ bundle exec steep check
```
