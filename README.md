# Dagger

dagger.io SDK for Elixir. 

**CAUTION**: It's not ready for production. The library is not complete an may changes during development. Please use with caution.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `dagger_ex` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:dagger_ex, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/dagger_ex>.

## Running

Writing a script

```elixir
Mix.install([
  {:dagger_ex, github: "wingyplus/dagger_ex"}
])

Dagger.connect!()
|> Dagger.Query.container([])
|> Dagger.Container.from(address: "hexpm/elixir:1.14.4-erlang-25.3-debian-buster-20230227-slim")
|> Dagger.Container.with_exec(args: ["elixir", "--version"])
|> Dagger.Container.stdout()
|> IO.puts()
```

Then running with:

```shell
$ dagger run elixir ci.exs
```

Where `ci.exs` contains Elixir script above.
