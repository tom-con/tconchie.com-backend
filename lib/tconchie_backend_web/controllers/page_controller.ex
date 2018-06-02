defmodule TconchieBackendWeb.PageController do
  use TconchieBackendWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
