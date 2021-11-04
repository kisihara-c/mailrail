class MailrsController < ApplicationController


    def new
    end

    def create
        @mailr = Mailr.new(mailr_params)
        @mailr.save
        render plain: params[:mailr].inspect
    end

    private 
        def mailr_params
            params.require(:mailr).permit(:remind_str,:dest_address,:sending_at,:is_sent)
        end

end
