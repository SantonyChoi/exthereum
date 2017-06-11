defmodule Exthereum do
  alias Exthereum.Web3
  alias Exthereum.Eth
  alias Exthereum.Net
  @moduledoc """
  Documentation for Exthereum.
  """

  @doc """
  Get Version

  ## Examples

      iex> Exthereum.client_version
      {:ok, "Geth/v1.6.5-stable-cf87713d/darwin-amd64/go1.8.3"}

      iex> Exthereum.sha3("0x68656c6c6f20776f726c64")
      {:ok, "47173285a8d7341e5e972fc677286384f802f8ef42a5ec5f03bbfa254cb01fad"}

      iex> Exthereum.net_version
      {:ok, "1"}

      iex> Exthereum.get_balance("0xfE8bf4ca8A6170E759E89EDB5cc9adec3e33493f") # Donations accepted :-)
      {:ok, 0.4650075166583676}

  """
  @spec client_version :: {:ok, String.t} | {:error, String.t}
  def client_version do
    Web3.client_version
  end

  @spec sha3(String.t) :: {:ok, String.t} | {:error, String.t}
  def sha3(str_to_hash) do
    Web3.sha3(str_to_hash)
  end

  @spec net_version :: {:ok, String.t} | {:error, String.t}
  def net_version do
    Net.version
  end

  @spec get_balance(String.t) :: {:ok, float} | {:error, String.t}
  def get_balance(account_hash) do
    Eth.get_balance(account_hash)
  end
end
