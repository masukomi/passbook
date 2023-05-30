require "passbook/version"
require "passbook/pkpass"
require "passbook/signer"
require 'active_support/core_ext/module/attribute_accessors'
require 'passbook/push_notification'
require 'grocer'
require 'rack/passbook_rack'

module Passbook
  mattr_accessor :certificate,
                 :password,
                 :apple_intermediate_cert,
                 :rsa_private_key,
                 :notification_cert,
                 :notification_gateway,
                 :notification_passphrase

  def self.configure
    yield self
  end

  def self.configuration
    {
      certificate: certificate,
      password: (password.present? ? '[redacted]' : 'MISSING PASSWORD'),
      apple_intermediate_cert: apple_intermediate_cert,
      rsa_private_key: rsa_private_key,
      notification_cert: notification_cert,
      notification_gateway: notification_gateway,
      notification_passphrase: (notification_passphrase.present? ? '[redacted]' : 'NO NOTIFICATION PASSPHRASE')
    }
  end
end
