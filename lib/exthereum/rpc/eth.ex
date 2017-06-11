defmodule Exthereum.Eth do
  use Exthereum.Transport
  alias Exthereum.Conversion

  @eth_server_url Application.get_env(:exthereum, :eth_server_url)


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
