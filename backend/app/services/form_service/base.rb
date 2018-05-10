# frozen_string_literal: true

module FormService
  class Base < OpenStruct
    include ActiveModel::Validations

    def initialize(params)
      super
      self.params = params
      handle_process
      yield self
    end

    def valid?
      return @valid unless @valid.nil?
      super
    end

    private

      def handle_process
        klass_strong_params = self.class.strong_params
        klass_process_block = self.class.process

        if params.is_a? ActionController::Parameters
          self.strong_params = params.permit(klass_strong_params)
        elsif params.is_a? Hash
          self.strong_params = params.slice(*klass_strong_params)
        end

        if valid?
          begin
            self.instance_eval(&klass_process_block)
          rescue ActiveRecord::RecordInvalid => e
            errors.merge!(e.record.errors)
            @valid = false
          end
        end
      end



      class << self
        def process(&block)
          if block.nil?
            return @process_block
          end
          @process_block = block
        end

        def strong_params(*params)
          if params.empty?
            return @strong_params
          end
          @strong_params = params.map(&:to_s)
        end

        def model_name
          ActiveModel::Name.new(self, nil, "temp")
        end
      end
  end
end
