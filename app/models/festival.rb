class Festival < Sequel::Model
  plugin :validation_helpers

  def validate
    @raise_on_save_failure = false
    super
    validates_presence %i(name place)
  end
end
