defmodule Exthereum.Web3 do
  use Exthereum.Transport

  @spec get_version :: {:ok, String.t} | {:error, String.t}
  def get_version do
    case send("web3_clientVersion") do
      {:ok, version} ->
        {:ok, version}
      {:error, reason} ->
        {:error, reason}
    end
  end

end
