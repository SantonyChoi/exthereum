# Exthereum

The goal is to cover the entire JSON-RPC for Geth/Parity API and to keep it clean with @specs for every function etc. This project is using Dialyzer + ExUnit

```elixir
mix test
mix dialyzer
```

```elixir
iex> Exthereum.get_version
{:ok, "Geth/v1.6.5-stable-cf87713d/darwin-amd64/go1.8.3"}

iex> Exthereum.get_balance("0xfE8bf4ca8A6170E759E89EDB5cc9adec3e33493f") # Feel free to donate to this address :-)
{:ok, 0.4650075166583676}
```
## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `exthereum` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:exthereum, "~> 0.1.0"}]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/exthereum](https://hexdocs.pm/exthereum).
