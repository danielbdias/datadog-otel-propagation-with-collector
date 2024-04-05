require 'net/http'
require 'ddtrace'

Datadog.configure do |c|
  c.service = ENV['SERVICE_NAME']
  c.logger.level = ::Logger::ERROR

  c.tracing.instrument :rails
  c.tracing.instrument :http

  # List of header formats that should be extracted
  c.tracing.distributed_tracing.propagation_extract_style = [ 'tracecontext' ]
  c.tracing.distributed_tracing.propagation_extract_first = true

  # List of header formats that should be injected
  c.tracing.distributed_tracing.propagation_inject_style = [ 'tracecontext' ]

  c.tracing.distributed_tracing.propagation_style = [ 'tracecontext' ]

  # c.tracing.trace_id_128_bit_generation_enabled = true
end
