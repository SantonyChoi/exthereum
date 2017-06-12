defmodule Exthereum.Personal do
@moduledoc """
This could be considered dangerous as it requires the admin api to be exposed over JSON-RPC
but I am doing it anyway.
"""
  @spec new_account(String.t, String.t) :: String.t
  def new_account(password, password_confirmation) do
    # --rpcapi "db,eth,net,web3,personal"
    # curl -X POST --data '{"jsonrpc":"2.0","method":"personal_newAccount","params":["password"],"id":1}' localhost:8545
    # {"id":1,"jsonrpc":"2.0","result":"0x05ca0ddf7e7506672f745b2b567f1d33b7b55f4f"}
    "account_hash"
  end

end
