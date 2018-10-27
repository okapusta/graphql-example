class Festival < Sequel::Model
  plugin :validation_helpers

  many_to_many :artists

  def validate
    @raise_on_save_failure = false
    super
    validates_presence %i(name place)
  end
end
