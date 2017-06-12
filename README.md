# Exthereum
# Use Elixir to control all the Ethereum Things
This library exists to present a convenient interface to control a full Ethereum node from Elixir, abstracting away the need to deal with the JSON-RPC API directly. It decodes the hex responses when necessary and functions return the idiomatic {:ok, data} | {:error, reason} tuples whenever possible. The goal is to cover the entire JSON-RPC API for Geth/Parity. This project has @specs for every function and is using Dialyzer + ExUnit.

The roadmap is to cherrypick the most commonly used functions from https://github.com/ethereum/wiki/wiki/JSON-RPC first, then fill in the blanks. I will also include some of the more commonly used Admin+Personal API functions which will require geth to be started with `--rpcapi "db,eth,net,web3,personal"` which should only be done in a safe network environment if at all.

```elixir
mix test
mix dialyzer
```

```elixir
### Currently Implemented Geth JSON-RPC methods

iex> Exthereum.client_version
{:ok, "Geth/v1.6.5-stable-cf87713d/darwin-amd64/go1.8.3"}

iex> Exthereum.sha3("0x68656c6c6f20776f726c64")
{:ok, "47173285a8d7341e5e972fc677286384f802f8ef42a5ec5f03bbfa254cb01fad"}

iex> Exthereum.net_version
{:ok, "1"}

iex> Exthereum.peer_count
{:ok, "19"}

iex> Exthereum.listening
{:ok, true}

iex> Exthereum.protocol_version
{:ok, 63}

iex> Exthereum.syncing
{:ok, false}

iex> Exthereum.coinbase
{:ok, false}

iex> Exthereum.mining
{:ok, true}

iex> Exthereum.hashrate
{:ok, "0"}

iex> Exthereum.gas_price
{:ok, 22061831512}

iex> Exthereum.accounts
{:ok, ["0x78fc2b9b6cf9b18f91037a5e0e074a479be9dca1","0x141feb71895530f537c847d62f039d9be895bd35"]}

iex> Exthereum.block_number
{:ok, 3858216}

iex> Exthereum.get_balance("0xfE8bf4ca8A6170E759E89EDB5cc9adec3e33493f") # Donations accepted :-)
{:ok, 0.4650075166583676}

## Installation
## THIS PROJECT IS NOT CURRENTLY PUBLISHED ON HEX.pm
## If [available in Hex](https://hex.pm/docs/publish), the package can be installed
## by adding `exthereum` to your list of dependencies in `mix.exs`:


def deps do
  [{:exthereum, "~> 0.1.0"}]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/exthereum](https://hexdocs.pm/exthereum).
