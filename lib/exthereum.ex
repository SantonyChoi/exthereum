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

      iex> Exthereum.transaction_count("0xfE8bf4ca8A6170E759E89EDB5cc9adec3e33493f")
      {:ok, 3858216}

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

  @spec peer_count :: {:ok, integer} | {:error, String.t}
  def peer_count do
    Net.peer_count
  end

  @spec listening :: {:ok, boolean} | {:error, String.t}
  def listening do
    Net.listening
  end

  @spec protocol_version :: {:ok, integer} | {:error, String.t}
  def protocol_version do
    Eth.protocol_version
  end

  @spec syncing :: {:ok, any} | {:error, String.t}
  def syncing do
    Eth.syncing
  end

  @spec coinbase :: {:ok, String.t} | {:error, String.t}
  def coinbase do
    Eth.coinbase
  end

  @spec mining :: {:ok, boolean} | {:error, String.t}
  def mining do
    Eth.mining
  end

  @spec hashrate :: {:ok, String.t} | {:error, String.t}
  def hashrate do
    Eth.hashrate
  end

  @spec gas_price :: {:ok, String.t} | {:error, String.t}
  def gas_price do
    Eth.gas_price
  end

  @spec accounts :: {:ok, List.t} | {:error, String.t}
  def accounts do
    Eth.accounts
  end

  @spec block_number :: {:ok, integer} | {:error, String.t}
  def block_number do
    Eth.block_number
  end

  @spec get_balance(String.t) :: {:ok, float} | {:error, String.t}
  def get_balance(account_hash) do
    Eth.get_balance(account_hash)
  end

  @spec get_storage_at(String.t) :: {:ok, integer} | {:error, String.t}
  def get_storage_at(hash) do
    {:error, "to_be_implemented"}
  end

  @spec transaction_count(hash :: String.t) :: {:ok, integer} | {:error, String.t}
  def transaction_count(hash) do
    Eth.transaction_count(hash)
  end

  @spec block_transaction_count_by_hash(String.t) :: {:ok, integer} | {:error, String.t}
  def block_transaction_count_by_hash(hash) do
    {:error, "to_be_implemented"}
  end

  @spec block_transaction_count_by_number(integer) :: {:ok, integer} | {:error, String.t}
  def block_transaction_count_by_number(n) do
    {:error, "to_be_implemented"}
  end

  @spec uncle_count_by_block_hash(hash) :: {:ok, integer} | {:error, String.t}
  def uncle_count_by_block_hash(hash) do
    {:error, "to_be_implemented"}
  end

  @spec uncle_count_by_block_number(integer) :: {:ok, integer} | {:error, String.t}
  def uncle_count_by_block_number(n) do
    {:error, "to_be_implemented"}
  end

 
end
