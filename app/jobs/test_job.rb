class TestJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    puts "Tarea en segundo plano ejecutada con éxito"
  end
end
