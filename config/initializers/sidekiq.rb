Sidekiq.configure_server do |config|
  config.on(:startup) do

    schedule = YAML.load_file(Rails.root.join('config/sidekiq.yml'))['scheduler']&.fetch('schedule', {})
    Sidekiq.schedule = schedule if schedule.present?
    Sidekiq::Scheduler.reload_schedule!
  end

  config.redis = { url: 'redis://localhost:6379/0', size: 10, pool_name: 'internal' }
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://localhost:6379/0', size: 10, pool_name: 'internal' }
end
