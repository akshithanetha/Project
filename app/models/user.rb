class User < ApplicationRecord
  def send_passcode
    response = TwoFactor.send_passcode(mobile)
    if response['Status'].downcase == 'success'
      update_column(:session_key, response['Details'])
      true
    end
  end

  def verify_passcode(passcode)
   TwoFactor.verify_passcode(session_key, passcode)['Status'].downcase == 'success'
  end
end
