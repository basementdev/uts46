# Uts46

UTS46 implementation with a rust nif. You'll probably want to use [hex.pm/packages/idna](https://hex.pm/packages/idna). Because the `:idna` library strictly implements IDNA2008, some UTS46-valid names will not work. See: https://github.com/benoitc/erlang-idna/pull/37

We're using a rust-nif here because i did not have the time to build a pure erl/elixir lib. PRs welcome.

<!-- ## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `uts46` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:uts46, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/uts46>. -->
