defmodule Exthereum.Web3 do
  use Exthereum.Sender
  alias Exthereum.Conversion
  require IEx

  @spec get_version :: {:ok, String.t} | {:error, String.t}
  def get_version do
    case __MODULE__.send("web3_clientVersion") do
      {:ok, version} ->
        {:ok, version}
      {:error, reason} ->
        {:error, reason}
    end
  end

end
