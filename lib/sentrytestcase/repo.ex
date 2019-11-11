defmodule Sentrytestcase.Repo do
  use Ecto.Repo,
    otp_app: :sentrytestcase,
    adapter: Ecto.Adapters.Postgres
end
