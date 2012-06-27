require 'net/http'
require 'php_serialize'

module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module PayuIn

        # PayU.in provides web services to help you with reconciliation of your transactions in real time.
        class WebService < Hash

          # Add helper method to make api calls using ssl_post, ssl_get
          include PostsData

          # Whether the invoice is success or not
          # Invoice id is required when multiple invoices are queried at once
          def complete?( invoice_id = nil )
            status( invoice_id ).to_s.downcase == 'success'
          end

          # Whether the invoice is pending confirmation
          # Invoice id is required when multiple invoices are queried at once
          def pending?( invoice_id = nil )
            status( invoice_id ).to_s.downcase == 'pending'
          end

          # Returns the payment status of the invoice
          # invoice_id is required if multiple invoices are queried at once
          def status( invoice_id = nil )
            ( invoice_id ? self[ invoice_id.to_s ] : self )[ 'status']
          end

          # Returns whether the order amount and order discount matches
          # generally in third party shopping carts order discount is handle by the application
          # and should generally by 0.0
          def amount_ok?( order_amount, order_discount = BigDecimal.new( '0.0' ), invoice_id = nil )
            hash = ( invoice_id ? self[ invoice_id.to_s ] : self )
            ( BigDecimal.new( hash[ 'amt' ] ) == order_amount ) && ( BigDecimal.new( hash[ 'disc' ] ) == order_discount )
          end

          # Returns whether the nett amount after reducing the discounts
          def nett_amount( invoice_id = nil )
            hash = ( invoice_id ? self[ invoice_id.to_s ] : self )
            BigDecimal.new( hash[ 'amt' ] ) - BigDecimal.new( hash[ 'disc' ] )
          end

          # Returns the PayU.in transaction if for the invocie
          # invoice_id is required if multiple invoices are queried at once
          def transaction_id( invoice_id = nil )
            ( invoice_id ? self[ invoice_id.to_s ] : self )[ 'mihpayid']
          end

          # Makes verify payment API call to PayU.in web service
          # Params - any number of invoice ids ( provided by the merchant )
          def self.verify_payment( *invoice_ids )
            invoice_string = invoice_ids.join( '|' )
            checksum = PayuIn.checksum( 'verify_payment', invoice_string )
            new.web_service_call( :command => 'verify_payment', :var1 => invoice_string, :hash => checksum, :key => PayuIn.merchant_id )
          end

          # Makes check payment API call to PayU.in web service
          # Params - PayU.in transaction id
          def self.check_payment( payu_id )
            checksum = PayuIn.checksum( 'check_payment', payu_id )
            new.web_service_call( :command => 'check_payment', :var1 => payu_id, :hash => checksum, :key => PayuIn.merchant_id )
          end

          # Utility method which makes the web service call and
          # parse the response into WebService object
          def web_service_call( params = {} )
            payload_hash = ActiveMerchant::PostData.new
            payload_hash.merge!( params )
            payload = payload_hash.to_post_data
            response = PHP.unserialize(
              ssl_post(
                PayuIn.web_service_url, payload,
                'Content-Length' => "#{payload.size}",
                'User-Agent'     => "Active Merchant -- http://activemerchant.org"
              )
            )
            merge!( response["transaction_details"] && response["transaction_details"].size == 1 ? response["transaction_details"].values.first : ( response["transaction_details"] || { :status => response['msg'] } ) )
          end

        end
      end
    end
  end
end
