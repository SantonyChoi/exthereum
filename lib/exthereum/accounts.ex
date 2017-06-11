defmodule Exthereum.Accounts do
  require IEx
  alias Exthereum.Conversion

  @eth_server_url "http://localhost:8545"


  @spec unhex(String.t) :: String.t
  def unhex ("0x"<>str) do
    str
  end

  @spec get_version :: {:ok, String.t} | {:error, String.t}
  def get_version do
    case __MODULE__.send("web3_clientVersion") do
      {:ok, version} ->
        {:ok, version}
      {:error, reason} ->
        {:error, reason}
    end
  end

  @spec send(method :: String.t, params :: map) :: {:ok, map} | {:error, String.t}
  def send(method, params \\ %{}) do
    enc = %{"method": method, "params": params, "id": 0}
      |> Poison.encode!
    resp = HTTPoison.post!(@eth_server_url, enc)
    case Poison.decode(resp.body) do
      {:ok, body} ->
        {:ok, unhex(body["result"])}
      _ ->
        {:error, "bad_response"}
    end
  end

  @spec get_balance(String.t) :: {:ok, float} | {:error, String.t}
  def get_balance(account_hash) do
    case __MODULE__.send("eth_getBalance",[account_hash, "latest"]) do
      {:ok, wei_val} ->
        ether_val = wei_val
        |> Hexate.to_integer
        |> Conversion.wei_to_eth
        {:ok, ether_val}
      {:error, reason} ->
        {:error, reason}
    end
  end

end
