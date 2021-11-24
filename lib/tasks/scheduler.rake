desc "called by the Heroku scheduler add-on"
task  :test_scheduler => :environment do
    puts Mailr.first.dest_address
end

desc "sending mail"
task :send_mailrs => :environment do

    mailrs = Mailr.where(is_sent: false).where("sending_at <= ?",Time.new)

    mailrs.each do |m|
    
        puts "sending : " + m.dest_address
        #@mailr = m
        MainMailer.remind(m).deliver_now
        m.is_sent = true
        m.save
    
    end

    puts "send_mailrs end."

end