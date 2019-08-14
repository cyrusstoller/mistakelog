desc "Send reminder emails to users with mistakes that still need reflection"
task :send_notifications, [:verbose] => :environment do |t, args|
  args.with_defaults(verbose: false)
  puts "Sending reminder emails"

  batch_size = 1000
  batch_num = 1 if args.verbose

  puts "Total number of batches: #{User.count / batch_size + 1}" if args.verbose
  User.find_in_batches(batch_size: batch_size) do |batch|
    if args.verbose
      puts "Batch ##{batch_num}"
      batch_num += 1
    end

    batch.each do |user|
      # send email
      NotificationMailer.with(user: user).reminder.deliver_now
    end
  end
end
