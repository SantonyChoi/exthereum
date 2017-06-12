defmodule Exthereum.Personal do
  use Exthereum.Transport
  alias Exthereum.Conversion
  require IEx
@moduledoc """
This could be considered dangerous as it requires the admin api to be exposed over JSON-RPC
but I am doing it anyway.
"""

  @spec new_account(password :: String.t, password_confirmation :: String.t) :: {:ok, String.t} | {:error, String.t}
  def new_account(password, password_confirmation) do
    case __MODULE__.send("personal_newAccount",[password]) do
      {:ok, account_hash} ->
        {:ok, account_hash}
      {:error, reason} ->
        {:error, reason}
    end
  end

  @spec unlock_account(account :: String.t, password :: String.t) :: {:ok, boolean} | {:error, String.t}
  def unlock_account(account, password) do
    case __MODULE__.send("personal_unlockAccount", [account, password]) do
      {:ok, result} ->
        {:ok, result}
      {:error, reason} ->
        {:error, reason}
    end
  end

  @spec lock_account(account :: String.t) :: {:ok, boolean} | {:error, String.t}
  def lock_account(account) do
    case __MODULE__.send("personal_lockAccount", [account]) do
      {:ok, result} ->
        {:ok, result}
      {:error, reason} ->
        {:error, reason}
    end
  end

  @spec send_transaction(from :: String.t, to :: String, value :: float, password :: String.t) :: {:ok, boolean} | {:error, String.t}
  def send_transaction(from, to, value, password) do
    wei_value = Conversion.to_wei(value, :ether)
    txn = %{from: from, to: to, value: wei_value}
    IEx.pry
    case __MODULE__.send("personal_sendTransaction", [txn, password]) do
      {:ok, result} ->
        {:ok, result}
      {:error, reason} ->
        {:error, reason}
    end
  end


end
