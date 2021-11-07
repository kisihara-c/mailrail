desc "called by the Heroku scheduler add-on"
task  :test_scheduller => :enviroiment do
    puts "scheduller test"
end

task :send_mailrs => :enviroiment do

    mailrs = Mailr.where(is_sent: false).where(sending_at <= Time.new)
    
    mailrs.each do |mailr|
    
        mail to: mailr.dest_address, subject: "test"
        mailr.is_sent = true
        mailr.save
    
    end

    puts "send_mailrs end."

end