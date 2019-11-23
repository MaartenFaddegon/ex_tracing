defmodule ExTracing do

  use OC.Patterns
  require Logger

  @msg "This is a test message."

  def run_bench do
    Benchee.run(%{
      "baseline" => fn -> hash @msg end,
      "logging"  => fn -> hash_lg @msg end,
      "tracing"  => fn -> hash_tr @msg end
    },
    formatters: [
     {Benchee.Formatters.HTML, file: "samples_output/my.html"},
      Benchee.Formatters.Console
    ]
    )
  end

  ############################################################
  # Baseline

  def hash(s) do
    md5sum(s) |> base64()
  end

  def md5sum(s) do
    :crypto.hash(:md5, s)
  end

  def base64 (s) do
    Base.encode64(s)
  end

  ############################################################
  # Tracing

  trace hash_tr(s), ctx do
    annotate(ctx, [s])
    r = md5sum_tr(s, ctx) |> base64_tr(ctx)
    annotate(ctx, [r])
    r
  end

  ntrace md5sum_tr(s, parent_ctx), ctx do
    annotate(ctx, [s])
    r = :crypto.hash(:md5, s)
    annotate(ctx, [r])
    r
  end

  ntrace base64_tr(s, parent_ctx), ctx do
    annotate(ctx, [s])
    r = Base.encode64(s)
    annotate(ctx, [r])
    r
  end

  ############################################################
  # Logging

  def hash_lg(s) do
    r = md5sum_lg(s) |> base64_lg()
    Logger.info "hash(#{inspect s}) -> #{inspect r}"
    r
  end

  def md5sum_lg(s) do
    r = :crypto.hash(:md5, s)
    Logger.info "md5sum(#{inspect s}) -> #{inspect r}"
    r
  end

  def base64_lg (s) do
    r = Base.encode64(s)
    Logger.info "base64(#{inspect s}) -> #{inspect r}"
    r
  end

end
