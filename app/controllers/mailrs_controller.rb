class MailrsController < ApplicationController
    protect_from_forgery

    def new
    end

    def api_create
        
        json_request = JSON.parse(request.body.read)
        jrs = JSON.parse(request.body.read, {:symbolize_names => true})
        p "json_request => #{jrs}"

        resultBool = hash_ins(jrs)
        if resultBool
            render json: @mailr.inspect.to_json
        else
            ret = {"r":"おや？　何かがおかしいようです…"}
            render json: ret.to_json
        end

    end

    def hash_ins(jrs)
        
        sa = DateTime.new(jrs[:sendingAtYe].to_i,jrs[:sendingAtMo].to_i,jrs[:sendingAtDa].to_i,jrs[:sendingAtHo].to_i,jrs[:sendingAtMi].to_i,0)
        @mailr = Mailr.create(remind_str: jrs[:remindStr],dest_address: jrs[:destAddress],sending_at: sa,is_sent:false)

        if @mailr.save
            MainMailer.confirm(@mailr).deliver_now
            return true
        else
            return false
        end

    end

    def create
        @mailr = Mailr.new(mailr_params)
        @mailr.is_sent = false
        if @mailr.save
            MainMailer.confirm(@mailr).deliver_now
            render plain: params[:mailr].inspect
        else
            render "おや？　何かがおかしいようです…"
        end
    end

    private 
        def mailr_params
            params.require(:mailr).permit(:remind_str,:dest_address,:sending_at,:is_sent)
        end

end
