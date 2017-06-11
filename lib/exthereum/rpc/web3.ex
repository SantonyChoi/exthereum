defmodule Exthereum.Web3 do
  use Exthereum.Transport

  @spec client_version :: {:ok, String.t} | {:error, String.t}
  def client_version do
    case send("web3_clientVersion") do
      {:ok, version} ->
        {:ok, version}
      {:error, reason} ->
        {:error, reason}
    end
  end

  @spec sha3(String.t) :: {:ok, float} | {:error, String.t}
  def sha3(str) do
    case __MODULE__.send("web3_sha3",[str]) do
      {:ok, sha} ->
        {:ok, sha}
      {:error, reason} ->
        {:error, reason}
    end
  end

  #curl -X POST --data '{"jsonrpc":"2.0","method":"web3_sha3","params":["0x68656c6c6f20776f726c64"],"id":64}' localhost:8545

end
