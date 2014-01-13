Delayed::Worker.destroy_failed_jobs = false
Delayed::Worker.max_attempts = 3
Delayed::Worker.max_run_time = 5.minutes
Delayed::Worker.read_ahead = 10
Delayed::Worker.default_queue_name = 'default'
Delayed::Worker.delay_jobs = not(Rails.env.test?)
Delayed::Worker.logger = Logger.new(File.join(Rails.root, 'log', 'dj.log'))
