Task.Supervisor.async_stream_nolink(
  SentrytestcaseWeb.TemporaryTaskSupervisor,
  1..1000,
  fn item ->
    IO.puts("processing item #{item}")
    raise("runtime error")
  end,
  timeout: 120_000,
  max_concurrency: 2
)
|> Stream.run()
