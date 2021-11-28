require 'test_helper'

class MailrsControllerTest < ActionDispatch::IntegrationTest
  
  test "ins_normal" do
    mc = MailrsController.new
    dt = DateTime.new(2012,1,1,1,1,1)
    mc.hash_ins({
        destAddress:'test@example.com',sendingAtYe:'2000',sendingAtMo:'1',sendingAtDa:'1',
        sendingAtHo:'1',sendingAtMi:'1',remindStr:'test'
      })

    p Mailr.last
    assert(Mailr.last.dest_address == 'test@example.com')
    assert(Mailr.last.remind_str == 'test')

  end
  
  test "json_val_alert_normal" do

    mc = MailrsController.new
    res = mc.json_val_alert({
        sendingAtYe:'2000',sendingAtMo:'1',sendingAtDa:'1'
      })

    assert(res == false)

  end
  
  test "json_val_alert_exeption_day30-31" do

    mc = MailrsController.new

    res = mc.json_val_alert({
        sendingAtYe:'2000',sendingAtMo:'2',sendingAtDa:'30'
      })
    assert(res == true)
    
    res = mc.json_val_alert({
        sendingAtYe:'2000',sendingAtMo:'2',sendingAtDa:'31'
      })
    assert(res == true)
    
    res = mc.json_val_alert({
        sendingAtYe:'2000',sendingAtMo:'4',sendingAtDa:'31'
      })
    assert(res == true)
    
    res = mc.json_val_alert({
        sendingAtYe:'2000',sendingAtMo:'6',sendingAtDa:'31'
      })
    assert(res == true)
    
    res = mc.json_val_alert({
        sendingAtYe:'2000',sendingAtMo:'9',sendingAtDa:'31'
      })
    assert(res == true)

  end
  
  test "json_val_alert_exeption_day0229" do

    mc = MailrsController.new

    res = mc.json_val_alert({
        sendingAtYe:'1999',sendingAtMo:'2',sendingAtDa:'29'
      })
    assert(res == true)

    res = mc.json_val_alert({
        sendingAtYe:'1996',sendingAtMo:'2',sendingAtDa:'29'
      })
    assert(res == false)
    
    res = mc.json_val_alert({
        sendingAtYe:'2000',sendingAtMo:'2',sendingAtDa:'29'
      })
    assert(res == false)
    
    res = mc.json_val_alert({
        sendingAtYe:'1900',sendingAtMo:'2',sendingAtDa:'29'
      })
    assert(res == true)

  end



end
