defmodule SentrytestcaseWeb.PageController do
  use SentrytestcaseWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
