module Fog
  module AWS
    class IAM
      class Real

        require 'fog/aws/parsers/iam/create_access_key'

        # Create a access keys for user (by default detects user from access credentials)
        # 
        # ==== Parameters
        # * user_name<~String> - optional: name of the user to create (do not include path)
        #
        # ==== Returns
        # * response<~Excon::Response>:
        #   * body<~Hash>:
        #     * 'User'<~Hash>:
        #       * 'AccessKey'<~String> -
        #       * 'Username'<~String> -
        #       * 'SecretAccessKey'<~String> -
        #       * 'Status'<~String> -
        #     * 'RequestId'<~String> - Id of the request
        #
        # ==== See Also
        # http://docs.amazonwebservices.com/IAM/latest/APIReference/API_CreateAccessKey.html
        #
        def create_access_key(user_name = nil)
          params = {
            'Action'    => 'CreateAccessKey',
            :parser     => Fog::Parsers::AWS::IAM::CreateAccessKey.new
          }
          if user_name
            params['UserName'] = user_name
          end
          request(params)
        end

      end

      class Mock

        def create_access_key(user_name = nil)
          Fog::Mock.not_implemented
        end

      end
    end
  end
end
