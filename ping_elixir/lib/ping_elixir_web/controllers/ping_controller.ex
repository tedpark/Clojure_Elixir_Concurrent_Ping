defmodule PingElixirWeb.PingController do
  use PingElixirWeb, :controller

  def index(conn, _params) do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, "{\"get\":\"index\"}")
  end


  def call_apis_async(urls) do
    urls
    |> Task.async_stream(&HTTPoison.get/1)
    |> Enum.into([], fn {:ok, res} -> [res] end)
  end


  def create(conn, %{"urls" => urls}) do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Poison.encode!(Enum.map(call_apis_async(urls), fn num -> %{"url" => num[:ok].request_url, "status" => num[:ok].status_code} end)))
  end

 
end




