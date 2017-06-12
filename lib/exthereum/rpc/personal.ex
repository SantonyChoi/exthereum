defmodule Exthereum.Personal do
  use Exthereum.Transport

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


end
